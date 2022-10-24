# Covariance prediction for causal discovery in brain connectivity
Investigating how we could combine causal inference frameworks from social sciences 
and discovery frameworks from machine learning to improve the statistical efficiency 
of currently applied neuroimaging techniques.

## The data
Analysis based on data from the WU-Minn HCP 1200 Subjects Data Release with four complete rfMRI runs (with 100% of collected time points), as processed by [[1]](#1).
Two groups are defined: short and conventional sleepers, according to the classification from [[2]](#2).
* short sleepers: average equal or less than 6 hours each night
* conventional sleepers: average between 7 and 9 hours each night

Once cleaned and grouped, the data is structured as wollows:

**_Total subjcts:_** : 730, of which:

**_Classified as short sleepers_** : 241

**_Classified as conventional sleepers_** : 489


For every subject, we have the loaded timeseries consisting of 4800 timepoints for each of the 15 selected brain regions (thus resulting in 4800x15 matrices).

## Covariance prediction
*"Covariance prediction.Rmd"* has the full analysis on the mentioned data. 

Functions *base_analysis_full.R* and *base_analysis_unbiased.R* construct the treatment and control vectors by computing the sample covariance matrices and predicting the missing covariance matrices by averaging. The first one averages over *s*, the second over *s-1*.

Functions *knn_analysis_full.R* and *knn_analysis_unbiased.R* are equivalent to the previous ones but use knn average for the covariance prediction.

## Validity analysis
The experiments with simulated data can be found in *Testing.Rmd*.


## References
<a id="1">[1]</a> 
Seiler Christof, Holmes Susan (2017). 
Multivariate Heteroscedasticity Models for Functional Brain Connectivity. 
DOI=10.3389/fnins.2017.00696 .

<a id="2">[2]</a>
Hirshkowitz et al. (2015).
National Sleep Foundation's sleep recommendations: Methodology and results summary, Sleep Health.
https://doi.org/10.1016/j.sleh.2014.12.010.
