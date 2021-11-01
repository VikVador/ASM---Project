# -*- coding: latin-1; -*-
# $Id$
#################################################
#   Source file for the ASM project             #
#                                               #
#################################################.

from wrap import *                        

metafor = Metafor()
domain = metafor.getDomain()

def getMetafor(p={}): 
    return metafor
    
###########################################
# BEGIN OF DEFINITION OF THE PARAMETERS   #
###########################################

#Remark: The units must be consistent!
#Here, lengths in [mm] ; E in [MPa] and Mass in [Tons]

#GEOMETRY:
p= {} 
p['GeometryHypothesis'] = "PLANESTRAIN" #PLANESTRESS or "PLANESTRAIN" ; you need to implement PLANESTRAIN yourself! 
p['EdgeSize'] = 50                     #Length of the cube
#MESH:    
p['Nx'] = 1                             #Nb of elements in the x direction
p['Ny'] = 1                             #Nb of elements in the y direction
p['Nz'] = 1                             #Nb of elements in the z direction
#TIME:
p['dT'] = 0.1                           #Maximum time step                     

###########################################
# END OF DEFINITION OF THE PARAMETERS     #
###########################################

#2.0 GEOMETRY
#===========
geometry = domain.getGeometry() 
geometry.setDim3D()  

#2.1 Points
#----------
pointset = geometry.getPointSet()                               

pointset.define(1,0.,0.,0.)                                     
pointset.define(2,p['EdgeSize'],0.,0.)
pointset.define(3,p['EdgeSize'],p['EdgeSize'],0.)
pointset.define(4,0.,p['EdgeSize'],0.)
pointset.define(5,0.,0.,p['EdgeSize'])
pointset.define(6,p['EdgeSize'],0.,p['EdgeSize'])
pointset.define(7,p['EdgeSize'],p['EdgeSize'],p['EdgeSize'])
pointset.define(8,0.,p['EdgeSize'],p['EdgeSize'])

#2.2 Curves
#-----------
curveset = geometry.getCurveSet()                            

curveset.add( Line( 1, pointset( 1), pointset(2) ))          
curveset.add( Line( 2, pointset( 2), pointset(3) ))          
curveset.add( Line( 3, pointset( 3), pointset(4) ))          
curveset.add( Line( 4, pointset( 4), pointset(1) ))          
curveset.add( Line( 5, pointset( 1), pointset(5) ))          
curveset.add( Line( 6, pointset( 2), pointset(6) ))          
curveset.add( Line( 7, pointset( 3), pointset(7) ))          
curveset.add( Line( 8, pointset( 4), pointset(8) ))          
curveset.add( Line( 9, pointset( 5), pointset(6) ))          
curveset.add( Line( 10, pointset( 6), pointset(7) ))         
curveset.add( Line( 11, pointset( 7), pointset(8) ))          
curveset.add( Line( 12, pointset( 8), pointset(5) ))          

#2.3 Wires
#------------
wireset = geometry.getWireSet()                              

wireset.add( Wire(1, [curveset(1), curveset(2), curveset(3), curveset(4)]) ) 
wireset.add( Wire(2, [curveset(9), curveset(10), curveset(11), curveset(12)]) ) 
wireset.add( Wire(3, [curveset(1), curveset(6), curveset(9), curveset(5)]) ) 
wireset.add( Wire(4, [curveset(2), curveset(7), curveset(10), curveset(6)]) ) 
wireset.add( Wire(5, [curveset(3), curveset(7), curveset(11), curveset(8)]) ) 
wireset.add( Wire(6, [curveset(4), curveset(8), curveset(12), curveset(5)]) ) 

#2.4 Sides
#-------------------
sideset = geometry.getSideSet()                              

sideset.add( Side(1,[wireset(1)]) )                          
sideset.add( Side(2,[wireset(2)]) )                          
sideset.add( Side(3,[wireset(3)]) )                          
sideset.add( Side(4,[wireset(4)]) )                          
sideset.add( Side(5,[wireset(5)]) )                          
sideset.add( Side(6,[wireset(6)]) )                          

#2.5 Skins
#-------------------
skinset = geometry.getSkinSet()

skinset.add( Skin(1,[sideset(1),sideset(2),sideset(3),sideset(4),sideset(5),sideset(6)]))                         

#2.6 Volume
#-------------------
volumeset = geometry.getVolumeSet()

volumeset.add(Volume(1,[skinset(1)]))                        

#3. MESH
#===========

