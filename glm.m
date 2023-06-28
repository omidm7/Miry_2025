%% transpose contents of cell
all_peaks = cellfun(@transpose,all_peaks,'un',0);

%% convert negative z scores to zero in cell

for idx = 1:numel(all_fluorescence)
  M        = all_fluorescence{idx};
  M(M < 0) = 0;
  all_fluorescence{idx}    = M;
end

%% rolling average of 2 second intervals
lenny_freezing_rolling = {movmean(all_freezing_continuous{10,1},10), movmean(all_freezing_continuous{10,2},10),...
    movmean(all_freezing_continuous{10,3},10), movmean(all_freezing_continuous{10,4},10)...
    movmean(all_freezing_continuous{10,5},10), movmean(all_freezing_continuous{10,6},10)}

%% all freezing rolling
all_freezing_rolling = [jimmy_freezing_rolling; nelson_freezing_rolling; otis_freezing_rolling;... 
    zach_freezing_rolling; claude_freezing_rolling; gerald_freezing_rolling; arnold_freezing_rolling;
    hank_freezing_rolling; chuck_freezing_rolling; lenny_freezing_rolling]
%% for all freezing epochs

x = all_freezing_continuous{1,1}(:,1); %jimmy freezing indices session 6
y = all_fluorescence_positive{1,1}(1:4499,:); %jimmy all neurons fluorescence session 6
format long
b_jimmy1 = x\y % least squares regression for all neurons session 6

%% for freezing onset only

x = all_freezing_onset_continuous{10,1}(:,1); %jimmy freezing onset indices session 6
y = all_fluorescence{10,1}(1:4499,:); %jimmy all neurons fluorescence session 6
format long
b_lenny1_onset = x\y % least squares regression for all neurons session 6

%%
all_regression_coeffs = {b_jimmy1, b_jimmy2, b_jimmy3, b_jimmy4, b_jimmy5, b_jimmy6;...
    b_nelson1, b_nelson2, b_nelson3, b_nelson4, b_nelson5, b_nelson6;...
    b_otis1, b_otis2, b_otis3, b_otis4, b_otis5, b_otis6;...
    b_zach1, b_zach2, b_zach3, b_zach4, b_zach5, b_zach6;...
    b_claude1, b_claude2, b_claude3, b_claude4, b_claude5, b_claude6;...
    b_gerald1, b_gerald2, b_gerald3, b_gerald4, b_gerald5, b_gerald6;...
    b_arnold1, b_arnold2, b_arnold3, b_arnold4, b_arnold5, b_arnold6;...
    b_hank1, b_hank2, b_hank3, b_hank4, b_hank5, b_hank6;...
    b_chuck1, b_chuck2, b_chuck3, b_chuck4, b_chuck5, b_chuck6;...
    b_lenny1, b_lenny2, b_lenny3, b_lenny4, b_lenny5, b_lenny6}

%% all coefficients for shocked recall outside vs not shocked recall outside

all_shocked_coeffs = vertcat(all_regression_coeffs{1,6}, all_regression_coeffs{3,6}, all_regression_coeffs{4,6},...
    all_regression_coeffs{9,5}, all_regression_coeffs{10,5})
    
all_nonshocked_coeffs = vertcat(all_regression_coeffs{5,6}, all_regression_coeffs{6,6}, all_regression_coeffs{7,5},...
    all_regression_coeffs{8,5})

all_shocked_coeffs_rolling_onsets = vertcat(all_regression_coeffs_onset_rolling{1,6}, all_regression_coeffs_onset_rolling{3,6}, all_regression_coeffs_onset_rolling{4,6},...
    all_regression_coeffs_onset_rolling{9,5}, all_regression_coeffs_onset_rolling{10,5})
    
all_nonshocked_coeffs_rolling_onsets = vertcat(all_regression_coeffs_onset_rolling{5,6}, all_regression_coeffs_onset_rolling{6,6}, all_regression_coeffs_onset_rolling{7,5},...
    all_regression_coeffs_onset_rolling{8,5})

%% count how many cells have coefficents > than 95% CI
otis_5_1b_sig_coeff = ...
    sum((all_regression_coeffs_onset_rolling{3,4}(otis_5_1b_global_indices(:,4)) > 2.34)) 

%% find coefficients for specific cells
jimmy_2_1a_coeff = ...
    sum((all_regression_coeffs_onset_rolling{1,6}(jimmy_2_1a_global_indices(:,6),:)) > 1.2) 

%% find coefficients for specific cells
jimmy_2_1b_coeff = ...
    (all_regression_coeffs{1,6}(jimmy_2_1b_global_indices([1, 7:12, 14:15, 20:21,...
    23:24, 26, 30, 33, 35:36, 39, 41, 46, 49, 51, 53, 55:56, 59:60, 63:64, 66, 68],6),:))

%% find bootstrap distribution 95% confidence interval
all_ci_lenny = bootci(2000,@mean,all_regression_coeffs_onset_rolling{6,4})

%% find which neurons with regression coefficients > 95% are also in fear conditioning
recall_confident_jimmy_FC_silent_in_RO= intersect(recall_confident_jimmy,jimmy_2_2a_global_indices(:,6),'sorted')

%%

recall_confident_jimmy_FC_silent_in_RO_coeffs = all_regression_coeffs_onset_rolling{1,6}(recall_confident_jimmy_FC_silent_in_RO)


