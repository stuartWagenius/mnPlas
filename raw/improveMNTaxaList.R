# this file improveMNTaxaList.R

# read file ####
mm <- read.csv("raw/MNTaxaPlants.csv") # 2374
dput(names(mm))

# rename columns ####
names(mm) <- c("native", "physiognomy", "nameDNR", "commonName", 
  "emergingTaxonomy", "synonymGC")

# add genus ####
mm$genus <- gsub(' .*', '' , mm$nameDNR)

# write file ####
# write.csv(mm, "raw/MNTaxaImproved.csv", row.names = FALSE)