#3.1 Meshing the lines:
#-------------------
for i in [1, 3, 9, 11]:
    SimpleMesher1D(curveset(i)).execute(p['Nx'])                    
for i in [2, 4, 10, 12]:
    SimpleMesher1D(curveset(i)).execute(p['Ny'])                 
for i in [5, 6, 7, 8]:
    SimpleMesher1D(curveset(i)).execute(p['Nz'])                    

#3.2 Meshing the Sides:
#-------------------
for i in range(1,7):
    TransfiniteMesher2D(sideset(i)).execute(True, 0)

#3.3 Meshing the Volume:
#-------------------
TransfiniteMesher3D(volumeset(1)).execute(True)
   
#4.0 MATERIALS
#===========

############################################################
# BEGIN OF DEFINITION OF THE MATERIALS AND MATERIAL LAWS   #
############################################################
#MATERIAL:   
Density = 7.85E-9                 #Density
Young = 20.5E4                    #Young's Modulus
Nu = 0.3                        #Poisson ratio   



# Definition of the differents Materials 

# Material 1: Create material 1 as a elasto-viscoplastic material 
materset = domain.getMaterialSet()                              
material1 = materset.define (1, EvpIsoHHypoMaterial) 
material1.put(MASS_DENSITY,    Density)   
material1.put(ELASTIC_MODULUS, Young)     
material1.put(POISSON_RATIO,   Nu)   
material1.put(YIELD_NUM,1)  #Using of the first hardening law which describe a linear hardening

# Material 2: Create material 1 as a elasto-viscoplastic material 
material2 = materset.define (2, EvpIsoHHypoMaterial) 
material2.put(MASS_DENSITY,    Density)  
material2.put(ELASTIC_MODULUS, Young)     
material2.put(POISSON_RATIO,   Nu)   
material2.put(YIELD_NUM,2)  #Using of the second hardening law which describe a perfectly plastic hardening 

# Material 3 = Elasto-viscoplastic material with a kinematic linear hardening
material3 = materset.define (3, EvpMixtHHypoMaterial) 
material3.put(MASS_DENSITY,    Density)   
material3.put(ELASTIC_MODULUS, Young)     
material3.put(POISSON_RATIO,   Nu)
material3.put(YIELD_NUM, 2)   
material3.put(KH_NB,1)
material3.put(KH_NUM1,3)  #Using of the third hardening law which describe a linear kinematic hardening 

# Material 4 : Elasto-viscoplastic material with a mixed linear hardening
material4 = materset.define (4, EvpMixtHHypoMaterial) 
material4.put(MASS_DENSITY,    Density)   
material4.put(ELASTIC_MODULUS, Young)     
material4.put(POISSON_RATIO,   Nu)
material4.put(YIELD_NUM, 5)   
material4.put(KH_NB,1)
material4.put(KH_NUM1,4)  #Using of the fourth hardening law which describe a linear mixed hardening 


# Data of the materials 
# -------------------------
SigmaY_0=200.0              #Elastic limit of virgin material  
h = 30000.0    
h_o = 1
m=1
theta = 0.2**m            #Hardening parameter 
hi=theta*h
hk = (1-theta)*h
# -------------------------


# -------------------------
# definition of the different law set : 
# -------------------------

# First law for a linear isotropic hardening with theta = 1 so hi = h 
lawset = domain.getMaterialLawSet() 
lawset1 = lawset.define(1, LinearIsotropicHardening)  #Create law number 1 as Linear Isotropic hardening law 
lawset1.put(IH_SIGEL,   SigmaY_0) #Set law parameters (see required parameters in the documentation)
lawset1.put(IH_H, h)



# Second law for a perfeclty plastic hardening such that h = 0 
lawset2 = lawset.define(2, LinearIsotropicHardening)  #Create law number 1 as Linear Isotropic hardening law 
lawset2.put(IH_SIGEL, SigmaY_0) #Set law parameters (see required parameters in the documentation)
lawset2.put(IH_H, h_o)



# Third law for a Kinematic linear hardening with theta = 0 so hk=h 
lawset3 = lawset.define(3, DruckerPragerKinematicHardening)  
lawset3.put(KH_H, h) # kinematic linear hardening theta = 0 so h = hk 


# Fourth law for  mixed linear  hardening with hk
lawset4 = lawset.define(4, DruckerPragerKinematicHardening)  
lawset4.put(KH_H, hk) # kinematic linear hardening theta = 0 so h = hk 


