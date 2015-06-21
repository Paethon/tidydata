## Load feature names
features <- read.csv("features.txt", header = FALSE, sep = "", as.is = TRUE)
features <- features[,2]              # Put feature names in vector

## Merge test and training data into X
Xtest <- read.csv("test/X_test.txt", header = FALSE, sep = "")
Xtrain <- read.csv("train/X_train.txt", header = FALSE, sep = "")
X <- rbind(Xtest, Xtrain)

## Correctly name feature columns
colnames(X) <- features

## Get all columns with mean or std 
meancols <- grep("mean", names(X), ignore.case = TRUE)
stdcols <- grep("std", names(X), ignore.case = TRUE)
colsOfInterest <- sort(c(meancols, stdcols))

## Restrict dataset to columns of interest
X <- X[,colsOfInterest]

## Get activity labels of different rows
Ytest <- read.csv("test/y_test.txt", header = FALSE, sep = "")
Ytrain <- read.csv("train/y_train.txt", header = FALSE, sep = "")
Y <- rbind(Ytest, Ytrain)
Y <- factor(Y$V1)                       # Change Y to factors

## Load the descriptive names of the labels and change Y to those names
labels <- read.csv("activity_labels.txt", header = FALSE, sep = "")
levels(Y) <- labels$V2

## Get subjects for different rows
subjectTest <- read.csv("test/subject_test.txt", header = FALSE, sep = "")
subjectTrain <- read.csv("train/subject_train.txt", header = FALSE, sep = "")
subject <- factor(rbind(subjectTest, subjectTrain)$V1)

## Attach subject and activity labels to measurements
X <- cbind(subject, Y,X)

## Set column labels
colnames(X)[1] <- "subject"
colnames(X)[2] <- "activity"

## Calc mean for each subject and activity and save to file
tidy <- aggregate(. ~ subject + activity, data=X, mean)
write.table(tidy, "tidy.txt", row.names = FALSE)
