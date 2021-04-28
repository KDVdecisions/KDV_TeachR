# R Examples
# KDV Decision Analysis LLC
# ashton.drew@kdv-decisions.com

# Creating functions ----

# An advantage of working with code is the ability to write functions to perform 
# repeated tasks.  For example, someone wrote the mean() function so they would not have to keep writing all the steps to get the sum of all numbers, the count of numbers, and then do division.

# EVERYTHING you do in R is a function.  In Help, you read about functions to
# learn more about their required and optional arguments.

# BASIC FUNCTION ----

# Functions are created with the function `function`
# You define the arguments
# Functions are objects so you can assign them to a symbol (name)

# a function created with one required argument that must be supplied by the user, x
iterate_one <- function(x){
  x + 1
}

# a function created with 2 arguments supplied by the user, x and y
iterate_any <- function(x, y){
  x + y
}

# a function created with 2 arguments, one supplied by user 
# and the other will use default value unless supplied by user
iterate_default <- function(x, y = 1){
  x + y
}

# RETURNED VALUES and ENVIRONMENTS ----

# Functions return the last value evaluated or the 
# value wrapped in the return() function

# this returns the expected value - because the result is not 
# assigned to an symbol in an environment, it is sent directly to the console
iterate_one <- function(x){
  x + 1
}

# this does not return a value - because the result is assigned 
# to a symbol that only exists within the function environment
# and the value is never requested.
# the value is created but assigned to the symbol `new` and `new`
# is never evaluated

iterate_two <- function(x){
  new <- x + 2
}

# this DOES return a value.  Although the result is assigned 
# to a symbol that only exists within the function environment,
# that value is requested (the symbol is evaluated) as the last 
# line of code.

iterate_three <- function(x){
  new <- x + 3
  new
}

# this acts the same as iteration_three() BUT
# it is good practice to wrap the value you wish to return 
# explicitly in a return() function

iterate_four <- function(x){
  new <- x + 4
  return(new)
}

# BROWSER() ----

# Notice that the symbol `new` never appears in the Global Environment.
# It only exists in the function environment.
# To assist with debugging inside the function environment, use browser()

iterate_four <- function(x){
  new <- x + 4
  browser()
  return(new)
}

# RETURN LISTS ----

# Functions only return one object.  If your function creates 
# multiple objects, you can place these in a list and then return 
# the list.

# This does not work.  All code runs, but only the result of the last
# expression is returned.
iterate_many <- function(x, a, b, c){
  x + a
  x + b
  x + c
}

# This DOES work because the last expression evaluated is a list
# containing the three results.
iterate_many <- function(x, a, b, c){
  list(x + a, 
       x + b, 
       x + c)
}

# PRACTICE ----

# 1) Create a function that takes distance in feet as it's one argument and returns distance in meters.

# 2) Modify the above function by adding an argument that allows the user to specify if they want the result in meters or centimeters.  You will probably find the function ifelse() helpful.

# 3) Create a function, mad_lib() that takes four arguments: a noun, an adjective, a verb, and an adverb.  You can use the function paste() or sprintf() to combine these words into the mad lib: "The [adjective] [noun] [verb] [adverb] all day and all night.".  The function should return the completed sentence.

# 4) Update the function so that instead of one noun, the user can provide a vector of nouns and your function will randomly choose one noun from the vector.  You can use the function sample() to sample value(s) from a vector.

# FOR MORE INFORMATION ----

# I like this introductory Software Carpentry tutorial on creating functions in R: https://swcarpentry.github.io/r-novice-inflammation/02-func-R/
