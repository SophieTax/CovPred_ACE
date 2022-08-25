# Git_Internship
# ( Work in progress on the name )
Investigating how we could combine causal inference frameworks from social sciences 
and discovery frameworks from machine learning to improve the statistical efficiency 
of currently applied neuroimaging techniques.

## The data
Analysis based on data from the WU-Minn HCP 1200 Subjects Data Release with four complete rfMRI runs (with 100% of collected time points), as processed by [[1]](#1).
Two groups are defined: short and conventional sleepers, according to the classification from [[2]](#2).
* short sleepers: average equal or less than 6 hours each night
* conventional sleepers: average between 7 and 9 hours each night

Once cleaned and grouped, we worked with the following data:
**_Total subjcts:_** : 730, of which:.
**_Classified as short sleepers_** : 241.
**_Classified as conventional sleepers_** : 489.

For every subject, we have the loaded timeseries consisting of 4800 timepoints for each of the 15 selected brain regions (thus resulting in 4800x15 matrices).

## References
<a id="1">[1]</a> 
Seiler Christof, Holmes Susan (2017). 
Multivariate Heteroscedasticity Models for Functional Brain Connectivity. 
DOI=10.3389/fnins.2017.00696 .

<a id="2">[2]</a>
Hirshkowitz et al. (2015).
National Sleep Foundation's sleep recommendations: Methodology and results summary, Sleep Health.
https://doi.org/10.1016/j.sleh.2014.12.010.
