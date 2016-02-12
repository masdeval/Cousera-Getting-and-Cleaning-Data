#Final exam 

#Load the activity labels
activity_labels<-read.table("~/Downloads/UCI HAR Dataset/activity_labels.txt")
#Add descriptive name columns
colnames(activity_labels)<-c("V1","activity_description")
#Load the features names
column_name<-read.table("~/Downloads/UCI HAR Dataset/features.txt")

#Load X_test 
X_test <- read.table("~/Downloads/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
#Set the column names for X_test
colnames(X_test) <- column_name[,2]
#Select only the mean and std measures
X_test<- X_test[grepl("mean\\(\\)|std\\(\\)",names(X_test))]
#Load the corresponding activity for test dataset
activity_test<-read.table("~/Downloads/UCI HAR Dataset/test/y_test.txt")
#Append horizontally the activity information 
X_test[,"activity"]<- activity_test
#Load the subject information for test dataset
subject_test<-read.table("~/Downloads/UCI HAR Dataset/test/subject_test.txt")
#Append horizontally the subject information
X_test[,"subject"]<- subject_test
#Join the activity label table within X_test
X_test<-merge(X_test, activity_labels, by.x='activity',by.y="V1")
#Remove from X_test columns names invalid characteres  
colnames(X_test)<-gsub("\\)|\\(|-","",names(X_test))

#Load X_train
X_train <- read.table("~/Downloads/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
#Set the column names for X_train
colnames(X_train) <- column_name[,2]
#Select only the mean and std measures
X_train<- X_train[grepl("mean\\(\\)|std\\(\\)",names(X_train))]
#Load the corresponding activity for test dataset
activity_train<-read.table("~/Downloads/UCI HAR Dataset/train/y_train.txt")
#Append horizontally the activity information 
X_train[,"activity"]<- activity_train
#Load the subject information for train dataset
subject_train<-read.table("~/Downloads/UCI HAR Dataset/train/subject_train.txt")
#Append horizontally the subject information
X_train[,"subject"]<- subject_train
#Join the activity label table within X_train
X_train<-merge(X_train, activity_labels, by.x='activity',by.y="V1")
#Remove from X_train columns names invalid characteres
colnames(X_train)<-gsub("\\)|\\(|-","",names(X_train))

#Merge vertically X_train and X_test
UCI_HAR_Dataset <- rbind(X_train,X_test)


#Tidy data
library(tidyr)
library(dplyr)

#Gather all the measures into a single column called normalized_measure
UCI_HAR_Dataset_tidy <- gather(UCI_HAR_Dataset,name,normalized_measure,
-activity,
-activity_description,
-subject

)
#From the name of the variables extract those related to Frequency from those related to Time. This will create a new column 
#signal_domain with the correct flag
UCI_HAR_Dataset_tidy <- separate(UCI_HAR_Dataset_tidy,name,c("signal_domain","name"),1)
#Change the value of the new column signal_domain from t and f to Frequency and Time
UCI_HAR_Dataset_tidy[,"signal_domain"] <- sub("f","Frequency",UCI_HAR_Dataset_tidy[,"signal_domain"]) 
UCI_HAR_Dataset_tidy[,"signal_domain"] <- sub("t","Time",UCI_HAR_Dataset_tidy[,"signal_domain"]) 
#From the name of the variables extract those related to Mean from those related to Standard Deviation. This will create a new column 
#operation with the correct flag
UCI_HAR_Dataset_tidy[,"operation"] <- grepl("mean",UCI_HAR_Dataset_tidy[,"name"])
UCI_HAR_Dataset_tidy[,"operation"] <- sub("TRUE","Mean",UCI_HAR_Dataset_tidy[,"operation"]) 
UCI_HAR_Dataset_tidy[,"operation"] <- sub("FALSE","Std",UCI_HAR_Dataset_tidy[,"operation"]) 
UCI_HAR_Dataset_tidy[,"name"] <- sub("mean|std","",UCI_HAR_Dataset_tidy[,"name"]) 

#Now the date is tidy

#Create the new dataset with grouped information

UCI_HAR_Dataset_grouped <- UCI_HAR_Dataset_tidy %>%

group_by(subject,activity_description, name,signal_domain, operation) %>%

summarise(

mean = mean(normalized_measure)
)

