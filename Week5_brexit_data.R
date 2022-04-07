#) Import the dataset
file_data <- read.csv("data_brexit_referendum.csv")
str(file_data)
 
# count no. of " -1" values in the leave variable and then replce with NA
#sum of the count first
sum(file_data$Leave[file_data$Leave == -1])
#there are 267 -1 values in Leave, Now replce it with NA
file_data$Leave[file_data$Leave == -1] <- NA
# Now check for replacement is successfull
sum(is.na(file_data$Leave))
# Another way to count the NA
na_records <- file_data[!complete.cases(file_data),]
na_records
nrow(na_records)
# use the mice package
install.packages("mice")
library(mice)

 install.packages("VIM")
 library(VIM)
 md.pattern(file_data ,rotate.names = TRUE)
 
 #summary of missing values
 
 missing_values <- aggr(file_data , prop = FALSE , numbers = TRUE)
 summary(missing_values)
 # calculate the percentage of leave vote
 file_data$Proportion <- file_data$Leave/file_data$NVotes
 file_data$Proportion
 # Create a column VOTe and insert the remain and leave values in it
 file_data$VOTE[file_data$Proportion <= 0.5] <- "remain"
 file_data$VOTE[file_data$Proportion > 0.5] <- "leave"
 file_data$VOTE
 
 #shorten the names of the region names
 file_data$RegionName[file_data$RegionName == "London"] <- "L"
 file_data$RegionName[file_data$RegionName == "North West"] <- "NW"
 file_data$RegionName[file_data$RegionName == "North East"] <- "NE"
 file_data$RegionName[file_data$RegionName == "South West"] <- "SW"
 file_data$RegionName[file_data$RegionName == "South East"] <- "SE"
 file_data$RegionName[file_data$RegionName == "East Midlands"] <- "EM"
 file_data$RegionName[file_data$RegionName == "West Midlands"] <- "WM"
 file_data$RegionName[file_data$RegionName == "East of England"] <- "EE"
 file_data$RegionName[file_data$RegionName == 
                        "Yorkshire and The Humber"] <- "Y"
 file_data
 
 summary(file_data)
is.numeric(file_data$Proportion) 
numeric_variable_list <- sapply(file_data, is.numeric) 
numeric_variable_list
 #create a subset of the data frame which store only numeric data
numerical_data <- file_data[numeric_variable_list]

 
 
 
 
 
 
 
 
 












