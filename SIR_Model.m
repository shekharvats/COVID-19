function [res] = SIR_Model(a,b)
close all;
%%%%%%%%%%%%%%%%%%%%%% Governing Equations %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function to calculate spread rate based on SIR model
% https://services.math.duke.edu/education/ccp/materials/diffcalc/sir/sir2.html
% S' = -aSI
% I' = asI - bI 
% R' = bI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Intialization of variables
%a = 1; % Days before next infection (Days)
%b = 1; % Incubation period (Days)

S0 = 1;% Initial population size (-)
I0 = 1.27e-06;% Initial infected population (-)
R0 = 0;% Initial recovered population (summation of recovered and dead)
           % Assuming dead bodies cannot infect the population (-)
t_start = 0; % Start time (Days)
t_final = 149;% End time   (Days)
%% Main solver
f=@(t,x) [ -a*x(1)*x(2);a*x(1)*x(2) - b*x(2);b*x(2)]; % Objective function

[t,xa] = ode45(f,[t_start,t_final],[S0 I0 R0]); % Solver

%% Post Processing 
plot_flag = 0;
tot_pop = 300*1e6;
if(plot_flag == 1)
figure;
plot(t,xa(:,1).*tot_pop,'LineWidth',2);
hold on;
grid on;
plot(t,xa(:,2).*tot_pop,'LineWidth',2);
plot(t,xa(:,3).*tot_pop,'LineWidth',2);
legend('Suseptable population','Infected','Recovered','Location','best');
else
end
res = [t,xa];
end