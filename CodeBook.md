<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. General</a></li>
<li><a href="#sec-2">2. Performed Steps</a></li>
<li><a href="#sec-3">3. Attributes</a></li>
</ul>
</div>
</div>

# General<a id="sec-1" name="sec-1"></a>

Tidying of sensor data from [Human Activity Recognition Using Smartphones Data Set ](http://archive.ics.uci.edu/ml/datasets/Human%2BActivity%2BRecognition%2BUsing%2BSmartphones)

# Performed Steps<a id="sec-2" name="sec-2"></a>

The steps are performed automatically by `run_analysis.R` as long as the dataset is in the same directory.

1.  Test as well as training data are merged
2.  Only columns of mean and standard deviation are used
3.  Subjects and activity labels by name are directly included in the dataset
4.  Mean for each measurement is calculated per subject and activity
5.  Resulting dataset is saved as `tidy.txt`

# Attributes<a id="sec-3" name="sec-3"></a>

-   **subject:** A number identifying one of the 30 subjects for which the data was recorded
-   **activity:** The type of activity the subject was performing when the data was recorded

Please refer to the `README.txt` of the original dataset for further information about the attributes.
