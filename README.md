# Reproducing this research

## Instruction
1. Download [this data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into your R working directory. And directly unzip downloaded file right into working directory. (You should find the "UCI HAR Dataset" folder.)
2. Run the "run_analysis.R".
3. In the working directory, "step5.txt" will be generated.

## How this script works
1. At first, it reads in fragmented datasets within the "UCI HAR Dataset" folder.
2. It combines activity label and subject number data, and then combines test and train datasets all together. Finally, it organizes the col names.
3. Then, it extracts only mean() and std() information together with activity label and subject number data.
4. Afterward, it starts to make activity labels and col names more descriptive.
5. Finally, by using dplyr package, it summarises the mean of each variable by each activity and each subject.
6. Reference of variables is in CodeBook.md