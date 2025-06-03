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


# write file ####
# dput(names(pp))
nama <- c("native",           "physiognomy", "synonymGC", "commonName", "nameDNR")
namz <- c("native", "family", "physiognomy", "synonymGC", "commonName", "nameDNR")


# write.csv(pp[pp$family_id %in% 5, nama], "mnAsters20250603.csv", row.names = FALSE)
# write.csv(pp[                 , namz],   "mnPlas20250603.csv", row.names = FALSE)
