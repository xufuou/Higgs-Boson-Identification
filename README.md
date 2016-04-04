# Higgs-Boson-Identification

Classification collision events into ”tau tau decay of a Higgs boson” versus ”background” from the data provided the Kaggle Higgs Boson Machine Learning Challenge using ML approaches on MATLAB

# Some features
* User interface
* Pre processing tools
* Feature extraction tools
* Feature selection tools
* Classification tools
* Save a preset model

# Dataset
The provided training data set contains 200000 events, with an ID column, 30 feature columns and a label column. The label column discriminates ”background” events from events related to the “tau tau decay of a Higgs boson”. The original data set and all other details about the features can be found at https://www.kaggle.com/c/higgs-boson/ data, and at http://higgsml.lal.in2p3.fr/files/2014/04/documentation_v1.8. pdf.

* Training: 16000 events
* Testing: 40000 events

# Pre-processing
__Missing values__ 
Some features presents missing values, represented by the value -999.0. We have used the mean and median of each feature for each class and replaced all the missing values with the respective imputation value.

__Data Normalisation__
In order to adjust the features values on different scales to common scale we normalised each feature population with mean 0 and standard deviation 1. To do so we’ve subtracted the populations mean to each sample and divided it by its deviation.

# Feature reduction/selection
__Principal Component Analysis(PCA)__
__Receiver Operating Characteristic(ROC)__
__Kruskal-Wallis test__
__minimum Redundancy and Maximum Relevance(mRMR)__

# Classification

__Fisher Linear Discriminant__
__Quadratic Discriminant_
__Support Vector Machines__
__K Nearest Neighbours__
__Naives Bayesian__


# Additional tools

* STPRTool (http://cmp.felk.cvut.cz/cmp/software/stprtool/)
* Mutual Information computation(http://www.mathworks.com/matlabcentral/fileexchange/14888-mutual-information-computation)
* minimum Redundancy and Maximum Relevance algorithm(http://penglab.janelia.org/proj/mRMR/)


