library(reshape2)

fname <- "UCIdata.zip"
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir <- "UCI Dataset"

if (!file.exists(fname)) {
    download.file(url, fname, mode = "wb")
}

if (!file.exists(dir)) {
    unzip(fname, files = NULL, exdir = ".")
}

# Load and label datasets
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]


# Read subject file and add column names
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(subject_test) <- "Subject_ID"

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(subject_train) <- "Subject_ID"


# Read x measurement files and add column names
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
names(x_test) <- features$V2

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
names(x_train) <- features$V2


# Read y label files and add column names
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
y_test[,2] <- activity_labels[y_test[,1]]
names(y_test) <- c("activity_id", "activity_label")

y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
y_train[,2] <- activity_labels[y_train[,1]]
names(y_train) <- c("activity_id", "activity_label")

# combine files into one dataset
train <- cbind(subject_train, y_train, x_train)
test <- cbind(subject_test, y_test, x_test)
combined <- rbind(train, test)


# Extract measurements on the mean and standard deviation
extract <- grepl("mean", names(combined)) | grepl("std", names(combined))
extract[1:3] <- TRUE

combined <- combined[,extract]
id_labels = c("Subject_ID", "activity_id", "activity_label")
labels = setdiff(colnames(combined), id_labels)

melted = melt(combined, id = id_labels, measure.vars = labels)

tidy = dcast(melted, Subject_ID + activity_label ~ variable, mean)

write.table(tidy, "tidy.txt", row.names = FALSE)
