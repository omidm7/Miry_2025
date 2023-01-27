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