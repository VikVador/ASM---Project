
%results_eta_0=importResults('./workspace/CubeSurfaceTraction'); % perfectly pla


x=load(strcat('./workspace/CubeSurfaceTraction','/time.ascii'));
y=load(strcat('./workspace/CubeSurfaceTraction','/Sigma_XX.ascii'));
plot(x,y)