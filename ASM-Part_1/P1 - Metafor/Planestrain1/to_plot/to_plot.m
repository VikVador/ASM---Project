
load EPL1.ascii
load Sigma_XX1.ascii
load Sigma_YY1.ascii
load Sigma_ZZ1.ascii
load SigmaVM1.ascii
load Sigma_Yield1.ascii
load time1.ascii
load A_XX1.ascii
load A_YY1.ascii
load A_ZZ1.ascii


load EPL2.ascii
load Sigma_XX2.ascii
load Sigma_YY2.ascii
load Sigma_ZZ2.ascii
load SigmaVM2.ascii
load Sigma_Yield2.ascii
load time2.ascii
load A_XX2.ascii
load A_YY2.ascii
load A_ZZ2.ascii


load EPL3.ascii
load Sigma_XX3.ascii
load Sigma_YY3.ascii
load Sigma_ZZ3.ascii
load SigmaVM3.ascii
load Sigma_Yield3.ascii
load time3.ascii
load A_XX3.ascii
load A_YY3.ascii
load A_ZZ3.ascii


load EPL4.ascii
load Sigma_XX4.ascii
load Sigma_YY4.ascii
load Sigma_ZZ4.ascii
load SigmaVM4.ascii
load Sigma_Yield4.ascii
load time4.ascii
load A_XX4.ascii
load A_YY4.ascii
load A_ZZ4.ascii


%-------------------------------
% Plot of the Yield_stress
%-------------------------------


figure
plot(time1,Sigma_Yield1)
hold on 
plot(time2,Sigma_Yield2)
hold on 
plot(time3,Sigma_Yield3)
hold on 
plot(time4,Sigma_Yield4)
xlabel("time [s]")
h = ylabel("'$\sigma_{Yield}$' [MPa]")
legend('Perfectly plastic','Linear Hardening','Kinematic hardening','Mixed hardening');
set(h,'interpreter','Latex','FontSize',25)
set(gca,'FontSize',25)
grid

%-------------------------------
% Plot of the sigma_xx
%-------------------------------


figure
plot(time1,Sigma_XX1)
hold on 
plot(time2,Sigma_XX2)
hold on 
plot(time3,Sigma_XX3)
hold on 
plot(time4,Sigma_XX4)
xlabel("time [s]")
h = ylabel("$\sigma_x$ [MPa]");
set(h,'interpreter','Latex','FontSize',25)
legend('Perfectly plastic','Linear Hardening','Kinematic hardening','Mixed hardening')
set(gca,'fontsize',25)
grid





%-------------------------------
% Plot of the EPL
%-------------------------------


figure
plot(time1,EPL1)
hold on 
plot(time2,EPL2)
hold on 
plot(time3,EPL3)
hold on 
plot(time4,EPL4)
xlabel("time [s]")
h = ylabel("$\bar{\varepsilon}^{p}$ [-]");
set(h,'interpreter','Latex','FontSize',25)
legend('Perfectly plastic','Linear Hardening','Kinematic hardening','Mixed hardening')
set(gca,'fontsize',25)
grid






%-------------------------------
% Plot of the Backstress
%-------------------------------


figure
plot(time1,A_XX1)
hold on 
plot(time2,A_XX2)
hold on 
plot(time3,A_XX3)
hold on 
plot(time4,A_XX4)
xlabel("time [s]")
h = ylabel("$\alpha_x$ [MPa]");
set(h,'interpreter','Latex','FontSize',25)
legend('Perfectly plastic','Linear Hardening','Kinematic hardening','Mixed hardening')
set(gca,'fontsize',25)
grid



