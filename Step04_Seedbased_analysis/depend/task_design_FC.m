function task_design_FC(subjfile, GLOBAL)
% GLOBAL : 0 when only the roi timeseries is used as a regressor
% GLOBAL : 0 when only the roi timeseries, global timeseries and
%            movement covariates are all used as a regressor

sess_name = 'ROI_FC';
if(GLOBAL == 0)
    %   reg_file  = [roi_ts(subjcnt,:)]; %filename containing regressors
    reg_names = {'ROI_ts'}; % regressor names, ordered according regressor file
    % structure
    reg_vec   = [1];
else
    
%     reg_names = {'ROI_ts' 'wm_ts' 'csf_ts' 'movement_x' 'movement_y' ...
%         'movement_z' 'pitch' 'roll' 'yaw'};
%     reg_vec = [1 0 0 0 0 0 0 0 0];
      
    reg_names = {'ROI_ts' 'wm_ts' 'csf_ts' ...
        'movement_1'   'movement_2'   'movement_3'   'movement_4'   'movement_5'   'movement_6'...
        'movement_7'   'movement_8'   'movement_9'   'movement_10'   'movement_11'   'movement_12'...
        'movement_13'   'movement_14'   'movement_15'   'movement_16'   'movement_17'   'movement_18' ...
        'movement_19'   'movement_20'   'movement_21'   'movement_22'   'movement_23'   'movement_24'};
    reg_vec = [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ];
    
    %   reg_names = {'ROI_ts' 'movement_x' 'movement_y' ...
    %     'movement_z' 'pitch' 'roll' 'yaw'};
    %   reg_vec = [1 0 0 0 0 0 0];
    %
    
end

reg_file{1} = subjfile;
save task_design.mat sess_name reg_file reg_names reg_vec

