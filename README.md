# Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
The data linked to this exercice represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This Repo contains the final application to the Course Project, it contain:

* The data set obtained from : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* The R script to run all commands to perform the analisys: run_analysis.R
* The codebook.MD describing the variables and all the manipulation
* The file tidy.txt with de final dataset

So, to generate the tidy.txt you must fork this repo, pull to your R enviroment (to create this project was used RStudio Version 1.1.383), install the dplyr and plyr packages, and execute the script run_analysis.R; The result shoul be a file called tidy.txt and a dataset in the global environment called tidy_data;

required to submitions: 
1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.


# Citation Request:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
