
# read dnr list ####
ss <- read.csv("C:/Users/swagenius/Documents/mnPlas/raw/plantsDNR20250621.csv")
names(ss)[names(ss) == "MN.DNR.Official.Name"] <- 'nameDNR'
ss[ss$doug %in% NA, ]
ss[ss$doug %in% '--', ]
ss[grepl("Elymus", ss$nameDNR), ]
ss[grepl("Solidago c", ss$nameDNR), ]
ss <- ss[!ss$doug %in% '--', ]


# read mn plas ####
mm <- read.csv("C:/Users/swagenius/Documents/mnPlas/mnPlas20250607.csv")
mm <- mm[!duplicated(mm$nameDNR), ] # remove dup Cardamine


# merge to get species id ####
# source("~/bbnest/build.R", echo = TRUE)
# testMerge(mm, ss)

aa <- merge(mm[, c("speciesId", "nameDNR")], ss)

# investigate ####
dput(names(aa))
unique(aa[, c( "doug", 
               "gran", "pope", "stev")])

aggregate(nameDNR ~ stev + pope + gran + doug , aa, length)

# make dataframe for occurrence ####

oo <- aa[!aa$doug %in% "", c("speciesId", "nameDNR")]
oo$nameDNR <- "2"
oo <- rbind(oo, aa[!aa$gran %in% "", c("speciesId", "nameDNR")])
oo[!oo$nameDNR %in% c("2"), 'nameDNR'] <- "3"
oo <- rbind(oo, aa[!aa$pope %in% "", c("speciesId", "nameDNR")])
oo[!oo$nameDNR %in% c("2", "3"), 'nameDNR'] <- "4"
oo <- rbind(oo, aa[!aa$stev %in% "", c("speciesId", "nameDNR")])
oo[!oo$nameDNR %in% c("2", "3", "4"), 'nameDNR'] <- "5"

foo <- data.frame(occurrenceId = 2:2056,
                  speciesId = oo$speciesId,
                  siteId = as.integer(oo$nameDNR),
                  date = "2025-06-21",
                  inits = "MnDNR",
                  note = "from MNTaxa"
)

#### append to csv  ####
# write.table(foo, "occurrence.csv", append = TRUE, row.names = FALSE, sep = ",", col.names = FALSE)
