# get data from test group. 
test_data <-read.csv("./test/X_test.txt",sep ="",header =FALSE) 
# get feature info. Create an index list for the feature name containing mean or std
features<-read.csv("./features.txt",sep ="",header =FALSE)
# grep the index for the feature containing either mean or std
features_index <-grep("mean|std",features$V2) 
#subset test_data using feature index -extracting only measurments on the mean or std. 
new_test <-test_data[,features_index]
library(dplyr) 
# change multiple colnames to corresponding descriptive variable names
new_test <- new_test %>% `colnames<-`(features$V2[features_index])
# get subject and activity info. Rename and use cbind to add these two columns to create a new_test data
subject_test <-read.csv("./test/subject_test.txt",sep ="",header =FALSE)
subject_test <-rename(subject_test,subject = V1)
activity_test <-read.csv("./test/y_test.txt",sep ="",header =FALSE)
activity_test <-rename(activity_test,activity = V1)
new_test <-cbind(subject_test,activity_test,new_test)

# do the same above steps for train_data,and get a new_train data
train_data <-read.csv("./train/X_train.txt",sep ="",header =FALSE)
new_train <-train_data[,features_index]
new_train <- new_train %>% `colnames<-`(features$V2[features_index])
subject_train <-read.csv("./train/subject_train.txt",sep ="",header =FALSE)
subject_train <-rename(subject_train,subject = V1) 
activity_train <-read.csv("./train/y_train.txt",sep ="",header =FALSE)
activity_train <-rename(activity_train,activity = V1)
new_train <-cbind(subject_train,activity_train,new_train)

#merge new_test and new_train using rbind. Change numeric codes to descriptive activities.
#combine_data is the first tidy data set generated.
combine_data <-rbind(new_test,new_train)
combine_data$activity[combine_data$activity ==1] <-"WALKING"
combine_data$activity[combine_data$activity ==2] <-"WALKING_UPSTAIRS"
combine_data$activity[combine_data$activity ==3] <-"WALKING_DOWNSTAIRS"
combine_data$activity[combine_data$activity ==4] <-"SITTING"
combine_data$activity[combine_data$activity ==5] <-"STANDING"
combine_data$activity[combine_data$activity ==6] <-"LAYING"

# group data by subject and then activity, then summarize each column variables using mean function.
# data2 is the second tidy data set generated.
data2 <- combine_data %>% group_by(subject,activity) %>% summarise_all(mean)
write.table(data2,"data2.txt",row.name = FALSE)
View(data2)

#The following is an example how you can review the file after downloading it.
data_temp <-read.table("data2.txt",header =TRUE)
View(data_temp)






