%Load metafor data in Matlab and create plots 
%AllCurves=importAllCurves('.\workspace1\CubeSurfaceTraction1');
close 
clear 


 load time2.ascii
 load Sigma_XX2.ascii 
 load Sigma_YY2.ascii 
 load Sigma_ZZ2.ascii 
 load SigmaVM2.ascii 
 load Sigma_Yield2.ascii 
 load EPL2.ascii
 load E_XX2.ascii
  load E_YY2.ascii 
  load E_ZZ2.ascii
  load A_XX2.ascii
 load A_YY2.ascii
 load A_ZZ2.ascii
 
 AllCurves(:,1)= time2 ;    
    AllCurves(:,2)=Sigma_XX2;
    AllCurves(:,3)=Sigma_YY2;
    AllCurves(:,4)=Sigma_ZZ2;
    AllCurves(:,5)=SigmaVM2;
    AllCurves(:,6)=Sigma_Yield2;
    
    AllCurves(:,7)=EPL2;
    AllCurves(:,8)=E_XX2;
    AllCurves(:,9)=E_YY2;
    AllCurves(:,10)=E_ZZ2;

    AllCurves(:,11)=A_XX2;
    AllCurves(:,12)=A_YY2;
    AllCurves(:,13)=A_ZZ2;    
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
plot(AllCurves(:,1),AllCurves(:,8)*100,'LineWidth',2.0)
hold on 
plot(AllCurves(:,1),AllCurves(:,9)*100,'LineWidth',2.0)
plot(AllCurves(:,1),AllCurves(:,10)*100,'LineWidth',2.0)
plot(AllCurves(:,1),AllCurves(:,7)*100,'LineWidth',2.0)
grid on
xlabel('time','Fontsize',24)
ylabel('Strain [%]','Fontsize',24)
h=legend('$\epsilon_x$','$\epsilon_y$','$\epsilon_z$','$\bar{\varepsilon}^{p}$');
set(h,'interpreter','Latex','FontSize',25);
set(gca,'fontsize',25)

%% Stress
figure
plot(AllCurves(:,1),AllCurves(:,2),'LineWidth',2.0)
hold on 
plot(AllCurves(:,1),AllCurves(:,3),'LineWidth',2.0)
plot(AllCurves(:,1),AllCurves(:,4),'LineWidth',2.0)
plot(AllCurves(:,1),AllCurves(:,5),'LineWidth',2.0)
plot(AllCurves(:,1),AllCurves(:,6),'LineWidth',2.0)
grid on
xlabel('time','Fontsize',24)
ylabel('Stress [Mpa]','Fontsize',24)
h=legend('$\sigma_x$','$\sigma_y$','$\sigma_z$','$\sigma_{vm}$','$\sigma_{Yield}$');
set(h,'interpreter','Latex','FontSize',25)
set(gca,'fontsize',25)

%% Backstress
figure
plot(AllCurves(:,1),AllCurves(:,11),'LineWidth',2.0)
hold on 
plot(AllCurves(:,1),AllCurves(:,12),'LineWidth',2.0)
plot(AllCurves(:,1),AllCurves(:,13),'LineWidth',2.0)
grid on
xlabel('time','Fontsize',24)
ylabel('Backstress [Mpa]','Fontsize',24)
h=legend('$\alpha_x$','$\alpha_y$','$\alpha_z$');
set(h,'interpreter','Latex','FontSize',25)
set(gca,'fontsize',25)



