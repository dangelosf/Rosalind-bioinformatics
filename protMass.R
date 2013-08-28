# Input a string of amino acids and output the mass of the protein
protMass <- function(file)
  raw <- scan(file, what="")
  aaList <- c('A','C','D','E','F','H','G','I','K','L','M','N','P','Q','R','S','T','V','W','Y')
  massList <- c('71.03711,','103.00919,','115.02694,','129.04259,','147.06841,','57.02146,','137.05891,','113.08406,','128.09496,','113.08406,','131.04049,','114.04293,','97.05276,','128.05858,','156.10111,','87.03203,','101.04768,','99.06841,','186.07931,','163.06333,')
  for(i in 1:20){
    raw <- gsub(aaList[i], massList[i], raw)
    }
  massList2 <- strsplit(raw,",")
  finalMass <- sum(as.numeric(massList2[[1]][]))
  return(finalMass)
  }
