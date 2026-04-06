#!/bin/zsh
set -euo pipefail

SCRIPT_DIR="${0:A:h}"
MANIFEST="$SCRIPT_DIR/org-manifest.txt"
METADATA="$SCRIPT_DIR/org-metadata.yaml"
OUTPUT_DIR="$SCRIPT_DIR/build"
OUTPUT_FILE="$OUTPUT_DIR/org.pdf"
TMP_FILE="$OUTPUT_DIR/org.md"

mkdir -p "$OUTPUT_DIR"

if ! command -v pandoc >/dev/null 2>&1; then
  echo "pandoc is not installed" >&2
  exit 1
fi

PDF_ENGINE=""
if command -v xelatex >/dev/null 2>&1; then
  PDF_ENGINE="xelatex"
elif command -v pdflatex >/dev/null 2>&1; then
  PDF_ENGINE="pdflatex"
else
  echo "No LaTeX PDF engine found. Install xelatex or pdflatex." >&2
  exit 1
fi

: > "$TMP_FILE"

while IFS= read -r file || [[ -n "$file" ]]; do
  [[ -z "$file" ]] && continue
  SOURCE_FILE="$SCRIPT_DIR/$file"
  if [[ ! -f "$SOURCE_FILE" ]]; then
    echo "Missing file from manifest: $SOURCE_FILE" >&2
    exit 1
  fi

  cat "$SOURCE_FILE" >> "$TMP_FILE"
  printf '\n\n\\newpage\n\n' >> "$TMP_FILE"
done < "$MANIFEST"

pandoc \
  --from markdown \
  --metadata-file "$METADATA" \
  --pdf-engine="$PDF_ENGINE" \
  --filter mermaid-filter \
  --output "$OUTPUT_FILE" \
  "$TMP_FILE"

echo "Generated $OUTPUT_FILE"
