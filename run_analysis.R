# Make sure we have dplyr and tidyr loaded3 for our final output
require(dplyr)
require(tidyr)

# Download and unzip the file, such that there is a folder called "UCI HAR Dataset" 
# in the WD that contains all base data
if(!file.exists("./UCI HAR Dataset")) {
  download.file( "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
        "UCI HAR.zip", method = "curl")
  list <- unzip("UCI HAR.zip", list = TRUE)
  unzip("UCI HAR.zip")
}

# Read in the data tables to be combined for the data, subjects, and activities

testdata <- read.table("./UCI HAR Dataset/test/X_test.txt")
traindata <- read.table("./UCI HAR Dataset/train/X_train.txt")
testsubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
trainsubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
testactivity <- read.table("./UCI HAR Dataset/test/y_test.txt")
trainactivity <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Read in feature names and activity labels. Clean names to purge extra characters and set to lower case.
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
names <- read.table("./UCI HAR Dataset/features.txt")
names <- gsub("[()]", "",names[, 2])
names <- gsub("-", "", names)
names <- gsub(",", "", names)
names <- tolower(names)

# Read data into a single table, and extract only measurements for mean and standard deviation
hardata <- rbind(testdata, traindata)
names(hardata) <- names
hardata <- hardata[, grep("mean|std", names)]

# Convert activity IDs to activity names, bind test and train data for subjects and activities, set names
subjects <- rbind(testsubject, trainsubject)
names(subjects) <- "subject"
activities <- rbind(testactivity, trainactivity)
activities[, 1] <- factor(activities[, 1], labels = activity_labels[, 2])
names(activities) <- c("activity")

# Create 1st output dataset hardata, and cleanup intermediary tables from the directory
hardata <- cbind(hardata, subjects, activities)
rm(testdata, testactivity, testsubject, trainactivity, traindata, 
     trainsubject, names, activity_labels, activities, subjects)

# Convert hardata into a separate tidy, long and skinny data tbl such that column varmeans contains
# the average of each variable for each subject and activity.
 harmeans <- gather(hardata, key = "varnames", value = "varmeans", names(hardata[, 2:87])) %>% 
   group_by(subject, activity, varnames) %>% 
     summarise(varmeans = mean(varmeans))
