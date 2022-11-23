%Load metafor data in Matlab and create plots
close all
results_eta_0=importResults('./eta_0/workspace/CubeSurfaceTraction3'); % perfectly plastic
results_eta_1e2=importResults('./eta_1e2/workspace/CubeSurfaceTraction3'); % linear hardening
results_eta_1e4=importResults('./eta_1e4/workspace/CubeSurfaceTraction3'); % kinematic hardening
results_eta_1e6=importResults('./eta_1e6/workspace/CubeSurfaceTraction3'); % Mixed hardening
results_eta_1e7=importResults('./eta_1e7/workspace/CubeSurfaceTraction3'); % Mixed hardening

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



%% Relevant variables 

%1) Equivalent back stress 
alpha_bar_eta_0 = sqrt( 3/2 * (results_eta_0(:,11).^2 + results_eta_0(:,12).^2 + results_eta_0(:,13).^2) );
alpha_bar_eta_1e2 = sqrt( 3/2 * (results_eta_1e2(:,11).^2 + results_eta_1e2(:,12).^2 + results_eta_1e2(:,13).^2) );
alpha_bar_eta_1e4 = sqrt( 3/2 * (results_eta_1e4(:,11).^2 + results_eta_1e4(:,12).^2 + results_eta_1e4(:,13).^2) );
alpha_bar_eta_1e6 = sqrt( 3/2 * (results_eta_1e6(:,11).^2 + results_eta_1e6(:,12).^2 + results_eta_1e6(:,13).^2) );
alpha_bar_eta_1e7 = sqrt( 3/2 * (results_eta_1e7(:,11).^2 + results_eta_1e7(:,12).^2 + results_eta_1e7(:,13).^2) );






%% von mises  Stress
figure
plot(results_eta_0(:,1),results_eta_0(:,5),'LineWidth',2.0)
hold on
plot(results_eta_1e2(:,1),results_eta_1e2(:,5),'LineWidth',2.0)
plot(results_eta_1e4(:,1),results_eta_1e4(:,5),'Color','[0.9290, 0.6940, 0.1250] 	 ','LineWidth',2.0)
plot(results_eta_1e6(:,1),results_eta_1e6(:,5),'Color','[0.4940, 0.1840, 0.5560] 	 ','LineWidth',2.0)
plot(results_eta_1e7(:,1),results_eta_1e7(:,5),'LineWidth',2.0)
grid on
xlabel('time [s] ','Fontsize',24)
ylabel('Von Mises equivalent stress [Mpa]','Fontsize',24)
h=legend('$\eta = 0 $ ','$\eta = 1e2 $ ','$\eta = 1e4 $ ','$\eta = 1e6 $','$\eta = 1e7 $');
set(h,'interpreter','Latex','FontSize',25)
set(gca,'fontsize',25)



%% Backstress
figure

plot(results_eta_0(:,1),alpha_bar_eta_0,'LineWidth',2.0)
hold on 
plot(results_eta_1e2(:,1),alpha_bar_eta_1e2,'LineWidth',2.0)
plot(results_eta_1e4(:,1),alpha_bar_eta_1e4,'LineWidth',2.0)
plot(results_eta_1e6(:,1),alpha_bar_eta_1e6,'Color','[0.9290, 0.6940, 0.1250] 	 ','LineWidth',2.0)
hold on
plot(results_eta_1e7(:,1),alpha_bar_eta_1e7,'Color','[0.4940, 0.1840, 0.5560] 	 ','LineWidth',2.0)
grid on
xlabel('time [s] ','Fontsize',24)
ylabel('Equivlent backstress [Mpa]','Fontsize',24)
legend('Isotropic ','Kinematic ','Mixed ');
%set(h,'interpreter','Latex','FontSize',25)
set(gca,'fontsize',25)



%% the current yield stress : 
% 

plot(results_eta_0(:,1),results_eta_0(:,6),'LineWidth',2.0)
hold on
plot(results_eta_1e2(:,1),results_eta_1e2(:,6),'LineWidth',2.0)
plot(results_eta_1e4(:,1),results_eta_1e4(:,6),'Color','[0.9290, 0.6940, 0.1250] 	 ','LineWidth',2.0)
plot(results_eta_1e6(:,1),results_eta_1e6(:,6),'Color','[0.4940, 0.1840, 0.5560] 	 ','LineWidth',2.0)
plot(results_eta_1e7(:,1),results_eta_1e7(:,6),'Color','k 	 ','LineWidth',2.0)
grid on
xlabel('time [s] ','Fontsize',24)
ylabel('Current yield stress [Mpa]','Fontsize',24)
h=legend('$\eta = 0 $ ','$\eta = 1e2 $ ','$\eta = 1e4 $ ','$\eta = 1e6 $','$\eta = 1e7 $');
set(h,'interpreter','Latex','FontSize',25)
set(gca,'fontsize',25)
%% The equivalent plastic strain ep

figure
plot(results_eta_0(:,1),results_eta_0(:,7),'LineWidth',2.0)
hold on
plot(results_eta_1e2(:,1),results_eta_1e2(:,7),'LineWidth',2.0)
plot(results_eta_1e4(:,1),results_eta_1e4(:,7),'Color','[0.9290, 0.6940, 0.1250] 	 ','LineWidth',2.0)
plot(results_eta_1e6(:,1),results_eta_1e6(:,7),'Color','[0.4940, 0.1840, 0.5560] 	 ','LineWidth',2.0)
plot(results_eta_1e7(:,1),results_eta_1e7(:,7),'LineWidth',2.0)
grid on
xlabel('time [s] ','Fontsize',24)
ylabel('The equivalent plastic strain [Mpa]','Fontsize',24)
h=legend('$\eta = 0 $ ','$\eta = 1e2 $ ','$\eta = 1e4 $ ','$\eta = 1e6 $','$\eta = 1e7 $');
set(h,'interpreter','Latex','FontSize',25)
set(gca,'fontsize',25)




