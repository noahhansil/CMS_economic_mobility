## File utilized to perform analysis on various QOL Attributes

import scipy.stats
import numpy as np
import pandas as pd

avg_att = pd.read_csv('C:/Users/Noah/Documents/DTSC_4301/meaning_files/average_Attributes.csv')


# Pearson Correlation Coeffecient
## Comparing Violent crimes per 1000 in 2015 against the average college enrollment percentage from 2015-2020
x1 = avg_att['Violent_Crimes_2015']
y = avg_att['College_Enrollment']

crime2015_collegeEnrollment = scipy.stats.pearsonr(x1, y)
print(crime2015_collegeEnrollment)
# Results R = -0.77619 | p-value = 0.000152

## Comparing Violent crimes per 1000 in 2019 against the average college enrollment percentage from 2015-2020
x2 = avg_att['Violent_Crimes_2019']
y = avg_att['College_Enrollment']

crime2019_collegeEnrollment = scipy.stats.pearsonr(x2, y)
print(crime2019_collegeEnrollment)
#Results R = -0.80562 | p-value = 0.000054


## Comparing Age of Death in 2014 against the average college enrollment percentage from 2015-2020
x3 = avg_att['Age_of_Death_2014']
y = avg_att['College_Enrollment']

ageOfDeath2014_collegeEnrollment = scipy.stats.pearsonr(x3, y)
print(ageOfDeath2014_collegeEnrollment)
#Results R = 0.20337 | p-value = 0.41827


## Comparing Age of Death in 2019 against the average college enrollment percentage from 2015-2020
x4 = avg_att['Age_of_Death_2019']
y = avg_att['College_Enrollment']

ageOfDeath2019_collegeEnrollment = scipy.stats.pearsonr(x4, y)
print(ageOfDeath2019_collegeEnrollment)
#Results R = 0.66838 | p-value = 0.00242


## Comparing Household Income against the average college enrollment percentage from 2015-2020
x5 = avg_att['Household_Income_2019']
y = avg_att['College_Enrollment']

householdIncome_collegeEnrollment = scipy.stats.pearsonr(x5, y)
print(householdIncome_collegeEnrollment)
#Results R = 0.94296 | p-value = 4.707e-9


