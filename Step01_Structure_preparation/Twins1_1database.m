clc;clear;
filename = '/Users/xujiahua/Documents/Code/Imaging_analysis/Step1_Structure_preparation/database.txt';
delimiter = '\t';
formatSpec = '%s%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,  'ReturnOnError', false);
fclose(fileID);
database = [dataArray{1:end-1}];
save database.mat database
clearvars filename delimiter formatSpec fileID dataArray ans;