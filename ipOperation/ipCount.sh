#!/bin/sh

cat a.txt | awk '{print $1}' | sort | uniq > ipA.txt

cat b.txt | awk '{print $1}' | sort | uniq > ipB.txt

numA=`wc -l ipA.txt | awk '{print $1}'`
numB=`wc -l ipB.txt | awk '{print $1}'`

echo "There are $numA ip in a.txt"
echo "There are $numB ip in b.txt"

cat ipA.txt ipB.txt > ip.txt
totalNum=`sort -u ip.txt | wc -l`

echo "There are total $totalNum ip"
