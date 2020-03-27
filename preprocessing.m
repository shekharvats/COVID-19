clear;
clc;
close all;

T=readtable('time_series_covid19_confirmed_global.csv');
T1=readtable('time_series_covid19_deaths_global.csv');

time =1:1:size(T,2);
for i=5:size(T,2)
    US(i) = cell2mat(table2cell(T(227,i)));
    italy(i) = cell2mat(table2cell(T(139,i)))
    spain(i) = cell2mat(table2cell(T(203,i)))
end

for i=5:size(T,2)
    for j = 51:83
    china_tmp(i,j) = cell2mat(table2cell(T(j,i)));
    end
end


for i=5:size(T,2)
    US_deaths(i) = cell2mat(table2cell(T(227,i)));
    italy_deaths(i) = cell2mat(table2cell(T(139,i)));
    spain_deaths(i) = cell2mat(table2cell(T(203,i)));
end

for i=5:size(T,2)
    for j = 51:83
    china_tmp_deaths(i,j) = cell2mat(table2cell(T(j,i)));
    end
end

china_total_deaths = sum(china_tmp_deaths,2);
china_total = sum(china_tmp,2);

figure
plot(US,'LineWidth',2);
hold on
plot(china_total,'LineWidth',2);
plot(italy,'LineWidth',2);
plot(spain,'LineWidth',2); 
grid on
legend('US','China','Italy','Spain','Location','best');
set(gca,'FontSize',12);
set(gca,'FontWeight','bold');
xlabel('Time (Days)');
ylabel('Number of cases (-)');
title('Covid 19 total number of confirmed cases - March 24 2020');

figure
plot(US_deaths,'LineWidth',2);
hold on
plot(china_total_deaths,'LineWidth',2);
plot(italy_deaths,'LineWidth',2);
plot(spain_deaths,'LineWidth',2); 
grid on
legend('US','China','Italy','Spain','Location','best');
set(gca,'FontSize',12);
set(gca,'FontWeight','bold');
xlabel('Time (Days)');
ylabel('Number of deaths (-)');
title('Covid 19 total number of deaths - March 24 2020');