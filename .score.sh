#!/bin/bash
SCORE=0
PASS=0
TOTAL_TESTS=2

cqlsh -e "describe keyspaces;" > keyspaces.txt;
if(($(grep -io "mykeyspace" keyspaces.txt | wc -l)==1)); then PASS=$((PASS+1)); fi;

cqlsh -e "select * from mykeyspace.charge;" > charge.txt
if(($(grep -io -e 1 -e 2 -e "id" -e "count" -e 50 -e 30 -e "Washing Machines" -e "Cookers" -e "product_name" charge.txt | wc -l)>=10)); then PASS=$((PASS+1)); fi;

SCORE=$((PASS*100 / TOTAL_TESTS))
echo "FS_SCORE:$SCORE%"
