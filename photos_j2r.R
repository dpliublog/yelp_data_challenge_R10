##########################################
### convert photos.json to R dataframe ###
### yelp data challenge: round 10      ###
### written by: dpliublog              ###
### this version: 2017-09-01           ###
##########################################

# clear memory
rm(list = ls())

# load packages
library(jsonlite)

## SET YOUR WORKING DIRECTORY HERE WITH setwd() ##

# load the original data
photos_data_original = lapply(readLines("raw_data/photos.json"), fromJSON)
print("original data loaded")


##########################################
# create the dataframe
df_photos = sapply(photos_data_original, unlist)
df_photos = t(df_photos)
df_photos = data.frame(df_photos, stringsAsFactors = F)
df_photos$label = as.factor(df_photos$label)
print("dataframe created")

# save photos dataframe to an rdata file
save(df_photos, file = "rdata/photos.Rdata")
print("Rdata file saved")