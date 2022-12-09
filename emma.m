%% plot single trace

figure;
ax = gca;
mouse = 8;
day = 3;
cell = 1;
trace = all_fluorescence{mouse,day}(cell,:);

% Create x-axis (time in seconds)
x_axis_end = 0.2 * (length(trace)-1);
x_axis = 0:0.2:x_axis_end;

% Plot freezing epochs
rectangle_x = x_axis(all_freezing_epochs{mouse,day});
rectangle_y = min(trace);
width = 0.2;
height = max(trace);

hold on
for i = 1:length(rectangle_x)
    
    r = rectangle('Position', [rectangle_x(i), rectangle_y, width, height], ...
        'FaceColor', '#d4dcf2', 'EdgeColor', '#d4dcf2');
    
end

% Plot fluorescence trace

plot(x_axis, trace, 'Color', 'k', 'Linewidth', 2);
plot_title = sprintf('Mouse %d on Day %d', mouse, day);
title(plot_title)

hold off





 