%--------------------------------------------------------------------------
%                    Advanced Solid Mechanics - Project
%--------------------------------------------------------------------------
%%
clc; clear; close all;
%-----------------------------
%       Initialization
%-----------------------------
% Definition of the folders
folders = ["Pure", "Mixed_Linear", "Mixed_Non_Linear"];

% Intermediate 
Pure = ["K_pure_eta_10", "K_pure_eta_100", "K_pure_eta_200", "K_pure_eta_250"];

Kl  = ["K_mixed_L_eta_10", "K_mixed_L_eta_100", "K_mixed_L_eta_200", "K_mixed_L_eta_250"];

Knl = ["K_mixed_NL_eta_10" , "K_mixed_NL_eta_100", "K_mixed_NL_eta_200", "K_mixed_NL_eta_250"];

%-----------------------------
%     Loading the results
%-----------------------------
% Purely Kinematic
%-----------------
Results_pure_1 = importResults("./" + folders(1) + "/" + Pure(1));
Results_pure_2 = importResults("./" + folders(1) + "/" + Pure(2));
Results_pure_3 = importResults("./" + folders(1) + "/" + Pure(3));
Results_pure_4 = importResults("./" + folders(1) + "/" + Pure(4));

% Kinematic Linear
%-----------------
Results_kl_1 = importResults("./" + folders(2) + "/" + Kl(1));
Results_kl_2 = importResults("./" + folders(2) + "/" + Kl(2));
Results_kl_3 = importResults("./" + folders(2) + "/" + Kl(3));
Results_kl_4 = importResults("./" + folders(2) + "/" + Kl(4));

% Kinematic Non-Linear
%---------------------
Results_knl_1 = importResults("./" + folders(3) + "/" + Knl(1));
Results_knl_2 = importResults("./" + folders(3) + "/" + Knl(2));
Results_knl_3 = importResults("./" + folders(3) + "/" + Knl(3));
Results_knl_4 = importResults("./" + folders(3) + "/" + Knl(4));

% Time representation
%--------------------
t_pure_1 = Results_pure_1(:,1);
t_pure_2 = Results_pure_2(:,1);
t_pure_3 = Results_pure_3(:,1);
t_pure_4 = Results_pure_4(:,1);

t_kl_1 = Results_kl_1(:,1);
t_kl_2 = Results_kl_2(:,1);
t_kl_3 = Results_kl_3(:,1);
t_kl_4 = Results_kl_4(:,1);

t_knl_1 = Results_knl_1(:,1);
t_knl_2 = Results_knl_2(:,1);
t_knl_3 = Results_knl_3(:,1);
t_knl_4 = Results_knl_4(:,1);


% Strain (XX)
%------------
eps_xx_p_1 = Results_pure_1(:,8);
eps_xx_p_2 = Results_pure_2(:,8);
eps_xx_p_3 = Results_pure_3(:,8);
eps_xx_p_4 = Results_pure_4(:,8);

eps_xx_kl_1 = Results_kl_1(:,8);
eps_xx_kl_2 = Results_kl_2(:,8);
eps_xx_kl_3 = Results_kl_3(:,8);
eps_xx_kl_4 = Results_kl_4(:,8);

eps_xx_knl_1 = Results_knl_1(:,8);
eps_xx_knl_2 = Results_knl_2(:,8);
eps_xx_knl_3 = Results_knl_3(:,8);
eps_xx_knl_4 = Results_knl_4(:,8);

% Strain (effective)
%-------------------
eps_eff_p_1 = Results_pure_1(:,7);
eps_eff_p_2 = Results_pure_2(:,7);
eps_eff_p_3 = Results_pure_3(:,7);
eps_eff_p_4 = Results_pure_4(:,7);

eps_eff_kl_1 = Results_kl_1(:,7);
eps_eff_kl_2 = Results_kl_2(:,7);
eps_eff_kl_3 = Results_kl_3(:,7);
eps_eff_kl_4 = Results_kl_4(:,7);

eps_eff_knl_1 = Results_knl_1(:,7);
eps_eff_knl_2 = Results_knl_2(:,7);
eps_eff_knl_3 = Results_knl_3(:,7);
eps_eff_knl_4 = Results_knl_4(:,7);

% Yield stress 
%-----------------------
yield_p_1 = Results_pure_1(:,6);
yield_p_2 = Results_pure_2(:,6);
yield_p_3 = Results_pure_3(:,6);
yield_p_4 = Results_pure_4(:,6);

