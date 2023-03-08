%% for all freezing epochs

x = all_max_amp_during_session_4(:,1); % predictor (max amplitude during session 4)
y = all_max_amp_during_session_4(:,2); % experience (FC 1 or NE 0 )
format long
b = x\y % least squares regression 

% preferred, b = glmfit(x,y,distr)

%% lasso glm with nested cross validation
x = all_active_for_lasso_IEI(:,1) % predictor (max amplitude during fear conditioning)
y = all_active_for_lasso_IEI(:,2) % response (active 1 or silent 0 during recall)

[B,FitInfo] = lassoglm(x,y,'binomial','CV',10);