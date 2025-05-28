#!bin/bash

n1=100
n2=339

timestamp=$(date)
echo "job ran at $timestamp"
sum= $(($n1+$n2))
echo "sum of $n1 & $n2 veriables is :$sum"