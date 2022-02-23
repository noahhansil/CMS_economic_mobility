# -*- coding: utf-8 -*-
"""
Created on Sat Feb 12 20:46:30 2022

@author: Noah
@info: This file is being created to do statistical analysis and produce visualizations for 
Charlotte-Mecklenburg Schools (CMS) High School data
"""

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Reading of CMS Student Data
school = pd.read_csv('CMS_student_data.csv')
school

# Renaming the columns
school = school.rename(columns={'School':'school','Year':'year','Student Population':'student_pop','Graduation Rate(%)':'grad_rate',
                                        'Avg SAT Score':'avg_sat',
                                        'AP/IB Enrollment (%)':'ap_ib_enrollment','Career & College Promise Enrollment':'ccp_enrollment',
                                        'Total Teachers':'num_teachers','Avg Daily Attendance (%)':'avg_attendance',
                                        'College Enrollment (%)':'col_enrollment_perc','School Performance Score':'spf',
                                        'Students Per Teacher':'students_per_teacher'})

# Filtering the dataframe by year
school_2016 = school[school.year == 2016]
school_2017 = school[school.year == 2017]
school_2018 = school[school.year == 2018]
school_2019 = school[school.year == 2019]
school_2020 = school[school.year == 2020]

# student population sum of each year 
ser2016 = school_2016.loc[:,'student_pop']
ser2017 = school_2017.loc[:,'student_pop']
ser2018 = school_2018.loc[:,'student_pop']
ser2019 = school_2019.loc[:,'student_pop']

# Loop to create total of student pop per year
pop2016 = ser2016.sum()
pop2017 = ser2017.sum()
pop2018 = ser2018.sum()
pop2019 = ser2019.sum()
pop2020 = ser2020.sum()

student_pops = [pop2016, pop2017, pop2018, pop2019, pop2020]

# histogram showing year and student population
school.hist(column=school['student_pop'], by=school['year'], bins=5)

sns.scatterplot(x="year", y="student_pop", data=)
        


