#!/usr/bin/env python3
"""Aponta no texto de um post os padrões que costumam denunciar texto gerado por IA.

Uso: checar-texto.py <arquivo>
Saída: uma linha por achado. Código 0 sem achados, 1 com achados, 2 em erro de uso.
É um alerta, não um veto: o voz.md do autor decide o que é hábito dele.
"""
import re
import statistics
import sys
from pathlib import Path

LINKEDIN_MAX_CHARS = 3000
MAX_EM_DASHES = 1
MAX_EMOJIS = 3
MAX_HASHTAGS = 5
MIN_PARAGRAPHS_FOR_RHYTHM = 5
# Desvio/média do tamanho dos parágrafos abaixo disso = todos parecidos demais.
MIN_PARAGRAPH_VARIATION = 0.25

AI_WORDS = [
    "robust", "crucial", "potencializ", "alavanc", "jornada", "mergulh",
    "desvend", "desbloque", "revolucion", "transformador", "game changer", "sinergia",
    "holístic", "paradigma", "fascinante", "poderos", "imprescindível", "primordial",
    "no mundo atual", "nos dias de hoje", "cada vez mais", "em suma", "vale ressaltar",
    "é importante ressaltar", "é importante destacar", "vale a pena destacar",
    "sem sombra de dúvidas", "no cenário atual", "elevar o nível", "o segredo é",
]
GENERIC_OPENINGS = re.compile(
    r"^(você sabia|no mundo|em um mundo|num mundo|vamos (falar|mergulhar|entender)|"
    r"hoje (vamos|quero falar)|se você é|imagine)", re.IGNORECASE)
NOT_X_BUT_Y = re.compile(
    r"\bnão (é|se trata de|foi) (só|apenas|somente|sobre)?\b.{1,60}?[,;—-]\s*(é|mas|e sim)\b",
    re.IGNORECASE)
TRIAD = re.compile(r"\b([a-záéíóúâêôãõç]{4,}), ([a-záéíóúâêôãõç]{4,}) e ([a-záéíóúâêôãõç]{4,})\b",
                   re.IGNORECASE)
# Tríade de IA é de adjetivos ("robusto, escalável e confiável"); lista de substantivos
# ("merchant, categoria e país") é conteúdo e não deve ser apontada.
ADJECTIVE_ENDING = re.compile(r"(vel|oso|osa|ivo|iva|ente|ante|ico|ica|sto|sta|ples|ido|ida|eto|eta)$",
                              re.IGNORECASE)
MIN_ADJECTIVES_IN_TRIAD = 2
MORAL_CLOSING = re.compile(
    r"^(no fim|no final|no fim das contas|no final das contas|em resumo|resumindo|"
    r"lembre-se|a lição|moral)", re.IGNORECASE)
EMOJI = re.compile("[\U0001F300-\U0001FAFF☀-➿⭐✅]")
UNICODE_STYLED = re.compile("[\U0001D400-\U0001D7FF]")
HASHTAG = re.compile(r"(?<!\w)#\w+")


def find_issues(text: str) -> list[str]:
    issues: list[str] = []
    lines = text.splitlines()

    def report(line_number: int, kind: str, detail: str) -> None:
        issues.append(f"linha {line_number}: [{kind}] {detail}")

    if len(text) > LINKEDIN_MAX_CHARS:
        issues.append(f"[tamanho] {len(text)} caracteres; o LinkedIn aceita {LINKEDIN_MAX_CHARS}")

    first = next(((i, l.strip()) for i, l in enumerate(lines, 1) if l.strip()), None)
    if first and GENERIC_OPENINGS.match(first[1]):
        report(first[0], "abertura genérica", first[1][:80])

    em_dash_lines = [i for i, l in enumerate(lines, 1) if "—" in l]
    if len(em_dash_lines) > MAX_EM_DASHES:
        for i in em_dash_lines:
            report(i, "travessão", "troque por vírgula, ponto ou parênteses")

    for i, line in enumerate(lines, 1):
        lower = line.lower()
        for word in AI_WORDS:
            if word in lower:
                report(i, "palavra de IA", f"'{word}…' em: {line.strip()[:80]}")
        if NOT_X_BUT_Y.search(line):
            report(i, "não é X, é Y", line.strip()[:80])
        for match in TRIAD.finditer(line):
            if sum(bool(ADJECTIVE_ENDING.search(w)) for w in match.groups()) < MIN_ADJECTIVES_IN_TRIAD:
                continue
            report(i, "tríade", f"'{match.group(0)}' — precisa dos três?")
        if UNICODE_STYLED.search(line):
            report(i, "negrito Unicode", "leitor de tela não lê; use texto normal")

    # Emoji no início da linha é marcador de lista (🔹 1.), não enfeite.
    emoji_count = sum(len(EMOJI.findall(line.lstrip()[1:])) for line in lines)
    if emoji_count > MAX_EMOJIS:
        issues.append(f"[emoji] {emoji_count} emojis; mantenha no máximo {MAX_EMOJIS}")

    hashtag_count = len(HASHTAG.findall(text))
    if hashtag_count > MAX_HASHTAGS:
        issues.append(f"[hashtags] {hashtag_count}; use no máximo {MAX_HASHTAGS}")

    paragraphs = [p for p in re.split(r"\n\s*\n", text) if p.strip() and not HASHTAG.fullmatch(p.strip())]
    if paragraphs:
        last = paragraphs[-1].strip()
        if HASHTAG.match(last) and len(paragraphs) > 1:
            last = paragraphs[-2].strip()
        if MORAL_CLOSING.match(last):
            issues.append(f"[fechamento com moral] {last[:80]} — o post precisa dessa frase?")

    sizes = [len(p.split()) for p in paragraphs]
    if len(sizes) >= MIN_PARAGRAPHS_FOR_RHYTHM:
        variation = statistics.pstdev(sizes) / statistics.mean(sizes)
        if variation < MIN_PARAGRAPH_VARIATION:
            issues.append(f"[ritmo] {len(sizes)} parágrafos de tamanho quase igual "
                          f"({min(sizes)}–{max(sizes)} palavras); varie: uma frase solta, um bloco maior")
    return issues


def main() -> int:
    if len(sys.argv) != 2:
        print(f"uso: {sys.argv[0]} <arquivo>", file=sys.stderr)
        return 2
    path = Path(sys.argv[1])
    if not path.is_file():
        print(f"arquivo não encontrado: {path}", file=sys.stderr)
        return 2
    issues = find_issues(path.read_text(encoding="utf-8"))
    for issue in issues:
        print(issue)
    print(f"{len(issues)} achado(s)" if issues else "nenhum padrão de IA encontrado")
    return 1 if issues else 0


if __name__ == "__main__":
    sys.exit(main())
