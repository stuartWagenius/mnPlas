# this file imrpoveGenusFamily.R

rm(list = ls())

# read files ####
mm <- read.csv("raw/MNTaxaImproved.csv")
gg <- read.csv("raw/genusFamilyTable.csv")

# question for gretel
gg[gg$genus %in% gg$genus[duplicated(gg$genus)], ]

gg <- gg[!gg$genus %in% gg$genus[duplicated(gg$genus)], ] # check this


# initial merge ####

echinaceaLab::compare2vectors(mm$genus, gg$genus)
generaInMn <- echinaceaLab::compare2vectors(mm$genus, gg$genus)$in.first # not in IL list

xx <- merge(mm, gg, all = T)
xx[xx$genus %in% generaInMn, ]

# get synonym genus Gleason & Cronquist ####

mm$generaGC <- gsub(' .*', '' , mm$synonymGC)

gcg <- mm[mm$genus != mm$generaGC, c('genus', 'generaGC')]
gcg <- gcg[!gcg$generaGC %in% "", ]

# redo merge ###
xx <- merge(mm, gg, all.x = T)
xx <- merge(xx, gg, by.x = "generaGC", by.y = "genus", all.x = T)
head(xx)

xx[!xx$family.y %in% NA, ]
xx[!xx$family.y %in% NA & xx$family.x %in% NA, ]

xx[!xx$family.y %in% NA & !xx$family.x %in% NA & !(xx$family.y == xx$family.x), ]



# write file ####
# write.csv(gg, "genusFamilyImproved.csv", row.names = FALSE)