# Fifth law for a isotropic hardening with theta such that we use hi 
lawset5 = lawset.define(5, LinearIsotropicHardening)  
lawset5.put(IH_SIGEL,   SigmaY_0) #Set law parameters (see required parameters in the documentation)
lawset5.put(IH_H, hi)

# -------------------------





############################################################
# END OF DEFINITION OF THE MATERIALS AND MATERIAL LAWS     #
############################################################ 
      
#5.0 ELEMENTS
#===========================================

#5.1 Definition of element properties
#-----------------------------------------------------------
prp1 = ElementProperties (Volume3DElement)                     
prp1.put (MATERIAL,1)                          # Number of the material used                                  
prp1.put (CAUCHYMECHVOLINTMETH,VES_CMVIM_STD)   


#5.2 Generating elements on the mesh
#------------------------------------------------------------
app = FieldApplicator(1)                                       
app.push(volumeset(1))                                           
app.addProperty(prp1)                                          
domain.getInteractionSet().add(app)                            


#6. BOUNDARY CONDITIONS
#============ 

loadingset = domain.getLoadingSet() 

if p['GeometryHypothesis']=="PLANESTRESS":
    loadingset.define(sideset(1),Field1D(TZ,RE),0.)                     
    loadingset.define(sideset(3),Field1D(TY,RE),0.)                     
    loadingset.define(sideset(6),Field1D(TX,RE),0.)                     
    
elif p['GeometryHypothesis']=="PLANESTRAIN":

    loadingset.define(sideset(1),Field1D(TZ,RE),0.)###
    loadingset.define(sideset(6),Field1D(TX,RE),0.)###
    loadingset.define(sideset(3),Field1D(TY,RE),0.)###

    #Several possibilities : !!! only one 

    #loadingset.define(sideset(2),Field1D(TZ,RE),0.) #No deformation towards z
    loadingset.define(sideset(5),Field1D(TY,RE),0.) #No deformation towards y
    #loadingset.define(sideset(4),Field1D(TX,RE),0.) #No deformation towards z !!!!! correct ?

    
    ###################################################################
    # IMPLEMENT BOUNDARY CONDITION TO OBTAIN PLANE STRAIN STATE HERE  #
    ###################################################################
    
#7. LOADS
#=============
# 7.1 Definition of the loading function
#-------------------------------------------------

#LOAD:                                                              
Trac = 320.0                       #Traction
Ncycle = 5                         #Number of cycles of loading/unloading
Tcycle = 4.                        #Duration of one cycle

fct = PieceWiseLinearFunction()
for i in range (0,Ncycle):
    fct.setData(i*Tcycle+0.,0.) #POINT n°1
    fct.setData(i*Tcycle+Tcycle/4.0,1.0)#POINT n°2
    fct.setData(i*Tcycle+Tcycle*2.0/4.0,0.0)#POINT n°3
    fct.setData(i*Tcycle+Tcycle*3.0/4.0,-1.0)#POINT n°4
    fct.setData(i*Tcycle+Tcycle*4.0/4.0,0.0)#POINT n°5    

#########################################
# IMPLEMENT A DIFFERENT LOADING FCT HERE#
#########################################

#prp2 = ElementProperties (Pressure3DElement)                    
#prp2.put(PRESSURE,  -Trac)                             
#prp2.depend (PRESSURE, fct, Field1D(TM,RE)) # To apply your new function, you can put it instead of "fct" here

#For macOS users (Metafor Version v3467)
prp2 = ElementProperties (Traction3DElement)                    
prp2.put(PRESSURE,  Trac)                             
prp2.depend (PRESSURE, fct, Field1D(TM,RE)) # To apply your new function, you can put it instead of "fct" here

    
#7.3 Generating the pressure element on the mesh
#---------------------------------------------------------------------
trac = LoadingInteraction(2)                                    
trac.push(sideset(4))                                           
trac.addProperty(prp2)                                          
domain.getInteractionSet().add(trac)                         

#8. Integration Scheme
#========================

#8.1 Gestion des pas de temps
#-----------------------------
tsm = metafor.getTimeStepManager()                             
tsm.setInitialTime(0.0,   p['dT'])                                  
tsm.setNextTime(Ncycle*Tcycle, int(Ncycle*Tcycle),  p['dT'])                                    
                                                                
#9. Archiving
#============
node_id = 7

valuesmanager = metafor.getValuesManager()                                                  #Access Values Manager

valuesmanager.add(1, MiscValueExtractor(metafor,EXT_T),'time')                              #Archive the time(EXT_T) in a "time.ascii" file

