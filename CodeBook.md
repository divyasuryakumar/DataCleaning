Getting and Cleaning Data Course Project CodeBook
=================================================
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.  
* The site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
The data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Prepare the data:
Read in the features.txt file
Define the features to be processed in the following by selecting all mean() and std() features
Read in the observations, subjects and activities for both training and test data

Create a Tidy data and then combine:
Merge the obeservations, subjects and activities from training and test data sets
reduce the observations to the features selected in 1.
Merge the three data tables into one table
define the column names and assign them to the columns of the data table
read in the activity labels
turn activities into a factor and relable them
Aggregate the data over subject and activity for each variable
assign the column names of the fist table to the columns of its aggregate

Store as two data files: 
Save the two tables in separate files
Note that the files will be stored in the working directory, not in a separate folder
