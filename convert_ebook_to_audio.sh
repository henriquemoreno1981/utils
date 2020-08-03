#!/bin/bash
filename="$1"
filenameOnly=$(echo "$filename" | cut -f 1 -d '.')
textFile="${filenameOnly}.txt"
audioFile="${filenameOnly}.aiff"
echo convertendo $filename
ebook-convert "$filename" "$textFile" > /dev/null
voice="Felipe"
if [[ -z "$2" ]];
then
	voice="Felipe"
fi
echo transformando em "${audioFile}"
say --progress -f "${textFile}" -o "${audioFile}" -v "$voice" 
rm "${textFile}"
echo "Fim."
