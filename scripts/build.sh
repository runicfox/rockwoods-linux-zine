#!/bin/bash
set -e

ISSUE=${1:-issue-01}
echo "Building $ISSUE..."

mkdir -p output

pandoc content/$ISSUE/*.md \
  --from markdown \
  --template=templates/zine-template.tex \
  --metadata-file=templates/metadata.yaml \
  --pdf-engine=xelatex \
  -o output/$ISSUE.pdf

echo "✅ Build complete: output/$ISSUE.pdf"

