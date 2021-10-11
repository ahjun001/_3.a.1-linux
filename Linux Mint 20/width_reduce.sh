#!/usr/bin/env sh
# cp -vf ../tmp_source/i.* .
for file in *.jpg *.png *.gif *.jpeg; do
  # echo "$file"
  width=`convert "$file[0]" -format '%w' info:`
  # echo "width =" $width
  if [ "$width" -gt 340 ]; then
    mv "$file" "$file.tmp"
    ffmpeg -i "$file.tmp" -v 0 -vf scale=340:-1 "$file"
    echo "$file width ="`convert "$file[0]" -format '%w' info:`
    rm "$file.tmp"
  fi

done