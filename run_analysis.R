library(data.table)
library(dplyr)

#Supporting Metadata
feature_Names <- read.table("Desktop/UCI HAR Dataset/features.txt")
activity_Labels <- read.table("Desktop/UCI HAR Dataset/activity_labels.txt", header = FALSE)

#Training Data
subject_Train <- read.table("Desktop/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activity_Train <- read.table("Desktop/UCI HAR Dataset/train/y_train.txt", header = FALSE)
features_Train <- read.table("Desktop/UCI HAR Dataset/train/X_train.txt", header = FALSE)

#Test Data
subject_Test <- read.table("Desktop/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activity_Test <- read.table("Desktop/UCI HAR Dataset/test/y_test.txt", header = FALSE)
features_Test <- read.table("Desktop/UCI HAR Dataset/test/X_test.txt", header = FALSE)

#Merging Training and Test Data
subject <- rbind(subject_Train, subject_Test)
activity <- rbind(activity_Train, activity_Test)
features <- rbind(features_Train, features_Test)
colnames(features) <- t(feature_Names[2])
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
all_Data <- cbind(features,activity,subject)

#Extracting Mean and STD
columns_MeanSTD <- grep(".*Mean.*|.*Std.*", names(all_Data), ignore.case=TRUE)
desired_Columns <- c(columns_MeanSTD, 562, 563)
extracted_Data <- all_Data[,desired_Columns]

#Descriptive Activity Names
extracted_Data$Activity <- as.character(extracted_Data$Activity)
  for (i in 1:6){
    extracted_Data$Activity[extracted_Data$Activity == i] <- as.character(activity_Labels[i,2])
  }
extracted_Data$Activity <- as.factor(extracted_Data$Activity)

#Descriptive Variable Names
names(extracted_Data)<-gsub("Acc", "Accelerometer", names(extracted_Data))
names(extracted_Data)<-gsub("Gyro", "Gyroscope", names(extracted_Data))
names(extracted_Data)<-gsub("BodyBody", "Body", names(extracted_Data))
names(extracted_Data)<-gsub("Mag", "Magnitude", names(extracted_Data))
names(extracted_Data)<-gsub("^t", "Time", names(extracted_Data))
names(extracted_Data)<-gsub("^f", "Frequency", names(extracted_Data))
names(extracted_Data)<-gsub("tBody", "TimeBody", names(extracted_Data))
names(extracted_Data)<-gsub("-mean()", "Mean", names(extracted_Data), ignore.case = TRUE)
names(extracted_Data)<-gsub("-std()", "STD", names(extracted_Data), ignore.case = TRUE)
names(extracted_Data)<-gsub("-freq()", "Frequency", names(extracted_Data), ignore.case = TRUE)
names(extracted_Data)<-gsub("angle", "Angle", names(extracted_Data))
names(extracted_Data)<-gsub("grav", "Gravity", names(extracted_Data))

#Second Tidy Data Set
extracted_Data$Subject <- as.factor(extracted_Data$Subject)
extracted_Data <- data.table(extracted_Data)
tidy_Data <- aggregate(. ~Subject + Activity, extracted_Data, mean)
tidy_Data <- tidy_Data[order(tidy_Data$Subject,tidy_Data$Activity),]
write.table(tidy_Data, file = "Tidy.txt", row.names = FALSE)


