load EPL.ascii
load Sigma_XX.ascii
load SigmaVM.ascii
load Sigma_Yield.ascii
load time.ascii



%--------------------------
%Equivalent plastic strain
%--------------------------

figure
plot(time,EPL)
xlabel("time [s]")
ylabel("EPL [-]")
set(gca,'FontSize',20)




%--------------------------
% Sigma von-mises
%--------------------------

figure
plot(time,SigmaVM)
xlabel("time [s]")
ylabel("\sigma_{VM} [MPa]")
set(gca,'FontSize',20)





%--------------------------
% Yield stress
%--------------------------

figure
plot(time,Sigma_Yield)
xlabel("time [s]")
ylabel("Yield stress [MPa]")
set(gca,'FontSize',20)