#Stress
valuesmanager.add(2, IFNodalValueExtractor(pointset(node_id), IF_SIG_XX),'Sigma_XX' )
valuesmanager.add(3, IFNodalValueExtractor(pointset(node_id), IF_SIG_YY),'Sigma_YY' )
valuesmanager.add(4, IFNodalValueExtractor(pointset(node_id), IF_SIG_ZZ),'Sigma_ZZ' )
valuesmanager.add(5, IFNodalValueExtractor(pointset(node_id), IF_EVMS),'SigmaVM' )
valuesmanager.add(6, IFNodalValueExtractor(pointset(node_id), IF_YIELD_STRESS),'Sigma_Yield' )

#Strain
valuesmanager.add(7, IFNodalValueExtractor(pointset(node_id), IF_EPL),'EPL' )
valuesmanager.add(8, IFNodalValueExtractor(pointset(node_id), IF_NAT_STRAIN_XX),'E_XX' )
valuesmanager.add(9, IFNodalValueExtractor(pointset(node_id), IF_NAT_STRAIN_YY),'E_YY' )
valuesmanager.add(10, IFNodalValueExtractor(pointset(node_id), IF_NAT_STRAIN_ZZ),'E_ZZ' )

#Backstress
valuesmanager.add(11, IFNodalValueExtractor(pointset(node_id), IF_ALP_XX),'A_XX' )
valuesmanager.add(12, IFNodalValueExtractor(pointset(node_id), IF_ALP_YY),'A_YY' )
valuesmanager.add(13, IFNodalValueExtractor(pointset(node_id), IF_ALP_ZZ),'A_ZZ' )

#10. Visualisation of curves in real time (not necessary but useful)
#=====================================================

#Stress
dataCurveSX = VectorDataCurve(1, valuesmanager.getDataVector(1), valuesmanager.getDataVector(2),'Sigma_XX')
dataCurveSY = VectorDataCurve(2, valuesmanager.getDataVector(1), valuesmanager.getDataVector(3),'Sigma_YY')
dataCurveSZ = VectorDataCurve(3, valuesmanager.getDataVector(1), valuesmanager.getDataVector(4),'Sigma_ZZ')
dataCurveSVM = VectorDataCurve(4, valuesmanager.getDataVector(1), valuesmanager.getDataVector(5),'Sigma_VM')
dataCurveSYield = VectorDataCurve(5, valuesmanager.getDataVector(1), valuesmanager.getDataVector(6),'Sigma_Yield')

dataCurveSet2 = DataCurveSet()
dataCurveSet2.add(dataCurveSX)
dataCurveSet2.add(dataCurveSY)
dataCurveSet2.add(dataCurveSZ)
dataCurveSet2.add(dataCurveSVM)
dataCurveSet2.add(dataCurveSYield)
winc2 = VizWin()
winc2.add(dataCurveSet2)
metafor.addObserver(winc2)

#Strain
dataCurveDEPL = VectorDataCurve(6, valuesmanager.getDataVector(1), valuesmanager.getDataVector(7),'E_PL')
dataCurveDX = VectorDataCurve(7, valuesmanager.getDataVector(1), valuesmanager.getDataVector(8),'E_XX')
dataCurveDY = VectorDataCurve(8, valuesmanager.getDataVector(1), valuesmanager.getDataVector(9),'E_YY')
dataCurveDZ = VectorDataCurve(9, valuesmanager.getDataVector(1), valuesmanager.getDataVector(10),'E_ZZ')

dataCurveSet3 = DataCurveSet()
dataCurveSet3.add(dataCurveDX)
dataCurveSet3.add(dataCurveDY)
dataCurveSet3.add(dataCurveDZ)
dataCurveSet3.add(dataCurveDEPL)
winc3 = VizWin()
winc3.add(dataCurveSet3)
metafor.addObserver(winc3)

#Backstress
dataCurveAX = VectorDataCurve(10, valuesmanager.getDataVector(1), valuesmanager.getDataVector(11),'A_XX')
dataCurveAY = VectorDataCurve(11, valuesmanager.getDataVector(1), valuesmanager.getDataVector(12),'A_YY')
dataCurveAZ = VectorDataCurve(12, valuesmanager.getDataVector(1), valuesmanager.getDataVector(13),'A_ZZ')

dataCurveSet4 = DataCurveSet()
dataCurveSet4.add(dataCurveAX)
dataCurveSet4.add(dataCurveAY)
dataCurveSet4.add(dataCurveAZ)
winc4 = VizWin()
winc4.add(dataCurveSet4)
metafor.addObserver(winc4)
metafor.addObserver(winc4)

