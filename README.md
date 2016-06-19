# Getting-and-Cleaning-Data-Assignment
## Cousera assignment tasks
  The submitted data set is tidy.
  The Github repo contains the required scripts. 
  GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
  The README that explains the analysis files is clear and understandable.
  The work submitted for this project is the work of the student who submitted it.

## Achievements
  Merges the training and the test sets to create one data set.
  Extracts only the measurements on the mean and standard deviation for each measurement.
  Uses descriptive activity names to name the activities in the data set
  Appropriately labels the data set with descriptive variable names.
  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
## run_analysis.R code explanation
  It downloads the UCI HAR Dataset data set and unzips the file into the UCI HAR Dataset folder.
  Using rbind it merges the submitted datasets.
  It extracts just the mean and standard deviation from the features data set (called featnames). This is done using grep.
  After cleaning the column names, these are applied to the x data frame.
  By using tolower, it converts the columns names in lower case and removes underscore using gsub. activity and subject column names are named for y and subj data sets, respectively.
  The three data sets, x, y and subj, are merged. Then, it is exported as a txt file into the Project folder in the same working directory, named merged.txt.
  The mean of activities and subjects are created into a separate tidy data set which is exported into the Project folder as txt file; this is named average.txt.

The R code contains str for easier preview of the two final data sets.
