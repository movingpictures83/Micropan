library(micropan)
# Loading example BLAST distances
#data(xmpl.bdist)
input <- function(inputfile) {
#write.csv(xmpl.bdist, "xmpl.csv")
mydata <<- read.csv(inputfile)
}

run <- function() {

}

output <- function(outputfile) {
pdf(outputfile)
	# Clustering with default settings
clst <- bClust(mydata)
# Other settings, and verbose
clst <- bClust(mydata, linkage = "average", threshold = 0.5, verbose = TRUE)
# Loading clustering data in this package
# Pan-matrix based on the clustering
panmat <- panMatrix(clst)
## Not run:
# Plotting cluster distribution
library(ggplot2)
tibble(Clusters = as.integer(table(factor(colSums(panmat > 0), levels = 1:nrow(panmat)))),
Genomes = 1:nrow(panmat)) %>%
ggplot(aes(x = Genomes, y = Clusters)) +
geom_col()
}
