#1.Merges the training and the test sets to create one data set.
## 1.a.Get the zip file from URL and unzip
if(!file.exists("./G&CD Assignment")) dir.create("./G&CD Assignment")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./G&CD Assignment/UCI HAR Dataset.zip")
listZip <- unzip("./G&CD Assignment/UCI HAR Dataset.zip", exdir = "./G&CD Assignment")

## 1.b.Merging the data sets
xtrain <- read.table('./G&CD Assignment/UCI HAR Dataset/train/X_train.txt')
xtest <- read.table('./G&CD Assignment/UCI HAR Dataset/test/X_test.txt')
x <- rbind(xtrain, xtest)

strain <- read.table('./G&CD Assignment/UCI HAR Dataset/train/subject_train.txt')
stest <- read.table('./G&CD Assignment/UCI HAR Dataset/test/subject_test.txt')
subj <- rbind(strain, stest)

ytrain <- read.table('./G&CD Assignment/UCI HAR Dataset/train/y_train.txt')
ytest <- read.table('./G&CD Assignment/UCI HAR Dataset/test/y_test.txt')
y <- rbind(ytrain, ytest)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
featnames <- read.table('./G&CD Assignment/UCI HAR Dataset/features.txt')
mean.sd <- grep("-mean\\(\\)|-std\\(\\)", featnames[, 2])
meas_mean_sd <- x[, mean.sd]


# 3. Uses descriptive activity names to name the activities in the data set
names(meas_mean_sd) <- featnames[mean.sd, 2]
names(meas_mean_sd) <- tolower(names(meas_mean_sd)) 
names(meas_mean_sd) <- gsub("\\(|\\)", "", names(meas_mean_sd))

activities <- read.table('./G&CD Assignment/UCI HAR Dataset/activity_labels.txt')
activities[, 2] <- tolower(as.character(activities[, 2]))
activities[, 2] <- gsub("_", "", activities[, 2])

y[, 1] = activities[y[, 1], 2]
colnames(y) <- 'activity'
colnames(subj) <- 'subject'


# 4. Appropriately labels the data set with descriptive activity names.
data <- cbind(subj, meas_mean_sd, y)
str(data)
write.table(data, './G&CD Assignment/merged.txt', row.names = F)


# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
average.df <- aggregate(x=data, by=list(activities=data$activity, subj=data$subject), FUN=mean)
average.df <- average.df[, !(colnames(average.df) %in% c("subj", "activity"))]
str(average.df)
write.table(average.df, './G&CD Assignment/average.txt', row.names = F)