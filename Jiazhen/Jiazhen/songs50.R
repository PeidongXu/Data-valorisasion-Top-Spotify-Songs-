library(tidyverse)
library(cowplot)
library(corrplot)
library(highcharter)
library("ggplot2")
library("GGally")  
require(scales)

df <- read.csv('/Users/liujiazhen/Documents/DATA\ VALORISATION/songs\ 50/top10s.csv')
hpolar <- function(x, a, c, z) { 
  
  highchart() %>% 
    hc_chart(polar = TRUE) %>% 
    hc_title(text = x) %>% 
    hc_xAxis(categories = a,
             tickmarkPlacement = "on",
             lineWidth = 0) %>% 
    hc_yAxis(gridLineInterpolation = "polygon",
             lineWidth = 0,
             min = 0) %>% 
    hc_series(
      list(
        name = z,
        data = c,
        pointPlacement = "on",
        type = "column",
        color = '#646a70'  
        
      )
    )    
  
} 
#2010 genre 轮状图
top_2010 <- df[which(df$year==2010),] 

genre.data2010<-group_by(top_2010,top.genre)
genres <- summarise(genre.data2010,
                   count = n())  
hpolar('2010 - genres', genres$top.genre, genres$count,'genres')


#2010-2019 genre 轮状图
genre.data<-group_by(df,top.genre)
genres <- summarise(genre.data,
                    count = n())  
hpolar('2010 - genres', genres$top.genre, genres$count,'genres')

#2010-2019 artists 前20名轮状图
artist.data<-group_by(df,artist)
artists <- summarise(artist.data,
                    count = n()) 
top20_artists_2010_2019 <- artists %>%
  select(artist, count) %>%
  arrange(desc(count))%>%
  head(n = 20)
hpolar('2010 - Top 20 artist', top20_artists_2010_2019$artist, top20_artists_2010_2019$count,  'nb.songs ')

#2010-2019 top 20 artists  歌曲流行度 箱式图
hch <- function(x, a, b, c, y) {
  
  hcboxplot(x = a, var = b,var2 = c) %>%
    hc_chart(type = 'column') %>%
    hc_yAxis(title = list(text = y),
             labels = list(format = "{value}")) %>%
    hc_xAxis(title = list(text = x),
             labels = list(format = "{value}"))  
  
  
}
df_top20artists<-df[which(df$artist%in% top20_artists_2010_2019$artist),]
art <- df_top20artists %>%
  select(pop, artist)%>%
  group_by(pop, artist)

hch('Artists',art$pop, art$artist, art$artist, 'Popularity')

