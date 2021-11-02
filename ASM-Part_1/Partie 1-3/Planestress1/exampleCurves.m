%Load metafor data in Matlab and create plots 
results= importResults('./material1/workspace/CubeSurfaceTraction1');
results2 = importResults('./material2/workspace/CubeSurfaceTraction');
results3 = importResults('./material3/workspace/CubeSurfaceTraction3');
results4 = importResults('./material4/workspace/CubeSurfaceTraction');

% results=importResults('/Users/dujardinnicolas/Project_ASM/ASM---Project/ASM-Part_1/P1.3/workspace/CubeSurfaceTraction_template')


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

%% EPL Strain
figure
plot(results(:,1),results(:,7),'LineWidth',2.0)
hold on 
plot(results(:,1),results2(:,7),'LineWidth',2.0)
plot(results(:,1),results3(:,7),'LineWidth',2.0)
plot(results(:,1),results4(:,7),'LineWidth',2.0)
grid on
xlabel('time','Fontsize',24)
h=ylabel('$\bar{\varepsilon}^{p}$','Fontsize',24);
legend('Perfectly plastic ','Linear isotropic hardening','Linear kinematic hardening','Linear mixed hardening')
set(h,'interpreter','Latex','FontSize',25);
set(gca,'fontsize',25)

%% Yield Stress
figure
plot(results(:,1),results(:,6),'LineWidth',2.0)
hold on 
plot(results(:,1),results2(:,6),'LineWidth',2.0)
plot(results(:,1),results3(:,6),'LineWidth',2.0)
plot(results(:,1),results4(:,6),'LineWidth',2.0)
grid on
xlabel('time','Fontsize',24)
h=ylabel('$\sigma_{Yield}$','Fontsize',24);
legend('Perfectly plastic ','Linear isotropic hardening','Linear kinematic hardening','Linear mixed hardening');
set(h,'interpreter','Latex','FontSize',25)
set(gca,'fontsize',25)

%% Backstress selon x direction
figure
plot(results(:,1),results(:,11),'LineWidth',2.0)
hold on 
plot(results(:,1),results2(:,11),'LineWidth',2.0)
plot(results(:,1),results3(:,11),'LineWidth',2.0)
plot(results(:,1),results4(:,11),'LineWidth',2.0)
grid on
xlabel('time','Fontsize',24)
h=ylabel('$\alpha_x$','Fontsize',24);
legend('Perfectly plastic ','Linear isotropic hardening','Linear kinematic hardening','Linear mixed hardening');
set(h,'interpreter','Latex','FontSize',25)
set(gca,'fontsize',25)





