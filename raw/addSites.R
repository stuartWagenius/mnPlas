# this file: raw/addSites.R
# add sites to site.csv

# read sites.csv
x <- read.csv ("~/mnPlas/site.csv")
x

# template for new sites ####

# toAdd <- data.frame(siteId = ,
#                     siteName = ,
#                     note =
#                       )

# add echProj sites ####
length(echinaceaLab::siteNames())
toAdd <- data.frame(siteId = 501:582,
                    siteName = echinaceaLab::siteNames(),
                    note = "site in echinaceaLab added 2025-06-21"
                      )

# write.table(toAdd, "site.csv", append = TRUE, row.names = FALSE, sep = ",", col.names = FALSE)



