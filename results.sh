#!/bin/bash

make clean

export kind=4
make

out/main4  >> result4.csv

export kind=8
make
out/main8 >> result8.csv


export kind=16
make
out/main16 >> result16.csv
