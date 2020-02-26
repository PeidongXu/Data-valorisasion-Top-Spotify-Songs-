#Auther Xu Peidong
#Date : 16:16 26/02/2020


#Install Data

library(readr)
top10s <- read_csv("C:/Github/Data-valorisasion-Top-Spotify-Songs-/top10s.csv")
View(top10s)

#Initial
artistTable <- table(top10s$artist)
artistTable

print(ncol(top10s))
print(nrow(top10s))

top <- max(top10s$`top genre`)
print(top)

install.packages("highcharter")
install.packages("digest")

hchart(top10s$pop, type = "column")

#Pie Chart from Data Top Spotify Song 
pieLabels <- paste(names(artistTable), "\n", artistTable, sep="")
pie(artistTable, labels = pieLabels, 
    main="Pie Chart of Species\n with sample size")

df <- top10s.frame[2,15]


RSiteSearch('hchart','function') 
