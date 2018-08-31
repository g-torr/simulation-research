#!/bin/bash
names=()
for i in {4..25}
do
	names+=$i"-struct/umbrella.gro "
done
vmd $names
#vmd 1-struct/umbrella.gro 2-struct/umbrella.gro 

