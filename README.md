# Higgs-Boson-Identification

We use Pattern Recognition/Machine Learning approaches to classify collision events into ”tau tau decay of a Higgs boson” versus ”background” from the data provided the Kaggle Higgs Boson Machine Learning Challenge. The program is built with MATLAB and also has a user interface to combine several techniques to get the best performance in the dataset.

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
| ------------- |:-------------:| :-----:     |
| Fisher Linear | 0.8774        | 0.8484     |
| Quadratic     | 0.8683        | 0.8698     |
| Naives Bayes  | 0.8973        | 0.8979     |
| SVM (RBF)     | 0.9466        | 0.9134     |
| KNN (n=5)     | 0.9339        | 0.909      |

# Code 

All the functions have a similar signature. The exception is the load function, function [ dataset ] = pr load( path, name ), which given the path to the data set and a name, loads and creates the structure compatible with stprtool. All the re- maining functions receive that structure, dataset, a type of operation, type, and the specific input arguments to the operation if necessary, varargin. They also return a similar output which is the new dataset and some specific output values, varargout. The output values are preserved inside the structure.

* pr_missing_values(...)
Here is where we fill the missing values. At the moment we have only one way of doing it, imputation, and it receives as argument either ’mean’ or ’median’.

* pr_feature_extraction(...)
Although this function doesn’t modify the dataset it can give us information about the feature extractions using either pca or lda.

* pr_feature_selection(...)
This function reduces the number of features using one of the following methods: kruskal-wallis, ROC or mrMR. All of them receive the number of features to remain. mrMR receives additionally how the score is calculated, quotient or subtraction.

* pr_plot()
Whenever we want to display some information, we use this function. For now, we have only three types of plots: results-pca-linproj, results-pca-eigenvalues and results-pca-table. The first two are self-explanatory, the last one will show a table with eigenvalues, variation and the respective cumulative sum.

* pr_classify()
This function trains a classifier based on the training and predicts labels for the testing data.The available classifiers: SVM, KNN, SVM, fisher-linear-discriminant and discriminant-quadratic. All of them receives the training data set and the testing data set. The KNN receives also the number of neighbours.

* pr_evaluation()
After the classification we will evaluate its performance with this function, which will compute the re-substitution error for the classifier, the error in cross-validation and also some important statistical information about the predicted label and the real ones.

# Acknowledgements

* STPRTool (http://cmp.felk.cvut.cz/cmp/software/stprtool/)
* Mutual Information computation(http://www.mathworks.com/matlabcentral/fileexchange/14888-mutual-information-computation)
* minimum Redundancy and Maximum Relevance algorithm(http://penglab.janelia.org/proj/mRMR/)


