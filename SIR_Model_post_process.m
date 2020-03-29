clear;
close all;
preprocessing;
res = SIR_Model(0.2598,0.1);

plot(res(:,1),res(:,2)*1e6,'LineWidth',2);
hold on
grid on
plot(res(:,1),res(:,3)*1e6,'LineWidth',2);
plot(res(:,1),res(:,4)*1e6,'LineWidth',2);
plot(US,'LineWidth',2);
