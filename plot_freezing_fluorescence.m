%% plot single trace

figure;
ax = gca;
ax.XAxis.Visible = 'off'
plot(all_fluorescence{9,5}(154:154,:), 'Color', [0.8500 0.3248 0.098], 'LineWidth', 1)
        box 'off'
        ax.XAxis.Visible = 'off'
        ax.YAxis.Visible = 'off'
        ax.YAxis.Limits = [-1 20]
        ax.YGrid = 'off'
       set(gca, 'Color', 'none')

export_fig /Users/omidd/Desktop/figs/ratio_analysis/figures/freezing/chuck5_154.png -r300 -transparent

%% plot freezing episodes

figure;
ax1 = axes('Position', [.01 0.1 .99 0.2]);
    ax = gca;
    ax.XAxis.Visible = 'off'
    area(all_freezing_continuous{9,5}(1:1,:), 'FaceColor', [0 0.4470 0.7410], 'LineStyle', 'none')
        box 'off'
        ax.XAxis.Visible = 'off'
        ax.YAxis.Visible = 'off'
        ax.YAxis.Limits = [0 0.1]
        ax.YGrid = 'off'
    set(gca, 'Color', 'none')
 export_fig /Users/omidd/Desktop/figs/ratio_analysis/figures/freezing/chuck5.png -r300 -transparent
 
 %% plot histogram
 
 figure;
ax = gca;
histogram(all_shocked_coeffs_onsets, 'Normalization', 'probability', 'Binwidth', 0.05, 'BinLimits', [-0.6,0.6])
box 'off'
set(gca, 'Color', 'none')
export_fig /Users/omidd/Desktop/figs/ratio_analysis/figures/freezing/onsetsshockhistogram.png -r300 -transparent
%%

 ax = gca;
histogram(all_nonshocked_coeffs, 'Normalization', 'probability', 'Binwidth', 0.05)

set(gca, 'Color', 'none')