library(seqinr)
library(stringr)
library(plyr)

# To-do
# Replace for loops with plyr functions or *apply


# Retrieve protein sequences from UniProt using Accession #'s 
getProtSequence <- function(AC){
  choosebank("swissprot")
  seq.list <- getSequence(query("data", paste0("AC=", AC, collapse = NULL)))
  seq.dataframe <- c2s(seq.list[[1]])
  return(seq.dataframe)
}

# Retrieve accession #'s and store in a list 
data <- as.list(scan("/home/steve/Downloads/rosalind_mprt.txt", what=""))

#Retrieve protein sequences and store in an array
seque <- laply(data, getProtSequence)

#Intialize a list 
dd <- list()

# Fill list with n-glycosastion motif locations in each sequences
for (i in 1:length(data)){
  dd[i] <- str_locate_all(seque$V1[i], "N[^P][ST][^P]")
}

#Intialize another list
motif.beginnings <- list()

# Fill list with the beginning locations
for (i in 1:length(dd)){
  motif.beginnings[[i]] <- dd[[i]][,1]
}

# Attempt to combine data into Rosalind format
for (i in 1:length(data)){
  print(data[[i]])
  print(motif.beginnings[[i]])
}

sink("/home/steve/Documents/sample1.txt")

for (i in 1:length(data)){
  print(data[[i]])
  print(motif.beginnings[[i]])
}

sink()
