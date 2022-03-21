#!/bin/bash

set -ex

mkdir -p $1

../build/pdpcComputeMultiScaleFeatures -v -i "../data/my_pcd/"$1".ply" -o $1"/"$1
../build/pdpcSegmentation -v -i "../data/my_pcd/"$1".ply" -s $1"/"$1"_scales.txt" -f $1"/"$1"_features.txt" -o $1"/"$1

../build/pdpcPostProcess -i "../data/my_pcd/"$1".ply" -s $1"/"$1"_seg.txt" -c $1"/"$1"_comp.txt" -o $1"/"$1"_range" -col v -range 0 9 10 19 20 29 30 39 40 49
../build/pdpcPostProcess -i "../data/my_pcd/"$1".ply" -s $1"/"$1"_seg.txt" -c $1"/"$1"_comp.txt" -o $1"/"$1"_pers" -col -v -pers 10 15 20 25 30 35 40
../build/pdpcPostProcess -i "../data/my_pcd/"$1".ply" -s $1"/"$1"_seg.txt" -c $1"/"$1"_comp.txt" -o $1"/"$1"_col" -col -v -scales 5 10 15 20 25 30 35