%% plot fluorescence of Jimmy's 10th neuron during recall 1
% figure = plot(Cell{row,column}(row,column))

figure1 = plot(all_fluorescence_for_plotting{1,5}(10,:))

%% find max amplitude for Jimmy's 5th neuron during Fear Conditioning

% A = max(Cell{row,column}(row,column)
jimmy_max = max(all_fluorescence{1, 4}(5,:))

%% find total number of peaks for Jimmy's 20th neuron during Exploration 1
% A = sum(Cell{row,column}(row,column)

total_peaks = sum(all_peaks{1,1}(20,:))

%% find total number of peaks for all of Jimmy's neurons during Exploration 3

jimmy_total_peaks = (sum(all_peaks{1,3},2))


%% Find the maximum amplitude of fluorescence for every cell for every animal during fear conditioning

all_max = {max(all_fluorescence_for_plotting{1, 4}, [], 2); max(all_fluorescence_for_plotting{2, 4}, [], 2); max(all_fluorescence_for_plotting{3, 4}, [], 2);...
    max(all_fluorescence_for_plotting{4, 4}, [], 2); max(all_fluorescence_for_plotting{5, 4}, [], 2); max(all_fluorescence_for_plotting{6, 4}, [], 2); max(all_fluorescence_for_plotting{7, 4}, [], 2); max(all_fluorescence_for_plotting{8, 4}, [], 2);...
    max(all_fluorescence_for_plotting{9, 4}, [], 2); max(all_fluorescence_for_plotting{10, 4}, [], 2);}

%% Find the maximum amplitude of fluorescence only for Group 3_1 neurons for every animal during fear conditioning

all_3_1_max = {all_max{1,1}((jimmy_3_1_global_indices(:,4)));...
    all_max{2,1}((nelson_3_1_global_indices(:,4)));...
    all_max{3,1}((otis_3_1_global_indices(:,4)));...
    all_max{4,1}((zach_3_1_global_indices(:,4)));...
    all_max{5,1}((claude_3_1_global_indices(:,4)));...
    all_max{6,1}((gerald_3_1_global_indices(:,4)));...
    all_max{7,1}((arnold_3_1_global_indices(:,4)));...
    all_max{8,1}((hank_3_1_global_indices(:,4)));...
    all_max{9,1}((chuck_3_1_global_indices(:,4)));...
    all_max{10,1}((lenny_3_1_global_indices(:,4)))}

%% Find the maximum amplitude of fluorescence only for Group 3_1 neurons for every animal *during the pre-shock period* of fear conditioning

all_max_preshock = {max(all_fluorescence{1, 4}(:,1:740), [], 2);...
    max(all_fluorescence{2, 4}(:,1:740), [], 2);...
    max(all_fluorescence{3, 4}(:,1:740), [], 2);...
    max(all_fluorescence{4, 4}(:,1:740), [], 2);...
    max(all_fluorescence{5, 4}(:,1:740), [], 2);...
    max(all_fluorescence{6, 4}(:,1:740), [], 2);...
    max(all_fluorescence{7, 4}(:,1:740), [], 2);...
    max(all_fluorescence{8, 4}(:,1:740), [], 2);...
    max(all_fluorescence{9, 4}(:,1:740), [], 2);...
    max(all_fluorescence{10, 4}(:,1:740), [], 2)}

%% Find frequency (events/min) for Group 3_1 neurons for every shocked animal (not controls)

all_3_1_during_FC_epm = ...
    {(sum(jimmy_3_1_all_peaks{1,4},2))/6.5
    (sum(nelson_3_1_all_peaks{1,4},2))/6.5
    (sum(otis_3_1_all_peaks{1,4},2))/6.5
    (sum(zach_3_1_all_peaks{1,4},2))/6.5
    (sum(chuck_3_1_all_peaks{1,4},2))/6.5
    (sum(lenny_3_1_all_peaks{1,4},2))/6.5}

% pre-shock
all_3_1_during_FC_preshock_epm = ...
    {(sum(jimmy_3_1_all_peaks{1,4}(:,1:740),2)/2.46)
    (sum(nelson_3_1_all_peaks{1,4}(:,1:740),2)/2.46)
    (sum(otis_3_1_all_peaks{1,4}(:,1:740),2)/2.46)
    (sum(zach_3_1_all_peaks{1,4}(:,1:740),2)/2.46)
    (sum(chuck_3_1_all_peaks{1,4}(:,1:740),2)/2.46)
    (sum(lenny_3_1_all_peaks{1,4}(:,1:740),2)/2.46)}

% inter-shock
all_3_1_during_FC_intershock_epm = ...
    {(sum(jimmy_3_1_all_peaks{1,4}(:,741:1649),2)/3.03)
    (sum(nelson_3_1_all_peaks{1,4}(:,741:1649),2)/3.03)
    (sum(otis_3_1_all_peaks{1,4}(:,741:1649),2)/3.03)
    (sum(zach_3_1_all_peaks{1,4}(:,741:1649),2)/3.03)
    (sum(chuck_3_1_all_peaks{1,4}(:,741:1649),2)/3.03)
    (sum(lenny_3_1_all_peaks{1,4}(:,741:1649),2)/3.03)}

% post-shock
all_3_1_during_FC_postshock_epm = ...
    {(sum(jimmy_3_1_all_peaks{1,4}(:,1650:1949),2)/1)
    (sum(nelson_3_1_all_peaks{1,4}(:,1650:1949),2)/1)
    (sum(otis_3_1_all_peaks{1,4}(:,1650:1949),2)/1)
    (sum(zach_3_1_all_peaks{1,4}(:,1650:1949),2)/1)
    (sum(chuck_3_1_all_peaks{1,4}(:,1650:1949),2)/1)
    (sum(lenny_3_1_all_peaks{1,4}(:,1650:1949),2)/1)}


%%
jimmy_all_active_during_FC = all_fluorescence{1,4}(jimmy_5_1a_global_indices(:,4),:)

%%
% find peaks only for Chuck, Day 3, first 5 minutes of exploration
% x = Cell{row,column}(row,column)
% x = Cell{mouse,day}(neurons,duration)
chuck_all_peaks_session3_5min = all_peaks{9,3}(:,1:1500)

%%
% find peaks only for Chuck, Day 3, *engram neurons*, first 5 minutes of exploration
% x = Cell{row,column}(row,column)
% x = Cell{mouse,day}(neurons,duration)
% x = Cell{mouse,day}(index_list(neurons,day),duration)
chuck_engram_peaks_session3_5min = all_peaks{9,3}(chuck_5_1a_global_indices(:,3),:)

