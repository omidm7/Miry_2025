%% shuffle peaks
all_peaks_shuffled = cell(size(all_peaks));
for i = 1:numel(all_peaks)
    matrix = all_peaks{i};
    [num_rows, num_cols] = size(matrix);
    matrix_shuffled = zeros(num_rows, num_cols);
    for j = 1:num_rows
        ones_idx = find(matrix(j, :));
        num_ones = length(ones_idx);
        shuffled_idx = randperm(num_cols);
        matrix_shuffled(j, shuffled_idx(1:num_ones)) = 1;
    end
    all_peaks_shuffled{i} = matrix_shuffled;
end

%% cross correlation for all neurons (first 2.5 min)
% Extract the matrix at position [1,4]
mouse = 1
day = 4
session = all_peaks{mouse,day};

% Preallocate the output matrix
corr_matrix = zeros(size(session, 1), size(session, 1));

% Compute the cross-correlation for every pair of rows
for i = 1:size(session, 1)
    for j = i:size(session, 1)
        % Compute the cross-correlation between rows i and j
        % Normalizes the sequence so that the autocorrelations at zero lag equal 1:
        % lag = 15 intervals (3 sec)
        corr_val = mean(xcorr(session(i,1:740), session(j,1:740),10,'normalized'));
        
        % Store the result in the output matrix
        corr_matrix(i,j) = corr_val;
        corr_matrix(j,i) = corr_val;
    end
end
