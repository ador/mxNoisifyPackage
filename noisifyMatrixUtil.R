#!/usr/bin/Rscript

generateNoisifiedMatrices <- function(inputMx, num, seedFrom, perturbIntensity, outDir) {
  # print("We'll be writing data into:")
  # print(outDir)
  for (s in seedFrom:(seedFrom + num - 1)) {
    tmpMx <- Noisify(inputMx, perturbIntensity, as.numeric(s))
    filename <- paste(outDir, "/rndmx-", s, ".aamx", sep="")
    myWriter <- file(filename, "w")
    writeHeaderRows(myWriter, s)
    write.table(tmpMx, file=filename, quote=FALSE, append = TRUE, col.names = FALSE)
    close(myWriter)
  }
}
