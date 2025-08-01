# mnPlas
MNTaxa list of vascular plants with additions

#### 2025 July 11

added two species to mnPlas.csv that are not in MnTaxa: *Echinacea purpurea* & *Echinacea pallida*. To facilitate keeping track of additions and making additions, I added file `recordsAddedTo_mnPlas.csv_.txt` All new records will have species ids 4001, 4002, .... The '+' at the end of the name notes that the name is not an official DNR name.

#### 2025 June 21

`raw/plants20250621.csv` added from https://webapps15.dnr.state.mn.us/mntaxa/reports/index#
includes only taxa from four counties: Douglas, Grant, Pope, Stevens

updated occurrences.csv with all records in 4-county area: Douglas, Grant, Pope, Stevens

added `site.csv` including sites from MnTaxa and from `echinaceaLab::siteNames()`

added file `functions.R` that with function `listSpecies()` that returns a species list for any site, including the county lists.

#### 2025 June 07

`mnPlas.csv` now has no NA values in `genusId` or `familyId` 
`raw/genusFamilyImproved.csv` added genus_id to 72 records

#### 2025 June 06

added `occurrence.csv`

made first version of `mnPlas.csv` (same as `mnPlas20250606.csv`) 

`raw/genusFamilyImproved.csv` families updated from wikipedia 
and added family_id to three records:
```
genus_id      genus family_id        family
      NA   Peritoma       601    Cleomaceae
      NA Eriocaulon       602 Eriocaulaceae
      NA  Geocaulon       603  Comandraceae
```

#### 2025 June 04

`raw/genusFamilyImproved.csv` families updated from www.minnesotawildflowers.info (1153 records)

#### 2025 June 03

`raw/genusFamilyImproved.csv` has additional genera (1154 records)

`raw/genusFamilyTable.csv` is the file sent from Gretel Kiefer (1081 records)

`raw/MNTaxaImproved.csv` has column "genus" and better column names

#### 2025 May 29

`raw/MNTaxaPlants.csv` is the file sent from Derek Anderson (2374 records)
with the below information

Here are the Physiognomy Codes:

* B = broadleaf evergreen
* D = broadleaf deciduous
* E = needleleaf evergreen
* G = graminoid
* H = forb
* L = lichens and moss
* C = climber
* K = stem succulent
* X = epiphyte
* F = floating aquatic
* S = submerged aquatic

The Emerging Taxonomy Field are tentative new names based on recent research (such as the Violets based on work of Harvey Ballard).  Some of these may not be perfectly matched and we are not ‘officially’ using these names yet.  The list also includes the name from Gleason and Cronquist in case any are head scratchers.
