clc;
close all;
clear all;

% Semi-polar pattern
phi = 0.0:0.1:90.0;

% Radiation pattern of GS antenna (X-band)
f = 8060e6; % MHz
D = 5.4; % m
n = 0.99999; % antenna aperture efficiency (<1)
[G_1A_X Gmax Gmin] = rpattern(phi, f , D, n);

% Plot polar graph
figure(1);
dirplot(0.0:0.1:90, G_1A_X);
hold on
dirplot(0.0:-0.1:-90, G_1A_X);
xlabel('Off-axis angle [deg]');
ylabel('Gain [dB]');
STR1 = ['Semi-polar radiation pattern of GS antenna (ITU-R Annex 3 Appendix 8)'];
STR2 = ['Freq = ' num2str(f/1e6) ' MHz, D/\lambda = ' num2str(D/(3e8/f), '%8.2f') ', \eta = ' num2str(n, '%.5f') ', Gmax = ' num2str(Gmax, '%8.2f') ' dBi' ', Gmin = ' num2str(Gmin, '%8.2f') ' dBi'];
title({STR1; STR2});
legend('X-band');

% Radiation pattern of GS antenna (S-band)
f = 2040e6; % MHz
D = 3.0; % m
n = 0.99999; % antenna aperture efficiency (<1)
[G_1A_S Gmax Gmin] = rpattern(phi, f , D, n);

% Plot polar graph
figure(2);
dirplot(0.0:0.1:90, G_1A_S);
hold on
dirplot(0.0:-0.1:-90, G_1A_S);
xlabel('Off-axis angle [deg]');
ylabel('Gain [dB]');
STR1 = ['Semi-polar radiation pattern of GS antenna (ITU-R Annex 3 Appendix 8)'];
STR2 = ['Freq = ' num2str(f/1e6) ' MHz, D/\lambda = ' num2str(D/(3e8/f), '%8.2f') ', \eta = ' num2str(n, '%.5f') ', Gmax = ' num2str(Gmax, '%8.2f') ' dBi' ', Gmin = ' num2str(Gmin, '%8.2f') ' dBi'];
title({STR1; STR2});
legend('S-band');
