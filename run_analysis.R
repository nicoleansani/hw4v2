## test data:
> ## test data
> > XTest<- read.table("UCI HAR Dataset/test/X_test.txt")
> YTest<- read.table("UCI HAR Dataset/test/Y_test.txt")
> SubjectTest <-read.table("UCI HAR Dataset/test/subject_test.txt")
> 
> ##train data
> XTrain<- read.table("UCI HAR Dataset/train/X_train.txt")
> YTrain<- read.table("UCI HAR Dataset/train/Y_train.txt")
> SubjectTrain <-read.table("UCI HAR Dataset/train/subject_train.txt")
> 
> ##features/activity
> features<-read.table("UCI HAR Dataset/features.txt")
> activity<-read.table("UCI HAR Dataset/activity_labels.txt")
> 
> ##merge train and test data
> X<-rbind(XTest, XTrain)
> Y<-rbind(YTest, YTrain)
> Subject<-rbind(SubjectTest, SubjectTrain)
> dim(X)
[1] 10299   561
> dim(Y)
[1] 10299     1
> dim(Subject)
[1] 10299     1


##question 2
> index<-grep("mean\\(\\)|std\\(\\)", features[,2])
> ##mean sd indecese
> length(index)
[1] 66
> X<-X[,index]
> dim(X)
[1] 10299    66
> 

> ## question 3
> ##use descriptive activity names to name data in dataset
> Y[,1]<-activity[Y[,1],2]
> head(Y)
        V1
1 STANDING
2 STANDING
3 STANDING
4 STANDING
5 STANDING
6 STANDING
> 

> ##question 4
> ##label datasets with descriptive variable names
> names<-features[index,2]
> names(X)<-names 
> names(Subject)<-"SubjectID"
> names(Y)<-"Activity"
> CleanedData<-cbind(Subject, Y, X)
> head(CleanedData[,c(1:4)]) 
  SubjectID Activity tBodyAcc-mean()-X tBodyAcc-mean()-Y
1         2 STANDING         0.2571778       -0.02328523
2         2 STANDING         0.2860267       -0.01316336
3         2 STANDING         0.2754848       -0.02605042
4         2 STANDING         0.2702982       -0.03261387
5         2 STANDING         0.2748330       -0.02784779
6         2 STANDING         0.2792199       -0.01862040
> 

##question 5
> ## create 2nd independent tidy data with ave of each variable for each activity and each subject
> CleanedData<-data.table(CleanedData)
> TidyData <- CleanedData[, lapply(.SD, mean), by = 'SubjectID,Activity']
> dim(TidyData)
[1] 180  68
> write.table(TidyData, file = "Tidy.txt", row.names = FALSE)
> head(TidyData[order(SubjectID)][,c(1:4), with = FALSE],12) 
    SubjectID           Activity tBodyAcc-mean()-X tBodyAcc-mean()-Y
 1:         1           STANDING         0.2789176      -0.016137590
 2:         1            SITTING         0.2612376      -0.001308288
 3:         1             LAYING         0.2215982      -0.040513953
 4:         1            WALKING         0.2773308      -0.017383819
 5:         1 WALKING_DOWNSTAIRS         0.2891883      -0.009918505
 6:         1   WALKING_UPSTAIRS         0.2554617      -0.023953149
 7:         2           STANDING         0.2779115      -0.018420827
 8:         2            SITTING         0.2770874      -0.015687994
 9:         2             LAYING         0.2813734      -0.018158740
10:         2            WALKING         0.2764266      -0.018594920
11:         2 WALKING_DOWNSTAIRS         0.2776153      -0.022661416
12:         2   WALKING_UPSTAIRS         0.2471648      -0.021412113
> 



