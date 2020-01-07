#!/bin/bash

for tst in *.tst
do
	echo $tst
	../../tools/HardwareSimulator.sh $tst
done
