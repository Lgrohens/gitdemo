# ===================================================================
# Title: Lab 05
# Description:
#   This script computes descriptive statistics, as well as 
#   various exploratory data visualizations.
# Input(s): data file 'nba2018-players.csv'
# Output(s): summary data files, and plots
# Author: Laura Grohens
# Date: 10-02-2019
# ===================================================================

# packages
library(dplyr)
library(ggplot2)

# importing data
data <- "~/Desktop/gitdemo/data/nba2018-players.csv"
dat <- read.csv(data)
dat

# Warriors data frame
warriors <- dat %>% filter(team == 'GSW') %>% arrange(salary)
warriors

# Use write.csv() to export the data frame warriors to a data file into the data/ directory
warriors %>% write.csv(file = "~/Desktop/gitdemo/data/warriors.csv", row.names = FALSE)

# Export the output of str() on the data frame with all the players.
# sink() the output, using a relative path, to a text file data-structure.txt,
#in the output/ folder. Tell git to add and commit the changes.
sink(file = "~/Desktop/gitdemo/output/structure_dat.txt")
str(dat)
sink()


# Export the summary() of the entire data frame warriors to a text file summary-warriors.txt,
# in the output/ folder (also use a relative path). Tell git to add and commit the changes.
sink(file = "~/Desktop/gitdemo/output/summary-warriors.txt")
summary(warriors)
sink()


# Export another summary() of the entire data frame lakers to a text file summary-lakers.txt,
#in the output/ folder (using a relative path). Tell git to add and commit the changes.
lakers <- dat %>% filter(team == 'LAL')
sink(file = "~/Desktop/gitdemo/output/summary-lakers.txt")
summary(lakers)
sink()

# Use jpeg() to save a histogram of age with hist() as a file called histogram-age.jpeg.
# Give width and height of 600 and 400 pixels, respectively.
#Save the graph in the images/ folder.
#Tell Git to add and commit all the modifications.
jpeg(filename = "~/Desktop/gitdemo//images/histogram-age.jpeg", width = 600, height = 400, units = "px")
hist(dat$age, xlab = "age")
dev.off()

# Save another version of the scatterplot between height and weight in a file
# called scatterplot2-height-weight.png, but now try to get an image with higher
# resolution (Hint: argument pointsize is your friend).
# Save the plot in images/.
# Tell Git to add and commit all the modifications.
png(filename = "~/Desktop/gitdemo/images/scatterplot2-height-weight.png", pointsize = 12)
plot(dat$height, dat$weight, pch = 20, xlab = 'Height', ylab = 'Weight')
dev.off()

# Use ggplot2 functions to make and save (with ggsave()) another scatterplot
# of height and weight, facetting by position.
# Save the graph in the images/ folder, and name the file height_weight_by_position.pdf.
#Tell Git to add and commit all the modifications.
ggplot(dat) + aes(x = height, y = weight) + geom_point() + facet_wrap(~ position)
ggsave("~/Desktop/gitdemo/images/height_weight_by_position.pdf")
dev.off()
