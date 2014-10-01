#!/usr/bin/Rscript

args <- commandArgs(trailingOnly = TRUE)

inMxPath <- args[1]
numOfMatrices <- as.integer(args[2])
p <- args[3]
seedStart <- as.integer(args[4])
outPath <- args[5]


if (!exists("generateNoisifiedMatrices", mode="function")) source("noisifyMatrixUtil.R")

print(c("Running! params: " , inMxPath, numOfMatrices, seedStart, p, outPath))

generateNoisifiedMatrices(inMxPath, numOfMatrices, seedStart, p, outPath)
