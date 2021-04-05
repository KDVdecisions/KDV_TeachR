# R Examples
# KDV Decision Analysis LLC
# ashton.drew@kdv-decisions.com

# tidyr::separate() ----

library(tidyr)

# JUSTIFICATION ----

# Data in a column sometimes represents more than one variable of interest:

	#		"Dec-2020" representing Month and Year
	#		"Ashton Drew" representing GivenName and SurName 
	#		"M-001" representing Gender and PatientId

# If you wanted to plot the above data based on Gender, subset the data by Year, etc - then it will be helpful to have these data in their own column

# DEMO DATA ----

# We have a two column dataframe.
# We want four columns: GivenName, SurName, State, Country

rawData <- data.frame(Person = c("Ashton Drew", "Rob Horne"),
                  Location = c("NC, USA", "YT, Canada"))

# EXAMPLE CODE ----

# Start with rawData and change the first column.
# You must provide:
# 		the name of the column to be divided (as a symbol representing the column vector of values that exists), 
# 		the names of the new columns to create (as character strings because these do not yet exist as symbols),
# 		the symbol that separates the parts
# Assign the returned dataframe to a new object

detailData <- tidyr::separate(rawData, 
                             col = Person, 
                             into = c("GivenName", "SurName"),
                             sep = " ")

# The sep argument takes a "regular expression" or "regex".  Regex is it's own language for parsing
# text.  Learn more about regex here: 
# 		https://cran.r-project.org/web/packages/stringr/vignettes/regular-expressions.html

# Use the object you just created and change the second column.
# Overwrite the onject by assigning the returned value to the same symbol name
detailData <- tidyr::separate(detailData, 
                              col = Location, 
                              into = c("State", "Country"),
                              sep = ", ")


# PRACTICE ----

# Using the heart rate data, separate the PatientId column into two columns: Gender and Number.
# Reference the Help documentation for an optional argument to also keep the PatientID column.
# What is the default separator? Reference the Help documentation.


# BONUS MATERIAL ----

# Why check data and why read help?... 
# ...to know how the functions behave under exceptions
# If your data are small enough to easily review, its easy to catch things like recycling or dropping values.
# But if your data are large, it can be difficult to catch such errors.

# Suppose the data to not cleanly follow a single pattern of two parts.
oddObs <- data.frame(Site = c("North 1", 
                              "North 2",
                              "South 1",
                              "South 1 alt",
                              "South 2",
                              "West"))

# In tidyverse, data will never be coerced, dropped etc without providing a warning, 
# ...so this code will give two helpful warnings.
# Warnings are not errors. Your code runs - but R encountered something unexpected and made a choice.
# ...R is telling you so you know to inspect data.  This function helpfully tells you where to look.

# Default behaviour if you do not review (and therefore accept) optional arguments:
default <- tidyr::separate(oddObs, 
                           col = Site, 
                           into = c("Region", "SiteId"),
                           sep = " ")

# If you want to keep the extra site information, there are several ways you could do this.  
# One method would be to to do it in two steps:

# Step 1
alt1 <- tidyr::separate(oddObs, 
                        col = Site, 
                        into = c("Region", "SiteId"),
                        sep = " ",
                        extra = "merge")
# Step 2
alt2 <- tidyr::separate(alt1, 
                        col = SiteId, 
                        into = c("SiteNum", "SiteNote"),
                        sep = " ")