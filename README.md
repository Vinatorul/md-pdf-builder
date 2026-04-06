# Document Builder

This repository contains tools for building PDF documents from Markdown sources with Mermaid diagram support.

## Prerequisites

### Required Dependencies

1. **Pandoc** (version 3.0+)
   - macOS: `brew install pandoc`
   - Linux: `apt-get install pandoc` or download from [pandoc.org](https://pandoc.org/installing.html)

2. **LaTeX Distribution** (for PDF generation)
   - macOS: `brew install --cask mactex-no-gui` or `brew install basictex`
   - Linux: `apt-get install texlive-xetex texlive-fonts-recommended`

3. **Mermaid Filter** (for diagram rendering)

   ```bash
   npm install -g mermaid-filter
   ```

   Or using yarn:

   ```bash
   yarn global add mermaid-filter
   ```

4. **Puppeteer dependencies** (required by mermaid-filter)
   - macOS: Usually works out of the box
   - Linux: May need additional packages

     ```bash
     apt-get install -y chromium-browser
     ```

### Verify Installation

```bash
pandoc --version
xelatex --version  # or pdflatex --version
mermaid-filter --version
```

## Usage

### Building Documents

Use the Makefile to build documents:

```bash
# Build organizational structure document
make org

# Build AI transformation report
make report
```

### Output

Generated files are placed in the `build/` subdirectory of each document folder:

- `build/*.md` - Combined markdown file
- `build/*.pdf` - Final PDF document

## Creating a New Document Set

### Step 1: Create Directory Structure

```bash
mkdir my-document
```

### Step 2: Create Source Files

Create your markdown files in the document directory:

```bash
touch my-document/intro.md
touch my-document/chapter-1.md
touch my-document/conclusion.md
```

### Step 3: Create Manifest File

Create `my-document/manifest.txt` listing source files in order:

```
intro.md
chapter-1.md
conclusion.md
```

### Step 4: Create Metadata File

Create `my-document/metadata.yaml` with PDF settings:

```yaml
lang: ru-RU
toc: false
toc-depth: 2
number-sections: false
colorlinks: false
geometry:
  - margin=1in
fontsize: 11pt
mainfont: Arial Unicode MS
monofont: Arial Unicode MS
header-includes:
  - |
    ```{=latex}
    \pagestyle{plain}
    ```
include-before:
  - |
    \begin{titlepage}
    \centering
    \vspace*{3cm}
    {\Huge\bfseries My Document Title\par}
    \vspace{1cm}
    {\Large Subtitle\par}
    \vfill
    \end{titlepage}
    \tableofcontents
    \newpage
```

### Step 5: Create Build Script

Create `my-document/build.sh`:

```bash
#!/bin/zsh
set -euo pipefail

SCRIPT_DIR="${0:A:h}"
MANIFEST="$SCRIPT_DIR/manifest.txt"
METADATA="$SCRIPT_DIR/metadata.yaml"
OUTPUT_DIR="$SCRIPT_DIR/build"
OUTPUT_FILE="$OUTPUT_DIR/document.pdf"
TMP_FILE="$OUTPUT_DIR/document.md"

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
```

Make it executable:

```bash
chmod +x my-document/build.sh
```

### Step 6: Add to Makefile

Add a new target to the root `Makefile`:

```makefile
.PHONY: my-document

my-document:
	./my-document/build.sh
```

**Note:** `.PHONY` declares that `my-document` is not a file target, so Make will always run the command even if a file named `my-document` exists.

### Step 7: Build

```bash
make my-document
```
