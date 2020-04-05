library(data.table)
library(MASS)
library(ggplot2)
library(gridExtra)
library(digest)
library(hrbrthemes)
library(GGally)
library(viridis)
library(fmsb)

#_________________INITIALIZING DATA
top10s <- fread("../top10s.csv")
names(top10s)[names(top10s) == "top genre"] <- "genre"
# TAKING ONLY MUSICAL ATTRIBUTES
top10sATTR <- subset(top10s, select = -c(V1, title, genre, artist, pop))
# DIVIDING BY YEAR
top2010 <- top10sATTR[top10sATTR$year == 2010, ] 
top2011 <- top10sATTR[top10sATTR$year == 2011, ] 
top2012 <- top10sATTR[top10sATTR$year == 2012, ] 
top2013 <- top10sATTR[top10sATTR$year == 2013, ] 
top2014 <- top10sATTR[top10sATTR$year == 2014, ] 
top2015 <- top10sATTR[top10sATTR$year == 2015, ] 
top2016 <- top10sATTR[top10sATTR$year == 2016, ] 
top2017 <- top10sATTR[top10sATTR$year == 2017, ] 
top2018 <- top10sATTR[top10sATTR$year == 2018, ] 
top2019 <- top10sATTR[top10sATTR$year == 2019, ]
# TAKING ONLY SONGS OF "POP" GENRES
top10sPOP <- dplyr::filter(top10s, grepl('pop', genre))



#_________________BOX PLOTS OF ATTRIBUTES FOR EACH YEAR
top2010bp <- subset(top2010, select = -c(year))
top2010bp <- melt(top2010bp, measure.vars = c(colnames(top2010bp)))
top2011bp <- subset(top2011, select = -c(year))
top2011bp <- melt(top2011bp, measure.vars = c(colnames(top2011bp)))
top2012bp <- subset(top2012, select = -c(year))
top2012bp <- melt(top2012bp, measure.vars = c(colnames(top2012bp)))
top2013bp <- subset(top2013, select = -c(year))
top2013bp <- melt(top2013bp, measure.vars = c(colnames(top2013bp)))
top2014bp <- subset(top2014, select = -c(year))
top2014bp <- melt(top2014bp, measure.vars = c(colnames(top2014bp)))
top2015bp <- subset(top2015, select = -c(year))
top2015bp <- melt(top2015bp, measure.vars = c(colnames(top2015bp)))
top2016bp <- subset(top2016, select = -c(year))
top2016bp <- melt(top2016bp, measure.vars = c(colnames(top2016bp)))
top2017bp <- subset(top2017, select = -c(year))
top2017bp <- melt(top2017bp, measure.vars = c(colnames(top2017bp)))
top2018bp <- subset(top2018, select = -c(year))
top2018bp <- melt(top2018bp, measure.vars = c(colnames(top2018bp)))
top2019bp <- subset(top2019, select = -c(year))
top2019bp <- melt(top2019bp, measure.vars = c(colnames(top2019bp)))

h0 <- ggplot(top2010bp) + geom_boxplot(aes(x=variable, y=value)) + labs(x="", y="Value")
h1 <- ggplot(top2011bp) + geom_boxplot(aes(x=variable, y=value)) + labs(x="", y="Value")
h2 <- ggplot(top2012bp) + geom_boxplot(aes(x=variable, y=value)) + labs(x="", y="Value")
h3 <- ggplot(top2013bp) + geom_boxplot(aes(x=variable, y=value)) + labs(x="", y="Value")
h4 <- ggplot(top2014bp) + geom_boxplot(aes(x=variable, y=value)) + labs(x="", y="Value")
h5 <- ggplot(top2015bp) + geom_boxplot(aes(x=variable, y=value)) + labs(x="", y="Value")
h6 <- ggplot(top2016bp) + geom_boxplot(aes(x=variable, y=value)) + labs(x="", y="Value")
h7 <- ggplot(top2017bp) + geom_boxplot(aes(x=variable, y=value)) + labs(x="", y="Value")
h8 <- ggplot(top2018bp) + geom_boxplot(aes(x=variable, y=value)) + labs(x="", y="Value")
h9 <- ggplot(top2019bp) + geom_boxplot(aes(x=variable, y=value)) + labs(x="", y="Value")

grid.arrange(h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, ncol=5, nrow = 2)



#_________________PARALLEL COORDINATES FOR ALL YEARS TOGETHER
my_colors <- colors()[(as.numeric(top10sATTR$year)-2000)*15]
parcoord(top10sATTR, col= my_colors)




#_________________PARALLEL COORDINATES FOR ALL YEARS SEPARATELY
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



#_________________DIVIDE INTO TWO-YEAR PERIODS
for (row in 1:nrow(top10sPOP)) {
  year <- top10sPOP[row, "year"]
  if(year == 2010) {
    top10sPOP[row, "year"] = "2010-2011"
  }
  if(year == 2011) {
    top10sPOP[row, "year"] = "2010-2011"
  }
  if(year == 2012) {
    top10sPOP[row, "year"] = "2012-2013"
  }
  if(year == 2013) {
    top10sPOP[row, "year"] = "2012-2013"
  }
  if(year == 2014) {
    top10sPOP[row, "year"] = "2014-2015"
  }
  if(year == 2015) {
    top10sPOP[row, "year"] = "2014-2015"
  }
  if(year == 2016) {
    top10sPOP[row, "year"] = "2016-2017"
  }
  if(year == 2017) {
    top10sPOP[row, "year"] = "2016-2017"
  }
  if(year == 2018) {
    top10sPOP[row, "year"] = "2018-2019"
  }
  if(year == 2019) {
    top10sPOP[row, "year"] = "2018-2019"
  }
}




#_________________CORRELATION MATRIX
print(ggpairs(top10sPOP, columns = 5:15, ggplot2::aes(colour=year)))



#_________________HISTOGRAMS
f <- function(param) {
  p <- top10sPOP %>%
    ggplot(aes_string(x=param, color="year", fill="year")) +
    geom_histogram(alpha=0.6, binwidth = 5) +
    scale_fill_viridis(discrete=TRUE) +
    scale_color_viridis(discrete=TRUE) +
    theme_ipsum() +
    theme(
      legend.position="none",
      panel.spacing = unit(0.1, "lines"),
      strip.text.x = element_text(size = 8)
    ) +
    xlab("") +
    ylab("Assigned Probability (%)") +
    facet_wrap(~year)
  print(p)
}

f("val")
f("dur")
f("acous")
f("spch")
f("live")