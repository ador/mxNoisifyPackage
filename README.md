mxNoisifyPackage
================

## The task

The problem to solve is to add some random noise to a matrix,
to get K slightly different matrices from the original one.

### Inputs:
- inputPath: a path to a .csv file with a matrix: a header row and M x N numbers
- K: how many different random matrices we need
- p: the amount of noise to be added (uniform random variable should be generated for each position in the matrix independently between -p and +p)
- outPath: a directory to write the new matrices into in csv format, and a new header that should contain the p value and the random seed that was used.

### Substeps (suggested functions): 
- read in matrix data from a csv file
- add random uniform noise to a matrix with any dimensions (random seed should be a parameter)
- a loop to repeat the random noise generation K times
- write a noisified matrix to a path, with an extra row as a first row starting with '#', then the original header row, then the noisified data

### How to run:
./generateRandMxes.sh


## Hints

#### To read in a matrix:

```R
inDataTable <- read.table(inoutMxPath, skip=1)   # skipping header row
inputMx <- as.matrix(inDataTable)
```

#### To write a matrix into a file:

```R
myWriter <- file(outFilename, "w")
write("# First row of file", myWriter)
write("# Second row of file", myWriter, append = TRUE)
write.table(myNoisyMatrix, file=outFilename, quote=FALSE, append = TRUE, col.names = FALSE)
close(myWriter)
```

## Optional tasks:
- Give an error when the input file does not contain a header, or contains non-number items, or is otherwise inconsistent (not M x N numbers)
- Write a test: ./testGenRandMxes.sh , it should call another R script that gets two input paths (the original matrix and the directory with the noisified matrices) and a p value, and checks if the random noise falls within an acceptable range
- Turn the existing R codes into an R package and use testthat for testing
