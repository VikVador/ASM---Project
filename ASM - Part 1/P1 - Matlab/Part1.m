load EPL.ascii
load Sigma_XX.ascii
load time.ascii



%--------------------------
%Maximum sufrace traction
%--------------------------
max(EPL)
EPL = 0.004; 
EPL = [ 0.0033 0.0037 0.0038 0.0039 0.0039 0.0040 0.004 0.0040 0.0041]; %[-]
tract = [ 300 310 315 316 318 319 320 321 322 ]; %[N]
 
figure 
plot(tract, EPL*100, 'o-')
xlabel("Surface traction [N]")
ylabel("EVP  [%]")
grid 

% S_max = 321 [N]


%--------------------------
%Plain strain 
%--------------------------