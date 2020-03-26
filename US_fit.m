function [fitresult, gof] = US_fit(time, US)
%CREATEFIT(TIME,US)
%  Create a fit based on the data from the US
%
%  Data for 'US_Fit' fit:
%      X Input : time
%      Y Output: US
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
% for the US data prediction of COVID-19
% Author: Shekhar Vats / Venkata Raju Chundru
% 03/26/2020

%% Fit: 'US_Fit'.
[xData, yData] = prepareCurveData( time, US ); % preparing data for the model

% Set up fittype and options.
ft = fittype( 'exp1' );% setting the fit type as exponential
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );% setting options for the fit
opts.Algorithm = 'Levenberg-Marquardt'; % fit method type for algorithm
opts.Display = 'Off'; % turning off display for faster processing
opts.Normalize = 'on'; %normalizing
opts.Robust = 'LAR'; 
opts.StartPoint = [14.6118315670169 5.40706646572049];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );% fitting the data based onn actual vs modeled

% Plot fit with data.
figure( 'Name', 'US_Fit' );
h = plot( fitresult, xData, yData );
legend( h, 'US vs. Time', 'US_Fit', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Time [days]', 'Interpreter', 'none', 'FontSize', 16 );
ylabel( '# of deaths in the US', 'Interpreter', 'none' , 'FontSize', 16 );
grid on; 
title ('COVID-19 Projected Deaths in the US', 'FontSize', 24 );


