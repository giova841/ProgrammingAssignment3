# Programming Assignment 3
# Author: Giulio Giovannetti

# Load Libraries
library(dplyr)

# Define inputs
training_subject_file<-"./UCI HAR Dataset/train/subject_train.txt"
test_subject_file<-"./UCI HAR Dataset/test/subject_test.txt"
training_data_file<-"./UCI HAR Dataset/train/X_train.txt"
test_data_file<-"./UCI HAR Dataset/test/X_test.txt"
training_activity_file<-"./UCI HAR Dataset/train/y_train.txt"
test_activity_file<-"./UCI HAR Dataset/test/y_test.txt"
field_names_file<-"./UCI HAR Dataset/features.txt"
activity_labels_file<-"./UCI HAR Dataset/activity_labels.txt"

# Load data
training_subject<-read.table(training_subject_file,sep="")
test_subject<-read.table(test_subject_file,sep="")
training_data_set<-read.table(training_data_file,sep="")
test_data_set<-read.table(test_data_file,sep="")
training_activity<-read.table(training_activity_file,sep="")
test_activity<-read.table(test_activity_file,sep="")
field_names<-read.table(field_names_file,sep="")
activity_labels<-read.table(activity_labels_file,sep="")

# Complete data set
field_names<-field_names$V2
names(training_data_set)<-field_names
names(test_data_set)<-field_names
names(test_activity)<-"ActivityID"
names(training_activity)<-"ActivityID"
names(training_subject)<-"Subject"
names(test_subject)<-"Subject"

# Merge 'train' and 'test' data set
data_set<-rbind(test_data_set,training_data_set)
activity<-rbind(test_activity,training_activity)
subject<-rbind(test_subject,training_subject)

# Filter 'mean' and 'std' data fields
data_set<-select(data_set,grep("Mean|mean|Std|std",field_names))

# Append 'activity id', 'activity label' and 'subject'
data_set<-cbind(data_set,activity)
data_set<-mutate(data_set,ActivityLabel=activity_labels[ActivityID,2])
data_set<-select(data_set,-"ActivityID")
data_set<-cbind(data_set,subject)

# Prepare new data set
data_set<-group_by(data_set,ActivityLabel,Subject)
new_data_set<-summarise_all(data_set,mean)

# Save data
write.table(new_data_set,file = "tidy_data_set.txt",row.names = FALSE)
