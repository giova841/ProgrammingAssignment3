---
title: 'Code Book'
output: 
  pdf_document: 
    toc: yes
    number_sections: yes
  html_document: 
    toc: yes
    number_sections: yes
---
# Study design

The data set "tidy_data_set.txt" is made through a processing of the UCI HAR data set by:

* merging the "train" and "test" data set;
* grouping the data by "activity" and "sbuject";
* selecting just the "mean" and "std" columns;
* calculating the mean value for each column.

# Code book

## Size

* Number of records: 180+1 (the first row representing the column headers)
* Number of variables: 88

## Variables

### Variable 1: "ActivityLabel"
Each record is related to a subject performing one of the following activities:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

### Variable 2: "Subject"

Each record is related to a subject identified with numerical labels:

* 1
* 2
* ...
* 30

### Variables 3-end

Please, refer to the UCI HAR Data Set for a complete description of these variables.
