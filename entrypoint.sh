#!/usr/bin/env bash
find . -name '*.md' > filelist.dat

while read file
do
  base_name=$( echo "${file}" | basename "${file}" | sed -e 's/\.md//g')
  pandoc -f markdown ${file} -o ${PDF_DIR}/${base_name}.pdf
done < filelist.dat

rm filelist.dat