#Source
- Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Data
- README.txt
- features_info.txt
- features.txt
- activity_labels.txt
- train/X_train.txt
- train/y_train.txt
- test/X_test.txt
- test/y_test.txt

#####Within the train and test data sets: 
- train/subject_train.txt
- train/Inertial Signals/total_acc_x_train.txt
- train/Inertial Signals/body_acc_x_train.txt
- train/Inertial Signals/body_gyro_x_train.txt

#Variables 
- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values.
- iqr(): Interquartile range
- entropy(): Signal entropy
- arCoeff(): Autoregression coefficients with Burg order equal to 4
- correlation(): Correlation coefficient between two signals
- maxInds(): Index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): Skewness of the frequency domain signal
- kurtosis(): Kurtosis of the frequency domain signal
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between some vectors.


#Transformation
All the values are calculated means, aggregated over 30 subjects and 6 activities. Therefore the data sets dimensions are 180 by 68.  

