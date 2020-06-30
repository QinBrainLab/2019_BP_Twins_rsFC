Codes for Data Structure Preparation for Anonymization

Twins1_1database.m is for making a database in .mat format. A .txt file is needed, containing original filenames from MRI center in the column 1 and filenames that is anonymized with date and projects in the column 2.

Twins2_1dcm2nii.m is for data transform. Original dicom files can be transformed into nifti file by dcm2niix in MRICronGL. The output are .gz files. 

Twins2_2remove.m is optional tool for removing unwanted nifti files that take a lot of space.

Twins3_1convert.m is for making structures that is anonymized. The data structures are shown below.



    2012  %%Year structure
   
       |
   
        12-01-02.1TWINS  %% Time. Scan Sequence+Project name
   
          |
          
          fmri %% Modality
          
          |-------RS  %% Task Name
          
          |       |-----unormalized %% Data before preprocessing
          
          |       |-----smoothed_spm12 %% Preprocessed Data
          
          |
          
          mri  %% High resolution mri Image
          
          |-------Anatomy %% T1 Image
