# R Examples
# KDV Decision Analysis LLC
# ashton.drew@kdv-decisions.com

# dplyr joins ----

library(dplyr)

# DEMO DATA & JUSTIFICATION ----

# Sometimes data are dispersed across multiple tables and we wish to merge
# these data into a single dataframe based on some shared information.  For
# example, a PatientID column might be useful to link patient medical records
# to patient contact information or a SiteID column might be useful to relate
# a dataframe of species data to a dataframe of environmental data.

set.seed(5) # set a seed to ensure random numbers are the same for all users

sites <- data.frame(SiteID = paste0("Site", 1:20),
									Long = 62 + round(runif(n=10, min=0, max=1), 6),
									Lat = -(123 + round(runif(n=10, min=0, max=1), 6)))

env <- data.frame(SiteID = paste0("Site", 1:12),
									SoilTexture = rep(c("Coarse", "Fine", "Very Fine"), each = 4),
									SoilMoisture = rep(c("Wet", "Dry"), each = 6))

spp <- data.frame(SID = paste0("Site", 10:19),
									Dandilion = as.integer(c(1,6,3,5,1,0,1,2,6,1)),
									Sweetclover = as.integer(c(0,2,2,3,0,4,6,3,2,1)))

# These data simulate results for a study in progress.  There are 20 locations
# to be surveyed - their id and coordinates are in the dataframe sites.  
# At each site, soil scientists enter data in one database (dataframe env) 
# and plant biologists enter data into another (dataframe spp).  The soil
# scientists have completed 12 of 20 sites and the plant biologists have
# completed 10 of 20 sites.

# EXAMPLE CODE ----

# Notice in the Help for left_join() that there are four related "mutating
# joins", all of which add columns from y to x.  

# Notice in the help for semi_join() there there are two "filtering joins".  In these some of the records in x will be dropped based on the match (or lack of match).  NO COLUMNS ARE ADDED.

# Notice in the Help that there are many options to specify the joining column.  If there is a single column labeled the same in both left (x) and right (y), then you do not need to specifiy.  But if the names differ or if you wish to specify a join based on multiple column matches - you can do this.

# Example 1: "Mutating Join" ----
# Join to view all data (all sites)

# If we want a final dataframe that includes *ALL* data (20 rows with all columns from sites, env, and spp), we will need a series of left_join() or inner_join() steps.

joinEnv <- dplyr::left_join(sites, env) # join will match based on SiteID in both x and y
allSites <- dplyr::left_join(joinEnv, spp, by=c("SiteID"="SID")) # no matching column name, so we must specify what columns to match

# Example 2: "Mutating Join" ----
# Join to view only completed sites, but all data

# If we want a final dataframe that includes *ONLY COMPLETED* data (3 rows with all columns from sites, env, and spp), we could either filter the above example OR use the inner_join()

joinEnv2 <- dplyr::inner_join(sites, env)
compSites <- dplyr::inner_join(joinEnv2, spp, by=c("SiteID"="SID"))

# Example 3: "Filtering Join" ----
# Join to view site id and coordinates for just the incomplete sites

todoEnv <- dplyr::anti_join(sites, env)
todoSpp <- dplyr::anti_join(sites, spp,  by=c("SiteID"="SID"))

# PRACTICE ----

# Load in the files Xmas_FieldData.xlsx and Xmas_CoverCodes.xlsx.  The Xmas_CoverCodes file is a look-up table of landcover class names matching the codes in column GAP_MJ column of the Xmas_FieldData file.  Use an appropriate join to bring the cover field name columns from the look-up table into the field data table.  Remember to look at the Xmas_README.pdf file if you want to learn more about these data.

