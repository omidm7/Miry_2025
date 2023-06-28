%% find feezing epochs for hump

threshold = 0.35;
% Find logical vector where velocity < threshold
binaryVector_session_6_freezing = session_6_cm_sec < 0.35
% Label each region with a label - an "ID" number.
[labeledVector_session_6_freezing, numRegions_session_6_freezing] = bwlabel(binaryVector_session_6_freezing)
% Measure lengths of each region and the indexes
measurements_session_6_freezing = regionprops(labeledVector_session_6_freezing, session_6_cm_sec, 'Area', 'PixelIdxList');
% Find regions where the area (length) are 2 or greater and
% put the values into a cell of a cell array (2 because each value here is
% 0.2 sec)
for k_session_6_freezing = 1 : numRegions_session_6_freezing
  if measurements_session_6_freezing(k_session_6_freezing).Area >= 2
    % Area (length) is 2 or greater, so store the values.
    ca_session_6_freezing{k_session_6_freezing} = measurements_session_6_freezing(k_session_6_freezing).PixelIdxList;
  end
end
% Display the regions that meet the criteria:
celldisp(ca_session_6_freezing)

% Put freezing epochs that last longer than 0.4 sec
empty_data_session_6_freezing = cellfun(@isempty,ca_session_6_freezing);
non_empty_data_session_6_freezing = ca_session_6_freezing(~empty_data_session_6_freezing);
session_6_freezing_epochs = cat(1,non_empty_data_session_6_freezing{:});

%%

total_freeze_percent_session_6 = (length(session_6_freezing_epochs)/length(binaryVector_session_6_freezing))*100

%%
lenny_session_1_freezing_onset = cellfun(@(v)v(1),non_empty_data_session_1_freezing)

%%
lenny_all_freezing_onset_indices = {lenny_session_1_freezing_onset, lenny_session_2_freezing_onset...
    lenny_session_3_freezing_onset, lenny_session_4_freezing_onset, lenny_session_5_freezing_onset, lenny_session_6_freezing_onset}

%%
lenny_freezing_onset_continuous6 = all_freezing_continuous{10,6};

lenny_freezing_onset_continuous6(setdiff(1:end,all_freezing_onset_indices{10,6})) = 0;
