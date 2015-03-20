# 1. Merges the training and the test sets to create one data set.

trainX <- read.table("./data/train/X_train.txt")
trainy <- read.table("./data/train/y_train.txt")
trainSubject <- read.table("./data/train/subject_train.txt")

testX <- read.table("./data/test/X_test.txt")
testy <- read.table("./data/test/y_test.txt") 
testSubject <- read.table("./data/test/subject_test.txt")

joinX <- rbind(trainX, testX)
joiny <- rbind(trainy, testy)
joinSubject <- rbind(trainSubject, testSubject)

# 2. Extracts only the measurements on the mean and standard deviation for each
# measurement.

features <- read.table("./data/features.txt")
colnames(joinX)<-features[,2]
columns<- grepl("mean()",colnames(joinX)) | grepl("std()",colnames(joinX))
X_mean_std <- joinX[,columns]

# 3. Uses descriptive activity names to name the activities in the data set

activity <- read.table("./data/activity_labels.txt")
y <- as.factor(joiny[,1]) # factored for plyr
library(plyr)
y <- mapvalues(y, from = as.character(activity[,1]), to = as.character(activity[,2]))
X_mean_std <- cbind(y, X_mean_std)
colnames(X_mean_std)[1] <- "Activity"

# 4. Appropriately labels the data set with descriptive variable names.

X_mean_std <- cbind(joinSubject, X_mean_std)
colnames(X_mean_std)[1] <- "Subject"

# 5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.

library(reshape2)
X<- melt(X_mean_std,id.vars=c("Subject","Activity"))
Xtidy <- dcast(X, Subject + Activity ~ ..., mean)
write.table(Xtidy,"tidy_data.txt", row.name=FALSE)
