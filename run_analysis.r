## Loads Libraries
library(tidyverse)

#Sets working Directory to the location of the files
setwd("C:/Users/BParisi/Downloads/Practice Data/UCI HAR Dataset")

#Reads in CSVs
testst <- read.table("C:/Users/BParisi/Downloads/Practice Data/UCI HAR Dataset/test/subject_test.txt")
testx <- read.table("C:/Users/BParisi/Downloads/Practice Data/UCI HAR Dataset/test/X_test.txt")
testy <- read.table("C:/Users/BParisi/Downloads/Practice Data/UCI HAR Dataset/test/y_test.txt")

trainst <- read.table("C:/Users/BParisi/Downloads/Practice Data/UCI HAR Dataset/train/subject_train.txt")
trainx <- read.table("C:/Users/BParisi/Downloads/Practice Data/UCI HAR Dataset/train/X_train.txt")
trainy <- read.table("C:/Users/BParisi/Downloads/Practice Data/UCI HAR Dataset/train/y_train.txt")

#Reads the features and Labels
features <- read.table("C:/Users/BParisi/Downloads/Practice Data/UCI HAR Dataset/features.txt")
activity <- read.table("C:/Users/BParisi/Downloads/Practice Data/UCI HAR Dataset/activity_labels.txt")

#Apply the labels
colnames(trainx) =features[,2]
colnames(trainy) = "Activity"
colnames(trainst) = "Subject"

colnames(testx) =features[,2]
colnames(testy) = "Activity"
colnames(testst) = "Subject"

colnames(activity) <- c("Activity", "Type")

#Merge
mergetrain <- cbind(trainx,trainy, trainst)
mergetest <- cbind(testx, testy, testst)

completemerge <- rbind(mergetrain, mergetest)

#Check the values
ValNames = colnames(completemerge)

#Take only the needed Columns as a logical operation
Means_SDs <- (grepl("Activity" , ValNames) | 
              grepl("Subject" , ValNames) | 
              grepl("mean.." , ValNames) | 
              grepl("std.." , ValNames))

#Incorperating the above logic within the completely merged file to select only those fields
Means_SDs2 <- completemerge[ , Means_SDs == TRUE]

#Grouped by Activity
GroupedbyActivity <- merge(Means_SDs2, ValNames, x.by="Activity",all.x=TRUE)

#Final Cleaning                               

Cleaned<-  summarize_all(GroupedbyActivity, mean, na.rm = TRUE)

#Writes the averages of each column into a txt file
write.table(Cleaned2, "Cleaned.txt", row.name=FALSE)
