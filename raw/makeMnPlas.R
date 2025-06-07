# this file: makeMnPlas.R

rm(list = ls())

# read files ####
mm <- read.csv("raw/MNTaxaImproved.csv")
gg <- read.csv("raw/genusFamilyImproved.csv")

# merge 1 ####

pp <- merge(mm, gg)
head(pp)

# summary ####

aggregate(nameDNR ~ family, pp, length)

# add speciesId & rename 2 cols
pp$speciesId <- 1001:3373
names(pp)[names(pp) == "genus_id"] <- 'genusId'
names(pp)[names(pp) == "family_id"] <- 'familyId'
  
# write file ####
# dput(names(pp))
nama <- c("native",           "physiognomy", "synonymGC", "commonName", "nameDNR")
namz <- c("native", "family", "genus", "familyId", "genusId", "physiognomy", "synonymGC", "commonName", "nameDNR", "speciesId")


# write.csv(pp[pp$family_id %in% 5, nama], "mnAsters20250603.csv", row.names = FALSE)
# write.csv(pp[                 , namz],   "mnPlas20250607.csv", row.names = FALSE)
# write.csv(pp[                 , namz],           "mnPlas.csv", row.names = FALSE)
# write.csv(pp[pp$family_id %in% NA, c("genus", namz)], "mnProbs20250604.csv", row.names = FALSE)
