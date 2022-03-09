#!/bin/bash

set -ex

mkdir -p $1

../build/pdpcComputeMultiScaleFeatures -v -i "../data/my_pcd/"$1".ply" -o $1"/"$1
../build/pdpcSegmentation -v -i "../data/my_pcd/"$1".ply" -s $1"/"$1"_scales.txt" -f $1"/"$1"_features.txt" -o $1"/"$1

../build/pdpcPostProcess -i "../data/my_pcd/"$1".ply" -s $1"/"$1"_seg.txt" -c $1"/"$1"_comp.txt" -o $1"/"$1 -col -v -range 20 24 25 30 40 42