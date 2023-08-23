fix_string <- function(string) {
  string <- str_trim(string)
  characters_vector <- strsplit(string, split="")[[1]]
  new <- c()
  for (i in 1:length(characters_vector)) {
    if (str_detect(characters_vector[i], pattern = "[[:upper:]]")) {
      new[i] <- paste0(" ", characters_vector[i])
    } else {
      new[i] <- characters_vector[i]
    }
    
  }
  
  return(paste(new,collapse=''))
}
