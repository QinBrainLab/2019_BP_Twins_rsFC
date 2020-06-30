DATAROOT='/Volumes/xujiahua/Twins/preprocess/Selected/20su'
cd $DATAROOT
for i in sub*
do
gzip $DATAROOT/$i/fmri/RS/unnormalized/I.nii
#gunzip $DATAROOT/$i/mri/anatomy/I.nii.gz
#gzip $DATAROOT/$i/fmri/RS/smoothed_spm8/swcarI.nii
gzip $DATAROOT/$i/mri/anatomy/I_all.nii
done
