# Code Book

## Preface
The variables come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## Variable naming convention of tidyDataset
1. prefix: time - time domain signals
2. prefix: frequency - frequency domain signals
3. Body - body movement signals
4. Gyroscope - signal recorded by Gyroscope
5. Acceleration - signal recored by Acceleration Meters
6. Magnitude - signals calculated using the Euclidean norm
7. activity - behavior category which the subject was asked to perform
8. subject - index of tested subject
9. mean(): Mean value
10. std(): Standard deviation

## Variable in summarisedTidyDataset and "step5.txt"

Other than activity and subject cols, all variables of tidyDataset are summarized by mean(), grouped by each activity and each subject. 

