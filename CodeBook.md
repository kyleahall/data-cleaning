# Codebook
## Data Processing Overview
`run_analysis.R` selects the relevant data files from the raw data, gives them simplified names, and produces two output files, hardata, which includes all of the test and train data and harmeans, which contains averages for each subject, variable, and activity.

## Processing Steps
* First, if the output folder does not exist in the working directory, download the zip file as "HAR Data.zip" and unzips in the current directory.
* Reads in the data tables to be combined for the data, subjects, and activities.
* Reads in feature names and activity labels, then clean names to purge all non-alphanumeric characters and set to lower case.
* Reads data into a single combined table, and extract only measurements for mean and standard deviation
* Converts activity information to human-readable names, combines test and train data for subjects and activities
* Creates first output dataset `hardata` by combining the named data, subject, and activity information.
* Creates the 2nd output dataset `harmeans` by gathering all of the variable columns into one column, grouping on subject, activity, and variable name, and doing a mean summarisation of the data.

# Description of Output Files
NOTE: `hardata` is a wide dataset, consistent with the structure of the raw dataset, with 88 columns. For ease of analysis, the `harmeans` dataset was gathered to be tall and skinny, and only has 4 columns, representing each unique variable-subject-activity combination as a row.

Both `harmeans` and `hardata` contain the following columns:

* subject - The ID of the participant.
* activity - The name of the activity corresponding to the measurements - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING. For consistency with the underlying data, activity names are not stripped of extra characters or made lower case.

Included Variables:
	
1 - tbodyaccmeanx
2 - tbodyaccmeany
3 - tbodyaccmeanz
4 - tbodyaccstdx
5 - tbodyaccstdy
6 - tbodyaccstdz
7 - tgravityaccmeanx
8 - tgravityaccmeany
9 - tgravityaccmeanz
10 - tgravityaccstdx
11 - tgravityaccstdy
12 - tgravityaccstdz
13 - tbodyaccjerkmeanx
14 - tbodyaccjerkmeany
15 - tbodyaccjerkmeanz
16 - tbodyaccjerkstdx
17 - tbodyaccjerkstdy
18 - tbodyaccjerkstdz
19 - tbodygyromeanx
20 - tbodygyromeany
21 - tbodygyromeanz
22 - tbodygyrostdx
23 - tbodygyrostdy
24 - tbodygyrostdz
25 - tbodygyrojerkmeanx
26 - tbodygyrojerkmeany
27 - tbodygyrojerkmeanz
28 - tbodygyrojerkstdx
29 - tbodygyrojerkstdy
30 - tbodygyrojerkstdz
31 - tbodyaccmagmean
32 - tbodyaccmagstd
33 - tgravityaccmagmean
34 - tgravityaccmagstd
35 - tbodyaccjerkmagmean
36 - tbodyaccjerkmagstd
37 - tbodygyromagmean
38 - tbodygyromagstd
39 - tbodygyrojerkmagmean
40 - tbodygyrojerkmagstd
41 - fbodyaccmeanx
42 - fbodyaccmeany
43 - fbodyaccmeanz
44 - fbodyaccstdx
45 - fbodyaccstdy
46 - fbodyaccstdz
47 - fbodyaccmeanfreqx
48 - fbodyaccmeanfreqy
49 - fbodyaccmeanfreqz
50 - fbodyaccjerkmeanx
51 - fbodyaccjerkmeany
52 - fbodyaccjerkmeanz
53 - fbodyaccjerkstdx
54 - fbodyaccjerkstdy
55 - fbodyaccjerkstdz
56 - fbodyaccjerkmeanfreqx
57 - fbodyaccjerkmeanfreqy
58 - fbodyaccjerkmeanfreqz
59 - fbodygyromeanx
60 - fbodygyromeany
61 - fbodygyromeanz
62 - fbodygyrostdx
63 - fbodygyrostdy
64 - fbodygyrostdz
65 - fbodygyromeanfreqx
66 - fbodygyromeanfreqy
67 - fbodygyromeanfreqz
68 - fbodyaccmagmean
69 - fbodyaccmagstd
70 - fbodyaccmagmeanfreq
71 - fbodybodyaccjerkmagmean
72 - fbodybodyaccjerkmagstd
73 - fbodybodyaccjerkmagmeanfreq
74 - fbodybodygyromagmean
75 - fbodybodygyromagstd
76 - fbodybodygyromagmeanfreq
77 - fbodybodygyrojerkmagmean
78 - fbodybodygyrojerkmagstd
79 - fbodybodygyrojerkmagmeanfreq
80 - angletbodyaccmeangravity
81 - angletbodyaccjerkmeangravitymean
82 - angletbodygyromeangravitymean
83 - angletbodygyrojerkmeangravitymean
84 - anglexgravitymean
85 - angleygravitymean
86 - anglezgravitymean

In the `harmeans` dataset, variable names are all kept in the `varnames` column, and each average value is held in the `varmeans` column. In the `hardata` dataset, each variable is in a column with the index and name described above.
