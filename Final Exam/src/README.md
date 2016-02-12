==================================================================
Coursera Getting and Cleaning Data

==================================================================
Christan Cleber Masdeval Braz

==================================================================

This repo is part of the final exam of Getting and Cleaning Data course. 

The project is based on the Human Activity Recognition Using Smartphones Dataset. This dataset contains the following files 

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.


 To create the dataset as asked for the project I have used the files: features.txt, activity_labels.txt, train/X_train.txt, train/y_train.txt, test/X_test.txt, test/y_test.txt.

  The script run_analysis.R perform all the job to create two main datasets:

  - UCI_HAR_Dataset_tidy: this is the data created doing all the necessary manipulations from the original dataset until getting a tidy unique dataset. 

  - UCI_HAR_Dataset_grouped: this is the data created from the previous tidy dataset grouping by the desired columns. 
  
  
  To run the script, just download the original dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip in the Downloads directory of your home directory. Unzip the file. This will create the "UCI HAR Dataset" directory. Start your R program and execute run_analysis.R.

  Please, for more information about the manipulations done in the data and the description of the datasets see run_analysis.R and codebook.txt  
