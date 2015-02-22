Getting and cleaning data course project

This repository contains files required for the course project.

Requirements:
* Data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip is downloaded in working directory.

The script run_analysis.r performs the following functions:
* Loads data into R and combines it into a single data frame
* Discards data not pertaining to mean or standard deviation
* Generates summary data tidyData.txt that contains average of all observation grouped by activity and test subject