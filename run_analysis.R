library(data.table)
library(dplyr)

//Supporting Metadata
feature_Names <- read.table("Desktop/UCI HAR Dataset/features.txt")
activity_Labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

//Training Data
subject_Train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activity_Train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
features_Train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
