%--------------------------------------------------------------------------
%                    Advanced Solid Mechanics - Project
%--------------------------------------------------------------------------

clc; clear; close all;
%-----------------------------
%       Initialization
%-----------------------------
% Definition of the folders
folders = ["Pure", "Mixed_Linear", "Mixed_Non_Linear"];

% Intermediate 
Pure = ["K_pure_200", "K_pure_250", "K_pure_300", "K_pure_350"];

Kl  = ["K_mixed_L_200", "K_mixed_L_250", "K_mixed_L_300", "K_mixed_L_350"];

Knl = ["K_mixed_NL_200" , "K_mixed_NL_250", "K_mixed_NL_300", "K_mixed_NL_350"];

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
t = Results_pure_1(1, :);

% Strain (XX)
%------------
eps_xx_p_1 = Results_pure_1(8,:);
eps_xx_p_2 = Results_pure_2(8,:);
eps_xx_p_3 = Results_pure_3(8,:);
eps_xx_p_4 = Results_pure_4(8,:);

eps_xx_kl_1 = Results_kl_1(8,:);
eps_xx_kl_2 = Results_kl_2(8,:);
eps_xx_kl_3 = Results_kl_3(8,:);
eps_xx_kl_4 = Results_kl_4(8,:);

eps_xx_knl_1 = Results_knl_1(8,:);
eps_xx_knl_2 = Results_knl_2(8,:);
eps_xx_knl_3 = Results_knl_3(8,:);
eps_xx_knl_4 = Results_knl_4(8,:);

% Strain (effective)
%-------------------
eps_eff_p_1 = Results_pure_1(7,:);
eps_eff_p_2 = Results_pure_2(7,:);
eps_eff_p_3 = Results_pure_3(7,:);
eps_eff_p_4 = Results_pure_4(7,:);

eps_eff_kl_1 = Results_kl_1(7,:);
eps_eff_kl_2 = Results_kl_2(7,:);
eps_eff_kl_3 = Results_kl_3(7,:);
eps_eff_kl_4 = Results_kl_4(7,:);

eps_eff_knl_1 = Results_knl_1(7,:);
eps_eff_knl_2 = Results_knl_2(7,:);
eps_eff_knl_3 = Results_knl_3(7,:);
eps_eff_knl_4 = Results_knl_4(7,:);

% Backstress (XX)
%----------------
bck_XX_p_1 = Results_pure_1(11,:);
bck_XX_p_2 = Results_pure_2(11,:);
bck_XX_p_3 = Results_pure_3(11,:);
bck_XX_p_4 = Results_pure_4(11,:);

bck_XX_kl_1 = Results_kl_1(11,:);
bck_XX_kl_2 = Results_kl_2(11,:);
bck_XX_kl_3 = Results_kl_3(11,:);
bck_XX_kl_4 = Results_kl_4(11,:);

bck_XX_knl_1 = Results_knl_1(11,:);
bck_XX_knl_2 = Results_knl_2(11,:);
bck_XX_knl_3 = Results_knl_3(11,:);
bck_XX_knl_4 = Results_knl_4(11,:);

%-----------------------------
%          Graphical
%-----------------------------
% ...

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

