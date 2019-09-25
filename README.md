# Markdown to PDF Action	

This action will find any markdown, .md, files and generate a .pdf file. This action can be used in conjunction with a commit action to add the generated .pdf back to the repository.

## Example
```
name: Convert PDF to Markdown
on: 
  push:
    paths:
      # Use this parameter to limit which .md files are converted.
      - '*.md'

jobs:
  convert_md: 
    runs-on: ubuntu-latest
    steps:
    # We must checkout the latest version of the code to get a copy of all .md files
    - uses: actions/checkout@master
      with:
        fetch-depth: 1
    - uses: scottypate/md-to-pdf@master
      env: {
      	# Use this parameter to determine where the generated .pdf will be stored.
        PDF_DIR: './pdfs'
      }
```      