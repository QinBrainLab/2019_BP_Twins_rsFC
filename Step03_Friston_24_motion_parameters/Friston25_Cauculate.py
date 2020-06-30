# -*- coding: utf-8 -*-


import pandas as pd
import numpy as np 
import scipy.io as scio
from sklearn import preprocessing

raw_dir = '/Volumes/xujiahua17600518220/Twins_Org/Selected'

# List of your task folders (should be a list not a txt file)
task_dirs = 'RS'


# .txt file holding your subject list
subjectlist_file = raw_dir + '/test1.txt'

# specify which preliminary pipeline you have run (should be either 'swar' or 'swfar')
pipeline = 'swcar'


def ReadSubjectList(filename):
  try:
    f = open(filename, 'r')
    subjectIDs = f.read()
    f.close()
    subjectlist = subjectIDs.split()
  except:
    print('Cannot read subject list')
  return subjectlist



subjectList = ReadSubjectList(subjectlist_file)


for isubj in subjectList:
    interim_path_src = '/fmri/' + task_dirs + '/smoothed_spm8/'
    #yearid = '20' + isubj[0:2]
    tmp1_input_file = raw_dir + '/' + isubj + interim_path_src + 'rp_I.txt'

    dataframe = pd.read_csv(tmp1_input_file,sep='  ')
    motion_24_friston = dataframe 
    for col in dataframe.columns:
        temp_diff = np.roll(dataframe[col], 1, axis = 0)
        temp_diff[0] = 0
        temp_diff = pd.DataFrame(temp_diff)
        motion_24_friston[col + '_td'] = temp_diff
    
    for col in motion_24_friston.columns:
        quad = motion_24_friston[col] ** 2
        motion_24_friston[col + '_quad'] = quad
    outputfile= raw_dir + '/' + isubj + interim_path_src + 'friston24.txt'
    motion_24_friston.to_csv(outputfile, sep='\t', index=False)
        #return motion_24_friston#