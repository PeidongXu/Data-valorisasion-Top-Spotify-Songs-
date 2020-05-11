# Import & Libraries

# library(GGally)
# library(wordcloud2) 
# library(forcats)
# library(tidyverse)
# library(plotly)
# library(viridis)
# library(hrbrthemes)
# library(DT)
# library(ggthemes)

library(data.table)
library(MASS)
library(ggplot2)
library(gridExtra)

top10s <- fread("../input/top10s.csv")
top10s <- subset(top10s, select = -c(V1, title, `top genre`, artist, pop))
top2010 <- top10s[top10s$year == 2010, ] 
top2011 <- top10s[top10s$year == 2011, ] 
top2012 <- top10s[top10s$year == 2012, ] 
top2013 <- top10s[top10s$year == 2013, ] 
top2014 <- top10s[top10s$year == 2014, ] 
top2015 <- top10s[top10s$year == 2015, ] 
top2016 <- top10s[top10s$year == 2016, ] 
top2017 <- top10s[top10s$year == 2017, ] 
top2018 <- top10s[top10s$year == 2018, ] 
top2019 <- top10s[top10s$year == 2019, ]

top2010 <- subset(top2010, select = -c(year))
top2011 <- subset(top2011, select = -c(year))
top2012 <- subset(top2012, select = -c(year))
top2013 <- subset(top2013, select = -c(year))
top2014 <- subset(top2014, select = -c(year))
top2015 <- subset(top2015, select = -c(year))
top2016 <- subset(top2016, select = -c(year))
top2017 <- subset(top2017, select = -c(year))
top2018 <- subset(top2018, select = -c(year))
top2019 <- subset(top2019, select = -c(year))

# top2010 <- top2010[1:(nrow(top2010)-10),]
# top2011 <- top2011[1:(nrow(top2010)-10),] 
# top2012 <- top2012[1:(nrow(top2010)-10),]
# top2013 <- top2013[1:(nrow(top2010)-10),]
# top2014 <- top2014[1:(nrow(top2010)-10),]
# top2015 <- top2015[1:(nrow(top2010)-10),]
# top2016 <- top2016[1:(nrow(top2010)-10),]
# top2017 <- top2017[1:(nrow(top2010)-10),]
# top2018 <- top2018[1:(nrow(top2010)-10),]
# top2019 <- top2019[1:(nrow(top2010)-10),]

par(mfrow=c(2,5))
parcoord(top2010)
parcoord(top2011)
parcoord(top2012)
parcoord(top2013)
parcoord(top2014)
parcoord(top2015)
parcoord(top2016)
parcoord(top2017)
parcoord(top2018)
parcoord(top2019)


# top2010 <- melt(top2010)
# h1 <- ggplot(top2010) + geom_boxplot(aes(x=variable, y=value)) + labs(x="", y="Value")
# 
# top2011 <- melt(top2015)
# h2 <- ggplot(top2011) + geom_boxplot(aes(x=variable, y=value)) + labs(x="", y="Value")
# grid.arrange(h1, h2, ncol=2, nrow = 1)

# Vector color
# my_colors <- colors()[(as.numeric(top10s$year)-2000)*15]

# Make the graph !
# parcoord(top10s %>% select(-c(V1, title, `top genre`, artist, year)), col= my_colors)


# artist <- top50 %>%
#   group_by(artist) %>%
#   dplyr::summarize(Total = n()) 
# datatable(artist)
# 
# top50$cut_pop <- cut(top50$pop, breaks = 5)
# top50 %>%
#   ggplot( aes(x=cut_pop ))+
#   geom_bar(width=0.2) +
#   coord_flip() +
#   scale_x_discrete(name="Popularity")  + theme_economist() + scale_fill_economist()
# 
# 
# top50$cut_energy <- cut(top50$nrgy, breaks = 10)
# top50 %>%
#   ggplot( aes(x=cut_energy ))+
#   geom_bar(width=0.2) +
#   coord_flip() +
#   scale_x_discrete(name="Energy")  + theme_economist() + scale_fill_economist()
# 
# 
# top50$cut_len <- cut(top50$dur, breaks = 10)
# top50 %>%
#   ggplot( aes(x=cut_len ))+
#   geom_bar(width=0.2) +
#   coord_flip() +
#   scale_x_discrete(name="Length")  + theme_economist() + scale_fill_economist()
# 
# 
# by_genre <- top50 %>%
#   group_by(`top genre`) %>%
#   dplyr::summarize(Total = n()) 
# datatable(by_genre)
# wordcloud2(data=by_genre, size=1)
# 
# 
# corr <- top50 %>% 
#   select(-c(title,  artist ,`top genre`,cut_pop ,cut_energy, cut_len  )) 
# ggpairs(corr, title="Correlogram of the Top 50") 
# 
# 
# library(corrplot)
# top50db <- select(top50, -c(title,  artist ,`top genre`,cut_pop ,cut_energy, cut_len  )) 
# mtCor <- cor(top50db)
# corrplot(mtCor, method = "ellipse", type = "upper", tl.srt = 45)