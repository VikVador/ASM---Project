function [AllCurves] = importResults(resultFolder)

    AllCurves(:,1)=load(strcat(resultFolder,'/time.ascii'));  
    
    AllCurves(:,2)=load(strcat(resultFolder,'/Sigma_XX.ascii'));
    AllCurves(:,3)=load(strcat(resultFolder,'/Sigma_YY.ascii'));
    AllCurves(:,4)=load(strcat(resultFolder,'/Sigma_ZZ.ascii'));
    AllCurves(:,5)=load(strcat(resultFolder,'/SigmaVM.ascii'));
    AllCurves(:,6)=load(strcat(resultFolder,'/Sigma_Yield.ascii'));
    
    AllCurves(:,7)=load(strcat(resultFolder,'/EPL.ascii'));
    AllCurves(:,8)=load(strcat(resultFolder,'/E_XX.ascii'));
    AllCurves(:,9)=load(strcat(resultFolder,'/E_YY.ascii'));
    AllCurves(:,10)=load(strcat(resultFolder,'/E_ZZ.ascii'));

    AllCurves(:,11)=load(strcat(resultFolder,'/A_XX.ascii'));
    AllCurves(:,12)=load(strcat(resultFolder,'/A_YY.ascii'));
    AllCurves(:,13)=load(strcat(resultFolder,'/A_ZZ.ascii'));    
end
