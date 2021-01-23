# Tidy-Data-course-project-PZ

The dataset includes the following four files:

- 'README.txt'

- ‘run_analysis .R:  R script used to generate data2.txt. This script satisfies five points (pt) required in the assignment as follows. Data from training and test tests are read and extracted out only measures with the mean and standard deviation (pt2). The new data’s colnames are replaced with descriptive variable names, followed by merge via rbind () (pt1&4). The combine_data is updated with descriptive activity name (pt3) - this is the first tidy dataset. combine_data is then grouped by subject and activity, and summarized using mean () for all column variables — this produces  the second tidy dataset named data2.txt (pt5).

- ‘data2.txt: the second tidy dataset consisting of the average values for each variable per subject per activity.  Since there are 30 subjects and 6 activity measures, there are 180 rows for each subject and each activity. Columns show average values for the variables measured. After downloading the file, use read.table (“data2.txt”,header=TRUE) to read the file.


- ‘CodeBook.txt': List descriptive variables in details and how they are generated.