yield_kl_1 = Results_kl_1(:,6);
yield_kl_2 = Results_kl_2(:,6);
yield_kl_3 = Results_kl_3(:,6);
yield_kl_4 = Results_kl_4(:,6);

yield_knl_1 = Results_knl_1(:,6);
yield_knl_2 = Results_knl_2(:,6);
yield_knl_3 = Results_knl_3(:,6);
yield_knl_4 = Results_knl_4(:,6);

% Backstress (XX)
%----------------
bck_XX_p_1 = Results_pure_1(:,11);
bck_XX_p_2 = Results_pure_2(:,11);
bck_XX_p_3 = Results_pure_3(:,11);
bck_XX_p_4 = Results_pure_4(:,11);

bck_XX_kl_1 = Results_kl_1(:,11);
bck_XX_kl_2 = Results_kl_2(:,11);
bck_XX_kl_3 = Results_kl_3(:,11);
bck_XX_kl_4 = Results_kl_4(:,11);

bck_XX_knl_1 = Results_knl_1(:,11);
bck_XX_knl_2 = Results_knl_2(:,11);
bck_XX_knl_3 = Results_knl_3(:,11);
bck_XX_knl_4 = Results_knl_4(:,11);

% Backstress (YY)
%----------------
bck_YY_p_1 = Results_pure_1(:,12);
bck_YY_p_2 = Results_pure_2(:,12);
bck_YY_p_3 = Results_pure_3(:,12);
bck_YY_p_4 = Results_pure_4(:,12);

bck_YY_kl_1 = Results_kl_1(:,12);
bck_YY_kl_2 = Results_kl_2(:,12);
bck_YY_kl_3 = Results_kl_3(:,12);
bck_YY_kl_4 = Results_kl_4(:,12);

bck_YY_knl_1 = Results_knl_1(:,12);
bck_YY_knl_2 = Results_knl_2(:,12);
bck_YY_knl_3 = Results_knl_3(:,12);
bck_YY_knl_4 = Results_knl_4(:,12);

% Backstress (ZZ)
%----------------
bck_ZZ_p_1 = Results_pure_1(:,13);
bck_ZZ_p_2 = Results_pure_2(:,13);
bck_ZZ_p_3 = Results_pure_3(:,13);
bck_ZZ_p_4 = Results_pure_4(:,13);

bck_ZZ_kl_1 = Results_kl_1(:,13);
bck_ZZ_kl_2 = Results_kl_2(:,13);
bck_ZZ_kl_3 = Results_kl_3(:,13);
bck_ZZ_kl_4 = Results_kl_4(:,13);

bck_ZZ_knl_1 = Results_knl_1(:,13);
bck_ZZ_knl_2 = Results_knl_2(:,13);
bck_ZZ_knl_3 = Results_knl_3(:,13);
bck_ZZ_knl_4 = Results_knl_4(:,13);

% Equivalent Backstress
%------------------------------------
eq_bck_p_1 = sqrt(3/2 * ((bck_XX_p_1).^2 + (bck_YY_p_1).^2 + (bck_ZZ_p_1).^2));
eq_bck_p_2 = sqrt(3/2 * ((bck_XX_p_2).^2 + (bck_YY_p_2).^2 + (bck_ZZ_p_2).^2));
eq_bck_p_3 = sqrt(3/2 * ((bck_XX_p_3).^2 + (bck_YY_p_3).^2 + (bck_ZZ_p_3).^2));
eq_bck_p_4 = sqrt(3/2 * ((bck_XX_p_4).^2 + (bck_YY_p_4).^2 + (bck_ZZ_p_4).^2));

eq_bck_kl_1 = sqrt(3/2 * ((bck_XX_kl_1).^2 + (bck_YY_kl_1).^2 + (bck_ZZ_kl_1).^2));
eq_bck_kl_2 = sqrt(3/2 * ((bck_XX_kl_2).^2 + (bck_YY_kl_2).^2 + (bck_ZZ_kl_2).^2));
eq_bck_kl_3 = sqrt(3/2 * ((bck_XX_kl_3).^2 + (bck_YY_kl_3).^2 + (bck_ZZ_kl_3).^2));
eq_bck_kl_4 = sqrt(3/2 * ((bck_XX_kl_4).^2 + (bck_YY_kl_4).^2 + (bck_ZZ_kl_4).^2));

