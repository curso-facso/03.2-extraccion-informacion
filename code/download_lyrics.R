library(tidyverse)
library(rvest)
source("code/helpers.R")

# Crear un listado de bandas chilenas 
bandas <- c("chancho-en-piedra", "los-prisioneros", "los-tres", "la-ley", "juana-fe", "joe-vasconcelos", "congreso")

data <- list()
indice <- 1
for (banda in bandas) {
  page <-  read_html(sprintf("https://www.letras.com/%s/", banda ) )  
  
  # Extraer todos los nodos que contienen canciones
  urls_canciones <- page %>% 
    html_elements(".songList-table-songName") %>% 
    html_attr("href")
  
  band_lyrics <- list()
  i <- 1
  for (url in urls_canciones) {
    
    url_song <-   paste0("https://www.letras.com", url)
    
    # Extraer el texto de una canción
    song_page <- read_html(url_song)
    
    lyric <-  song_page %>% 
      html_node(".lyric-original") %>% 
      html_text()
    
    title <-  song_page %>% 
      html_node("h1") %>% 
      html_text()
    
    song <- list("title" = title, "lyric" = lyric, "band" = banda )
    
    band_lyrics[[i]] <- song  
    i <- i + 1
  }
  
  data[[indice]] <- band_lyrics 
  indice <- indice + 1
  print(banda)
}

names(data) <- bandas
map(data, ~.x )
x <- data[[3]][[3]]$lyric
fix_string(x)

final <- data.frame(title = data %>% flatten() %>% map_chr("title"),
                    lyric = data %>% flatten() %>% map_chr("lyric"),  
                    band = data %>% flatten() %>% map_chr("band") 
                    )





