# this file: functions.R 

fourCounties <- c("MnDNRDouglasCounty", "MnDNRGrantCounty", "MnDNRPopeCounty", "MnDNRStevensCounty")

# need error handling & documentation for these functions

getSiteId <- function(site.name = "echinaceaProjectArea"){
  ss <- read.csv("~/mnPlas/site.csv")
  if(any(!site.name %in% ss$siteName)) warning('site name not recognized', immediate. = T)
  ss[ss$siteName %in% site.name, 'siteId']
}

# getSiteId("MnDNRDouglasCounty")

getOccurrences <- function(site.name){
  site.id <- getSiteId(site.name)
  x <- read.csv ("~/mnPlas/occurrence.csv")
  x[x$siteId %in% site.id, ]
}

# getOccurrences("MnDNRDouglasCounty")  

listSpecies <- function(site.name, fields = c("nameDNR", "commonName")){
  spp <- getOccurrences(site.name)$speciesId  
  x <- read.csv("~/mnPlas/mnPlas.csv")
  x[x$speciesId %in% spp, fields]
}

# listSpecies("MnDNRDouglasCounty")  

# dim(listSpecies("MnDNRPopeCounty"))
# dim(listSpecies(fourCounties))
# dim(listSpecies("echinaceaProjectArea"))
# dim(listSpecies("DouglasCountyEchProj"))
# dim(listSpecies("beng"))
# dim(listSpecies(c("beng", "aa")))
# dim(listSpecies(c("beng", "la")))
# dim(listSpecies(c(fourCounties, "beng")))
# dim(listSpecies(c(fourCounties, "la")))

# listSpecies("echinaceaProjectArea", fields = "speciesId")
# listSpecies("echinaceaProjectArea")$commonName

# it would be nice to allow "all" for fields argument

# listSpecies(fourCounties, fields = c("family", "nameDNR")) |> head()

foo <- listSpecies(fourCounties, fields = c("family", "nameDNR"))
foo[foo$family %in% "Asteraceae", "nameDNR"]
