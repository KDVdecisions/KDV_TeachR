# R Examples
# KDV Decision Analysis LLC
# ashton.drew@kdv-decisions.com


# Custom styling ----

# Many organizations have a "brand standards" and "style guides" that dictate
# font and color choices, the use of graphics, and other aspects of public facing
# digital and print products.  For example:
#   Yukon Government Digital Content Standards: https://guide.yukon.ca/en/content-design
#   North Carolina Dept of Transportation, Cartographic Style Guide: https://connect.ncdot.gov/resources/gis/cartographic-standards/Pages/CSG.aspx

# The default R font is "sans" which is "TT Arial"
# So what other fonts do you have access to in R by ?
# On my windows laptop, I can find out with:
windowsFonts() # there are three
# I believe you can do the same on MacOS with:
quartzFonts() # again there are three

# Rarely will a journal or organization select one of these for their font.  Getting fonts into your system to produce graphics from within your system is fairly straight forward.  There may be extra steps required though to ensure custom fonts travel with any code you are developing.  Also - fonts must be available to various graphics "devices" - a font available for pdf may not be available for web or in the RStudio view pane.  For example, see this blog 

# External libraries for more fonts ----

# Yukon branding uses three Goggle open source fonts
# Google fonts (https://fonts.google.com/)
# We can use the package showtext to get these fonts
library(showtext)
# add the three primary Yukon fonts
font_add_google("Montserrat")
font_add_google("Nunito Sans")
font_add_google("Aleo")
# Make the fonts available for use
showtext_auto()

# Learn more about fonts and the showtext package here: https://cran.rstudio.com/web/packages/showtext/vignettes/introduction.html


# CUSTOM GGPLOT THEME ----

theme_yukon <- function(fontFamily = "Monts"){ 
	
	font <- fontFamily   # assign font family up front
	
	theme_classic() %+replace%    #replace elements we want to change
		
		theme(
			
			#text elements: look at help for theme() and element_text()
			plot.tag = element_text( 
				family = font,            
				size = 12,                
				hjust = 1,               # right align
			vjust = 2),               # raise slightly
			
			plot.title = element_text( 
				family = font,            
				size = 18,               
				face = "bold",            
				hjust = 0.5,              # center align
				vjust = 2),               
			
			plot.subtitle = element_text( 
				family = font,            
				size = 14,               
				hjust = 0.5),               
			
			plot.caption = element_text(   
				family = font,    
				face = "italic",
				size = 9,                 
				hjust = 1),   
			
			legend.title = element_text(
				family = font,            
				size = 11,
				margin=margin(t = 0, r = 0, b = 5, l = 0, unit = "pt")),
			
			legend.text = element_text(
				family = font,            
				size = 10),
			
			axis.title = element_text(             
				family = font,            
				size = 11),
			
			axis.title.x = element_text( 
				# add a little white space above x-axis text
				margin=margin(t = 8, r = 0, b = 5, l = 0, unit = "pt")),    
			
			axis.title.y = element_text( 
				# add a little white space to right of y-axis text
				margin=margin(t = 0, r = 8, b = 0, l = 0, unit = "pt"),
				angle = 90),    
			
			axis.text = element_text(
				family = font,
				size = 9)
			
		)
}

library(ggplot2)
p1 <- ggplot(mtcars) +
	geom_point(aes(x = wt, y = mpg, colour = gear)) +
	labs(title = "Fuel economy declines as weight increases",
			 subtitle = "(1973-74)",
			 caption = "Data from the 1974 Motor Trend US magazine.",
			 tag = "Figure 1",
			 x = "Weight (1000 lbs)",
			 y = "Fuel economy (mpg)",
			 colour = "Gears")
p1 + theme_classic()
p1 + theme_yukon(fontFamily="Monserrat")
p1 + theme_yukon(fontFamily="Nunito Sans")
p1 + theme_yukon(fontFamily="Aleo")





