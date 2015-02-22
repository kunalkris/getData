Data sets:
* /test/X_test.txt - Testing set
* /test/y_test.txt - Testing labels
* /test/subject_test.txt - List of subjects in testing dataset
* /train/X_train.txt - Training set
* /train/y_train.txt - Training labels
* /train/subject_train.txt - List of subjects in training dataset
* /activity_labels.txt - Class labels and corresponding activity name
* /features.txt - List of all features

Variables:
* x_test - Data input from /test/X_test.txt
* y_test - Data input from /test/y_test.txt
* subject_test - Data input from /test/subject_test.txt
* x_train - Data input from /train/X_train.txt
* y_train - Data input from /train/y_train.txt
* subject_train - Data input from /train/subject_train.txt
* activity_labels - Data input from /activity_labels.txt
* feature - Data input from /features.txt
* x_data - Merge of x_test and x_train using rbind
* y_data - Merge of y_test and y_train usind rbind
* subject - Merge of subject_test and subject_train using rbind
* runAnalysis - Merge of subject, y_data and x_data using cbind. It is then susbset to include only those columns which contain data of mean and standard deviation
* colWithMean - Columns in runAnalysis (pre-subset) that contain data of mean. Used to subset runAnalysis
* colWithStd - Columns in runAnalysis (pre-subset) that contain data of standard deviation.
used to subset runAnalysis
* tidyData - Data frame containing average of all variables of runAnalysis by subject and activity