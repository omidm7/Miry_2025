%%% Plot average coefficient for all 10 mice across days. %%%

shocked_mice = [1, 2, 3, 4, 9, 10];
control_mice = [5, 6, 7, 8];
num_mice = 10;
num_days = 6;
all_session_averages = [];
day_averages = zeros(1, day);
plot_type = 1; % 1 = normal; 0 = 'onset'


% Create matrix of session averages of coeffs%

for day = 1:num_days
    for mouse = 1: num_mice
        if plot_type
            all_session_averages(mouse, day) = mean(all_regression_coeffs_rolling{mouse,day});
        elseif ~plot_type
            all_session_averages(mouse, day) = mean(all_regression_coeffs_onset_rolling{mouse,day});
        end
    end
    day_averages(day) = mean(all_session_averages(:, day));
end

% Plot individual averages and population averages %

figure;
ax = gca;
hold on

color = [0, 0, 0];

for mouse = 1:num_mice
    if ismember(mouse, shocked_mice)
        plot(all_session_averages(mouse, :), '-o', 'MarkerSize', 7, 'Color', 'red')
    elseif ismember(mouse, control_mice)
        plot(all_session_averages(mouse, :), '-o', 'MarkerSize', 5, 'Color', 'blue')
    end
end

p1 = plot(day_averages, '-ko','LineWidth', 2, 'MarkerSize', 10, 'MarkerFaceColor', 'k');

p2 = plot(mean(all_session_averages(shocked_mice, :)), 'red', 'LineWidth', 2, ...
    'MarkerSize', 10, 'MarkerFaceColor', 'red');

p3 = plot(mean(all_session_averages(control_mice, :)), 'b', 'LineWidth', 2, ...
    'MarkerSize', 10, 'MarkerFaceColor', 'b');
legend([p1, p2, p3], 'Average', 'Shocked', 'Control')

% Plot Labels %
if plot_type
    title('Mean Regression Coeff Through Days (Rolling)')
    ylabel('Regression Coefficient (Rolling)')
elseif ~plot_type
    title('Mean Regression Coeff Through Days (Onset Rolling)')
    ylabel('Regression Coefficient (Onset Rolling)')
end

xlabel('Days')





