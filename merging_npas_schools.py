
# Merging QOL data with the NPA's of each school

import pandas as pd
import numpy as np
from ast import literal_eval

schools_df = pd.read_csv('public_school_npas.csv')
#print(schools.head(5))

qol_df = pd.read_csv('QOL_NPA_Attributes.csv')
#print(qol.head(5))

# merging on npa column for qol dataset with the list of npas for each school

#merged = schools.merge(qol, left_on='npas_in_zone',right_on='NPA')

#concat_csv = pd.concat([schools,qol])


def averageOfAttributesNpas(qolCol):
    newCol = []
    for idx, schoolRow in schools_df.iterrows():
        sum = 0
        count = 0
        npas = literal_eval(schoolRow.npas_in_zone)
        
        for npa in npas:
            tmp = qol_df[qol_df.NPA == npa][qolCol].tolist()[0]
            #print(qolCol)
            #print(tmp)
            if np.isnan(tmp):
                continue
            sum += float(tmp)
        newCol.append(sum / len(npas))

    schools_df[qolCol] = newCol
    

for name in qol_df.columns:
    averageOfAttributesNpas(name)

schools_df.to_csv("average_Attributes.csv")
