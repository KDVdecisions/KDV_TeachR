# R Examples
# KDV Decision Analysis LLC
# ashton.drew@kdv-decisions.com

# tidyr::fill() ----

library(tidyr)

# DEMO DATA & JUSTIFICATION ----

# A data table scraped from a pdf looked beautiful in publication...
# ...but is not well suited to use in R functions, especially tidyverse functions

raw <- data.frame(Gender = c("M", rep(NA, times=9), 
                             "F", rep(NA, times=9)),
                  Play = rep(c("Indoors", rep(NA, times=4), 
                               "Outdoors", rep(NA, times=4)), times=2),
                  Hours = runif(min=0, max=5, n=20))

# The current format makes good use of white space to improve human-readability.
# But R will read these blanks as NA and we need those values for our figures and models.

# EXAMPLE CODE ----

# We could do lots of drag and drop in Excel - or we could use the function fill() in the package tidyr

# Notice in Help that the ... ellipses argument refers to the one or more columns you want to select.  
# It suggests that you look at tidy_select to learn about ways to select columns.

play <- tidyr::fill(raw, Gender:Play, .direction="down")

# PRACTICE ----

# Load in the file Carcross_PopData.xlsx.  Remember to check the top and bottom of this
# file to make sure everything loads cleanly.  Once you have the complete dataframe, 
# fill the missing data for Year and Month.

