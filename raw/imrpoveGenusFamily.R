# this file raw/improveGenusFamily.R

rm(list = ls())

# read files ####
mm <- read.csv("raw/MNTaxaImproved.csv")
gg <- read.csv("raw/genusFamilyTable.csv")

# initial merge ####

echinaceaLab::compare2vectors(mm$genus, gg$genus)
generaInMn <- echinaceaLab::compare2vectors(mm$genus, gg$genus)$in.first # not in IL list
dput(names(gg))
missing <- data.frame(genus_id = NA,
                      genus = generaInMn, 
                      family_id = NA,
                      family = "unknown")
# xx <- merge(mm, gg, all = T)
# xx[xx$genus %in% generaInMn, ]
# rm(xx)
rm(generaInMn)

# write.csv(missing, "raw/generaWithMissingFam.csv", row.names = F)

# get synonym genus Gleason & Cronquist ####

mm$generaGC <- gsub(' .*', '' , mm$synonymGC)

gcg <- mm[mm$genus != mm$generaGC, c('genus', 'generaGC')]
gcg <- gcg[!gcg$generaGC %in% "", ]

# get fam based on G&C genus ####
cc <- merge(gcg, gg, by.x = "generaGC", by.y = "genus", all.x = T)
cc <- merge(cc, gg, by.x = "genus", by.y = "genus", all.x = T)
head(cc)

cc[!cc$family.y %in% NA, ]
cc[!cc$family.y %in% NA & cc$family.x %in% NA, ]
cc[!cc$family.y %in% NA & !cc$family.x %in% NA & !(cc$family.y == cc$family.x), ] # ask Gretel

zz <- unique(cc[!cc$family.y %in% NA & cc$family.x %in% NA, ])
rm(cc, gcg)

dput(names(zz))
zz$genus        <- NULL
zz$genus_id.x   <- NULL
zz$family_id.x  <- NULL
zz$family.x     <- NULL
dput(names(zz))
names(zz) <- c("genus", "genus_id", "family_id", "family")
zz$genus_id <- NA


# make longer list ####
dim(gg) # 1081
gg <- rbind(gg, missing) # 1144 
gg <- rbind(gg, zz) # 1154


tail(gg, 80)

# write file ####
# write.csv(gg, "raw/genusFamilyImproved.csv", row.names = FALSE)
