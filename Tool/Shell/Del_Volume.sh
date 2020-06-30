DATAROOT='/Users/xujiahua/Desktop/Zhou/数据/20s2'
cd $DATAROOT
for i in s*
do
#cp $i/fmri/recog1/unnormalized/I_all.nii.gz $i/fmri/recog1/unnormalized/I.nii.gz
fslroi $i/fmri/recog2/unnormalized/I.nii.gz  $i/fmri/recog2/unnormalized/I.nii.gz 1 205
done
