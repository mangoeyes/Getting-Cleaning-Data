#read all necessary data from working directory
features <- read.table("./features.txt", header=F,, as.is = T)
ActivityLabels <- read.table("./activity_labels.txt",header=F)

x_test <- read.table("./test/X_test.txt", header=F)
y_test <- read.table("./test/y_test.txt", header=F)
SubjectTest <- read.table("./test/subject_test.txt", header=F)

x_train <- read.table("./train/X_train.txt", header=F)
y_train <- read.table("./train/y_train.txt", header=F)
SubjectTrain <- read.table("./train/subject_train.txt", header=F)

#create final set of training and testing data
testData <- cbind(x_test,y_test);
testData <- cbind(testData,SubjectTest)
trainData <- cbind(x_train,y_train);
trainData <- cbind(trainData,SubjectTrain)
Data <- rbind(testData,trainData)

# Get only the data on mean and standard deviation.
colnames(Data) <- c(features$V2,"Activity","Subject")
colsNeed <- grep("*mean*|*std*", features$V2)
colsRemove <- grep("*meanFreq*",features$V2)
colsNeed <- setdiff(colsNeed,colsRemove)
colsNeed <- c(colsNeed,562,563)
DataNeed <- Data[, colsNeed]

#replace the activity id with activity label 
theActivity = 1
for (theActivityLabel in ActivityLabels$V2) {
  DataNeed$Activity <- gsub(theActivity, theActivityLabel, DataNeed$Activity)
  theActivity <- theActivity + 1
}

#calculate the mean of each observation by activity and by subject
DataNeed$Activity <- as.factor(DataNeed$Activity)
DataNeed$Subject <- as.factor(DataNeed$Subject)

tidy = aggregate(DataNeed, by=list(activity=DataNeed$Activity,subject=DataNeed$Subject), mean)

write.table(tidy, "tidy.txt", , row.name=FALSE,sep="\t")
