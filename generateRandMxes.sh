#!/bin/bash -eux

pushd `dirname $0` > /dev/null
baseDir=`pwd -P`
popd > /dev/null
username=`whoami`

p=2.0     # amount of noise to be added, a number
K=10      # number of output matrices, positive integer
seedFrom=33   # a random seed to start from; to get repeatable runs
outDir=/home/${username}/noisifiedMatrices/seed${seedFrom}     # out path for random matrices
inputMx=${baseDir}/data/sampledata1.csv     # input matrix to be perturbated


mkdir -p ${outDir}
R --vanilla --slave --args ${inputMx} ${K} ${p} ${seedFrom} ${outDir} < ${baseDir}/noisifyMatrix.R

