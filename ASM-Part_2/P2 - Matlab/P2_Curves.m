%-----------------------------------
% Advanced Solid Mechanics - Project
%-----------------------------------

%---------------------
% Choosing the results
%---------------------
% Define the main folder
mf_index = 1;

% Define the file
f_index = 3;

%------------------
% Folder Definition
%------------------
% 1 - Main folders
mf = ["pure_kinematic", "mixed_linear", "mixed_nonlinear"];

% 2 - Intermediate results
pk = ["CST_eta_0", "CST_eta_10", "CST_eta_100"];

ml = [];

mln = [];

%--------------------
% Loading the results
%--------------------
% Main folder path
main_path = './' + mf(mf_index);

% Results path
result_path = '/';

if mf_index == 1 % Pure kinematic
    result_path = result_path + pk(f_index);
end

if mf_index == 2 % mixed_linear
    result_path = result_path + pk(f_index);
end

if mf_index == 3 % mixed_nonlinear
    result_path = result_path + pk(f_index);
end

% Total path
tot_path = main_path + result_path;

% Load metafor data
results=importResults(tot_path);

%--------------------
%     Graphics
%--------------------
% % 1:Time
% % 
% % 2:SigmaXX
% % 3:SigmaYY
% % 4:SigmaZZ
% % 5:SigmaVM
% % 6:SigmaYield
% % 
% % 7:EPL
% % 8:EXX
% % 9:EYY
% % 10:EZZ
% % 
% % 11:AXX
% % 12:AYY
% % 13:AZZ

%% Strain
figure
plot(results(:,1),results(:,8),'LineWidth',2.0)
hold on 
plot(results(:,1),results(:,9),'LineWidth',2.0)
plot(results(:,1),results(:,10),'LineWidth',2.0)
plot(results(:,1),results(:,7),'LineWidth',2.0)
grid on
xlabel('time','Fontsize',24)
ylabel('Strain [%]','Fontsize',24)
h=legend('$\epsilon_x$','$\epsilon_y$','$\epsilon_z$','$\bar{\varepsilon}^{p}$');
set(h,'interpreter','Latex','FontSize',25);
set(gca,'fontsize',25)

%% Stress
figure
plot(results(:,1),results(:,2),'LineWidth',2.0)
hold on 
plot(results(:,1),results(:,3),'LineWidth',2.0)
plot(results(:,1),results(:,4),'LineWidth',2.0)
plot(results(:,1),results(:,5),'LineWidth',2.0)
plot(results(:,1),results(:,6),'LineWidth',2.0)
grid on
xlabel('time','Fontsize',24)
ylabel('Stress [Mpa]','Fontsize',24)
h=legend('$\sigma_x$','$\sigma_y$','$\sigma_z$','$\sigma_{vm}$','$\sigma_{Yield}$');
set(h,'interpreter','Latex','FontSize',25)
set(gca,'fontsize',25)

%% Backstress
figure
plot(results(:,1),results(:,11),'LineWidth',2.0)
hold on 
plot(results(:,1),results(:,12),'LineWidth',2.0)
plot(results(:,1),results(:,13),'LineWidth',2.0)
grid on
xlabel('time','Fontsize',24)
ylabel('Backstress [Mpa]','Fontsize',24)
h=legend('$\alpha_x$','$\alpha_y$','$\alpha_z$');
set(h,'interpreter','Latex','FontSize',25)
set(gca,'fontsize',25)



