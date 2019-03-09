# Data Cleaning
Course Project for Getting and Cleaning Data Johns Hopkins Certification.

# What is this data?
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' from the raw data for more details. 

# Included Files
This repository includes the following files:
* `run_analysis.R`: A script that pulls in 
* `CodeBook.md`: A codebook containing a description of the methodology used to create the output files and information on included variables.

# Using This Repository
To take advantage of this repository, simply run the `run_analysis.R` script. The `dplyr` and `tidyr` packages are required. The `tidyverse` package will also provide all necessary functions to execute this script.

The script will download and unzip the raw data into the same directory in which it is run, and its final output will be two tidy data frames, `hardata` and `harmeans`, that will be available as objects in the working directory.
