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
__Missing values:__
some features presents missing values, represented by the value -999.0. We have used the mean and median of each feature for each class and replaced all the missing values with the respective imputation value.

__Data Normalisation:__
in order to adjust the features values on different scales to common scale we normalised each feature population with mean 0 and standard deviation 1. To do so we’ve subtracted the populations mean to each sample and divided it by its deviation.

# Feature reduction/selection
Some of the methods used and available in the program to perform feature selection:
* Principal Component Analysis(PCA)
* Receiver Operating Characteristic(ROC)
* Kruskal-Wallis test
* minimum Redundancy and Maximum Relevance(mRMR)

# Classification

Some of classifiers used and available in the program to perform classification:
* Fisher Linear Discriminant
* Quadratic Discriminant
* Support Vector Machines
* K Nearest Neighbours
* Naives Bayesian

# Results 

| Classifier    | Accuracy      | Precision  |
| ------------- |:-------------:| -----:     |
| Fisher Linear | 0.8774        | 0.8484     |
| Quadratic     | 0.8683        | 0.8698     |
| Naives Bayes  | 0.8973        | 0.8979     |
| SVM(RBF)      | 0.9466        | 0.9134     |
| KNN (n=5)     | 0.9339        | 0.909      |
# Acknowledgements

* STPRTool (http://cmp.felk.cvut.cz/cmp/software/stprtool/)
* Mutual Information computation(http://www.mathworks.com/matlabcentral/fileexchange/14888-mutual-information-computation)
* minimum Redundancy and Maximum Relevance algorithm(http://penglab.janelia.org/proj/mRMR/)


