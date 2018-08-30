#!/bin/bash
names=()
rm umbrella-location.dat
for i in {1..21}
do
	head -21 $i"-struct/pullx-umbrella.xvg" |tail -1| awk '{print $3}'>>"umbrella-location.dat"
done

