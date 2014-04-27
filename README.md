README
=================
This scripts is used for generate tidy data from Samsung smart phone data. You could get the tidy data follow the steps below:

1. Download the data [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), and extract the zip file. You should end up with a folder named "UCI HAR Dataset".
2. put run_analysis.R file into the folder.
3. Run the script, and it will generate two files named tidy1.txt and tidy2.txt.
4. The tidy1.txt file merge the dataset from training and test, and only keep those variables measuring mean or std.
5. The tidy2.txt contains same variables, and row is the average of each varible for each activity and each subject.
6. The names of the feature is contained in CoodBook.md