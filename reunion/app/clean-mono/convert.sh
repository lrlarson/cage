#!/bin/bash
for i in *.wav; do
	echo neroAacEnc -if $i -of ${i%%.*}.mp4
	echo lame -V 5 $i ${i%%.*}.mp3
	echo oggenc -q 3 -o ${i%%.*}.ogg $i
done