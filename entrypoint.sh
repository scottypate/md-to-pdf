#!/usr/bin/env bash
find . -name '*.md' > filelist.dat

while read file
do
  base_name=$( echo "${file}" | basename "${file}" | sed -e 's/\.md//g')
  pandoc -f markdown ${file} -o ${PDF_DIR}/${base_name}.pdf
  ls -Rhl
done < filelist.dat

rm filelist.dat