eq_bck_knl_1 = sqrt(3/2 * ((bck_XX_knl_1).^2 + (bck_YY_knl_1).^2 + (bck_ZZ_knl_1).^2));
eq_bck_knl_2 = sqrt(3/2 * ((bck_XX_knl_2).^2 + (bck_YY_knl_2).^2 + (bck_ZZ_knl_2).^2));
eq_bck_knl_3 = sqrt(3/2 * ((bck_XX_knl_3).^2 + (bck_YY_knl_3).^2 + (bck_ZZ_knl_3).^2));
eq_bck_knl_4 = sqrt(3/2 * ((bck_XX_knl_4).^2 + (bck_YY_knl_4).^2 + (bck_ZZ_knl_4).^2));

% Energy dissipation
thermo_diss_p_1 = Results_pure_1(:,14);
thermo_diss_p_2 = Results_pure_2(:,14);
thermo_diss_p_3 = Results_pure_3(:,14);
thermo_diss_p_4 = Results_pure_4(:,14);

thermo_diss_kl_1 = Results_kl_1(:,14);
thermo_diss_kl_2 = Results_kl_2(:,14);
thermo_diss_kl_3 = Results_kl_3(:,14);
thermo_diss_kl_4 = Results_kl_4(:,14);

thermo_diss_knl_1 = Results_knl_1(:,14);
thermo_diss_knl_2 = Results_knl_2(:,14);
thermo_diss_knl_3 = Results_knl_3(:,14);
thermo_diss_knl_4 = Results_knl_4(:,14);

%-----------------------------
%          Graphical
%-----------------------------
%%
%-----------------
% Purely kinematic
%-----------------
% Equivalent backstress
figure;
plot(t_pure_1, eq_bck_p_1, 'LineWidth', 2);
hold on;
plot(t_pure_2, eq_bck_p_2, 'LineWidth', 2);
hold on;
plot(t_pure_3, eq_bck_p_3, 'LineWidth', 2);
hold on;
plot(t_pure_4, eq_bck_p_4, 'LineWidth', 2);
xlabel('Time [s]', 'FontSize', 24, 'interpreter', 'Latex');
ylabel('$\overline{\alpha}$ [MPa]', 'Fontsize', 24, 'interpreter', 'Latex');
h = legend('$\eta_k = 10$', '$\eta_k = 100$', '$\eta_k = 200$', '$\eta_k = 250$');
set(h,'interpreter','Latex','FontSize',25);
set(gca,'fontsize',25);
grid on;

%%
%---------------------------------
% Mixed linear isotropic kinematic
%---------------------------------
% Equivalent backstress
figure;
plot(t_kl_1, eq_bck_kl_1, 'LineWidth', 2);
hold on;
plot(t_kl_2, eq_bck_kl_2, 'LineWidth', 2);
hold on;
plot(t_kl_3, eq_bck_kl_3, 'LineWidth', 2);
hold on;
plot(t_kl_4, eq_bck_kl_4, 'LineWidth', 2);
xlabel('Time [s]', 'FontSize', 24, 'interpreter', 'Latex');
ylabel('$\overline{\alpha}$ [MPa]', 'Fontsize', 24, 'interpreter', 'Latex');
h = legend('$\eta_k = 10$', '$\eta_k = 100$', '$\eta_k = 200$', '$\eta_k = 250$');
set(h,'interpreter','Latex','FontSize',25);
set(gca,'fontsize',25);
grid on;

%%
%-------------------------------------
% Mixed Non-linear isotropic kinematic
%-------------------------------------
% Equivalent backstress
figure;
plot(t_knl_1, eq_bck_knl_1, 'LineWidth', 2);
hold on;
plot(t_knl_2, eq_bck_knl_2, 'LineWidth', 2);
hold on;
plot(t_knl_3, eq_bck_knl_3, 'LineWidth', 2);
hold on;
plot(t_knl_4, eq_bck_knl_4, 'LineWidth', 2);
xlabel('Time [s]', 'FontSize', 24, 'interpreter', 'Latex');
ylabel('$\overline{\alpha}$ [MPa]', 'Fontsize', 24, 'interpreter', 'Latex');
h = legend('$\eta_k = 10$', '$\eta_k = 100$', '$\eta_k = 200$', '$\eta_k = 250$');
set(h,'interpreter','Latex','FontSize',25);
set(gca,'fontsize',25);
grid on;



%------------------------------------------
%               Documentation
%------------------------------------------
% 1  : Time
% 2  : SigmaXX
% 3  : SigmaYY
% 4  : SigmaZZ
% 5  : SigmaVM
% 6  : SigmaYield
% 7  : EPL
% 8  : EXX
% 9  : EYY
% 10 : EZZ
% 11 : AXX
% 12 : AYY
% 13 : AZZ
% 14 : THERMODYN_EN_DIS