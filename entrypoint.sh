#!/usr/bin/env bash

- find . -name '*.md' -exec sh -c 'pandoc $0 -f markdown -t docx -o $0.docx' {} \;
- find . -name '*.md' -exec sh -c 'kramdown $0 --output pdf > $0.pdf' {} \;
ls