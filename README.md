README
=================
This scripts is used for generate tidy data from Samsung smart phone data. You could get the tidy data follow the steps below:

1. Download the data [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), and extract the zip file. You should end up with a folder named "UCI HAR Dataset".
2. put run_analysis.R file into the folder.
3. Run the script, and it will generate a file named tidy.txt.
4. The tidy.txt combined all the records from training and testing, only with measurement of mean and standard deviation, and then average of each measurement for each activity and each subject.
5. The names of the feature is contained in CoodBook.md.