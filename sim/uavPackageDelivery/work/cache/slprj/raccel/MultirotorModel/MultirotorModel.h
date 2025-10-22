#ifndef MultirotorModel_h_
#define MultirotorModel_h_
#ifndef MultirotorModel_COMMON_INCLUDES_
#define MultirotorModel_COMMON_INCLUDES_
#include <stdio.h>
#include <stdlib.h>
#include "sl_AsyncioQueue/AsyncioQueueCAPI.h"
#include "rtwtypes.h"
#include "sigstream_rtw.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "slexec_parallel.h"
#include "rt_logging_simtarget.h"
#include "rt_nonfinite.h"
#include "math.h"
#include "dt_info.h"
#include "ext_work.h"
#include "blas.h"
#endif
#include "MultirotorModel_types.h"
#include "mwmathutil.h"
#include <stddef.h>
#include <string.h>
#include "rtGetNaN.h"
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include "rtGetInf.h"
#define MODEL_NAME MultirotorModel
#define NSAMPLE_TIMES (6) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (204) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (12)   
#elif NCSTATES != 12
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { real32_T in15ttdbct [ 3 ] ; real32_T cydxr5upba ; real32_T
daz2zss5gc ; uint8_T ebmwo0mdgk ; } gzpvk2dmzl ; typedef struct { jair554vtb
chbsydlnjm ; boolean_T manwfisai4 ; } ora3lzo1kq ; typedef struct { real32_T
p1z4jzjbvh ; } iwnkvslm2k ; typedef struct { int32_T paemnr03id ; boolean_T
kosbuxw4nx ; } fqudw5urz2 ; typedef struct { real_T nuh41wxn0w [ 2 ] ; real_T
ijwq3brrz4 ; real32_T l104xnual1 [ 2 ] ; real32_T l12az3stgk [ 2 ] ; real32_T
lr21nhybup [ 2 ] ; real32_T asrhskbxtm ; real32_T lgjoygnciy ; real32_T
ajskuditcp [ 4 ] ; real32_T kmaxtby45v [ 16 ] ; iwnkvslm2k epoamlrzja ;
iwnkvslm2k isgfynkqjw ; } e13evn0iar ; typedef struct { struct { void *
TimePtr ; void * DataPtr ; void * RSimInfoPtr ; } fiqkp1x5ab ; struct { void
* TimePtr ; void * DataPtr ; void * RSimInfoPtr ; } m20af3kcir ; real32_T
jedjixn4wf [ 2 ] ; real32_T ptz0olsknc [ 2 ] ; real32_T ligbfy0ydp [ 2 ] ;
real32_T gmp0gvi1eg ; real32_T pkseerw1ps ; int32_T fwtojkoxil ; int32_T
axf2ivmffy ; struct { int_T PrevIndex ; } jrt4ahxcr3 ; struct { int_T
PrevIndex ; } fhqba1ac5a ; int8_T ngqa3cl3ch ; boolean_T drdqb2nbcf ;
boolean_T b34gs5nizr ; boolean_T jdoajjowei ; fqudw5urz2 epoamlrzja ;
fqudw5urz2 isgfynkqjw ; } jj0xlvag5r ; typedef struct { real_T bzzbdit0sb ;
real_T hzj0ngsgbf ; real_T ctrmt3ruiy ; real_T frik1umsb1 ; real_T h0hu3zuwxl
; real_T nzhmh1iiv3 ; real_T byifrgckux [ 3 ] ; real_T jk0syur3pd [ 3 ] ;
real_T bz1nbajjxg [ 4 ] ; real_T htpsnc44z1 [ 4 ] ; real_T o2ftfvin3w ;
real_T p0ofr4te2s ; real_T lpt2tec5yl ; real_T pw3xiweg5z ; real_T eusqimawql
; real_T iefbjyefbn ; real_T jwrntb0tlg ; real_T c2qvm4wzez ; real_T
ggv340ktgd ; real_T ioekd3zzrj [ 2 ] ; real_T emz5cbfumi [ 2 ] ; real_T
oinqopv1s5 ; real_T kaviwvhjw5 [ 2 ] ; real_T ffmvr5qhqu [ 2 ] ; real_T
n221biixnu ; real_T coapjggyum ; real_T axa5vb4vvu ; real_T hlx0tda2tp ;
real_T eye2nivohz ; real_T fquuajxaq5 [ 3 ] ; real_T fchutrhkap ; real_T
o1gktkwf5w ; real_T mftojpmhk4 ; real_T mzpqh2vdfb ; real_T cc4oemevxd ;
real_T gqcp0i2mb4 ; real_T dclal1bmnw [ 3 ] ; real_T n4ve44gcoh [ 3 ] ;
real_T mras3opkdb [ 3 ] ; real32_T j1k0d2o2h4 ; } n0i54lkvw5 ; typedef struct
{ boolean_T bwedep1kq5 ; } cuhcxx0ncj ; typedef struct { real_T f5oe3dmq1x ;
} f4m2uufdao ; typedef struct { n0i54lkvw5 cdz0vwtzpdl ; } g1rt4yrlas ;
typedef struct { cuhcxx0ncj cdz0vwtzpdl ; } nb1ck4cjom ; typedef struct {
f4m2uufdao cdz0vwtzpdl ; } lg2vd11bvq ; typedef struct { int8_T dgdbrcmdfi ;
} gu332ryjyo ; typedef struct { EnvironmentBus pxvla503xe ; uavPathManagerBus
l5cxq1n3v3 [ 2 ] ; gps_raw_int ifjwmthkqu ; gps_raw_int gjlwqkue0m ;
innerLoopCmdsBus imabc3fpd3 ; innerLoopCmdsBus osyifedrkf ; real_T ldobphcgii
; real_T mqn4wqkqt1 [ 3 ] ; real_T n5zy0dlddi [ 3 ] ; real_T b2vzl4jvmf [ 9 ]
; real_T h0l55ev322 [ 3 ] ; real_T m2pff5eoce [ 3 ] ; real_T c2ezod5wqa [ 3 ]
; real_T ltnejzrzsb ; real_T dnzqyzmjq1 ; real_T fsw5y3sk52 ; real_T
k5abkespad ; real_T leirfnlkmj ; real_T ka3trac23w ; real_T amy52mba00 [ 3 ]
; real_T p1jt4kwpsi [ 3 ] ; real_T ibijw5nyvt [ 3 ] ; real_T bujbjhloby [ 3 ]
; real_T bnlqh5e3ok [ 3 ] ; real_T nnzby1zie1 [ 3 ] ; real_T dubdi4n5k1 [ 3 ]
; real_T hzvglzjvo1 [ 3 ] ; real_T fdyykdyy0z [ 3 ] ; real_T lay0qse3ey [ 3 ]
; real_T g05sp32g1r ; real_T coytgocfzx ; real_T ih3r40m4ke ; real_T
kaqyna3uhe ; real_T ib13fuehnp ; real_T nbzr0n555h ; real_T a3a54gq2ph ;
real_T h25sqqw3yx [ 2 ] ; real_T dxfnmue1xt ; real_T m4xdglyhk3 [ 3 ] ;
real_T bd5s2as1af [ 3 ] ; real_T mh5uen3aqi [ 3 ] ; real_T frwbosnrut [ 3 ] ;
real_T jchu5yjfmw [ 3 ] ; real_T ajmwlylmw1 [ 3 ] ; real_T lxkiufmzes [ 3 ] ;
real_T o5oqm2simu ; real_T ohrfgdroql ; real_T jvtmh22qst ; real_T ggxt3gr3he
; real_T fquojcpwbw ; real_T puw4d5oseo ; real_T jcz2kvnpxn [ 3 ] ; real_T
akwoigfag4 [ 3 ] ; real_T gissagiggk [ 9 ] ; real_T pa4gk1y4g3 [ 3 ] ; real_T
bqv4wu45ri [ 3 ] ; real_T olgghceo5j [ 3 ] ; real_T lqfwoh0n1n [ 3 ] ; real_T
db1ezvojmn [ 3 ] ; real_T i0thgs5tav ; real_T pjmasymrdk ; real_T eplpvzodf3
; real_T awp3hht3oi ; real_T hxchelqktd ; real_T kayt4m3gqp ; real_T
mp3myeon1n ; real_T mchs4l4edm ; real_T cj1amiomxp ; real_T bbluvjkieu ;
real_T krnjwyjvkj ; real_T lodenvs5g1 ; real_T mwoevuj2os ; real_T e33twyhqos
; real_T iuexrpviik ; real_T ntohuvbasf [ 2 ] ; real_T cqiy2axvyl ; real_T
kca5cb5tsf ; real_T afefjghhdn ; real_T ni2sll21du ; real_T kzlvg4hjk3 ;
real_T jrp05rk55u ; real_T nkit20fvts ; real_T lfaiqqscqd ; real_T hvp2sppawf
; real_T l0pnc1s4mu ; real_T f03ol2ggzn ; real_T ifsq42ee3o [ 9 ] ; real_T
olos53ginz [ 9 ] ; real_T krxkpaiksh [ 9 ] ; real_T izylkdvpau [ 12 ] ;
real_T hc0qcnw5on ; real_T cribstruca ; real_T ak5ymkxznu ; real_T ofukpmkdy5
; real_T lu42x34o2b ; real_T fxd0ubsotk ; real_T nh44hic2sm ; real_T
awzdvp4jqe ; real_T exzkjoehou ; real_T p3yyiopuki ; real_T aaenzgbubh ;
real_T hxsj2amrkv ; real_T lm2bui53nh ; real_T k2mqf4yhf5 ; real_T fadxil2qeo
; real_T b5zrucajw2 ; real_T gmom2xsbq5 [ 12 ] ; real_T btcdwx5g4u [ 3 ] ;
real_T hixslm14r1 [ 12 ] ; real_T o0in1k2qbd [ 3 ] ; real_T enyi2k544r ;
real_T kphyjd1y4z ; real_T lu30jzebtd ; real_T a0aytf3nca ; real_T ebpbhsjiym
; real_T g3i3wdoj5b ; uint32_T ghlmhvgqsy ; uint32_T ghlmhvgqsym ; uint32_T
mp2q4lalh1 ; real32_T cg5tlsmqt5 [ 4 ] ; real32_T e5mtnzgp51 [ 4 ] ; real32_T
nrhrd0m3xa [ 3 ] ; real32_T pxjrjgzynn [ 3 ] ; real32_T ieijn20t5v [ 3 ] ;
real32_T pp5kihwvjz [ 3 ] ; real32_T o3kzvxzo2u [ 9 ] ; real32_T hggs2tnlhf ;
real32_T of1zobrivn [ 4 ] ; real32_T i0ash4qqgy [ 8 ] ; real32_T k0g1kz0qhh [
8 ] ; int32_T mihh5w3wpj ; int32_T c1aqnnzjag ; int32_T pbeyz3hpj5 ; uint16_T
j5eopnr54g ; uint16_T f03tvkqvfh ; uint8_T mzzvbyhare ; uint8_T lssntlpr1j ;
boolean_T mnqovcasj3 ; boolean_T dxlmtpmwu1 ; boolean_T dtlgarrfas ;
boolean_T lla5dgr3rs ; g1rt4yrlas n2lxxqcgg4 [ 4 ] ; e13evn0iar e0fma3ayau1 ;
gzpvk2dmzl b0oafc4epa55 ; gzpvk2dmzl b0oafc4epa5 ; } B ; typedef struct {
orfegcv4kn itautcby1t ; mbqtt1uxdw llsff5iey1 ; k420dbwipx bfywtrujvk ;
gps_raw_int jtryrsd4lf ; innerLoopCmdsBus jridowmstm ; real_T d1vf1pvdnr [ 9
] ; real_T l1ssryyvmx [ 8 ] ; real_T jbvbpmq1xi [ 8 ] ; real_T jwmjvb1gsq ;
real_T du0pxq2bfe ; real_T odhpjjs3qb ; real_T lzhq3izrk0 ; real_T a1jomnvv0w
; struct { real_T modelTStart ; } njltddwgg3 ; struct { void * AQHandles [ 23
] ; } knnczm1loo ; struct { void * TimePtr ; void * DataPtr ; void *
RSimInfoPtr ; } ffvksv0qiv ; struct { void * TUbufferPtrs [ 6 ] ; }
bmdtacp0cy ; struct { void * TimePtr ; void * DataPtr ; void * RSimInfoPtr ;
} nrkk55g5lf ; void * pp4attafbv ; void * hzlvzh2k3j ; void * m5vjodt2wj ;
void * culj3unyhd ; void * hqdkd0qvom ; struct { void * LoggedData ; }
gw1octhf5m ; struct { void * LoggedData ; } kjcfkoikbv ; real32_T b15gt53unz
[ 4 ] ; real32_T pixzc3oljz ; real32_T h04sx1dkfi ; real32_T dovhm5unul ;
real32_T pxykrwenlr ; real32_T odmghcctis ; real32_T kcvcsskptr ; real32_T
jiq5msx5pw ; real32_T ldfvbvtevx ; real32_T gxa1ivuu24 ; real32_T ly4ib1avym
; real32_T ejprdguzqs ; real32_T e52z4zlwgx ; real32_T fi5xbril21 ; real32_T
kcf5q2qge2 ; real32_T otxm1fxjsh ; real32_T lagggpzidr ; real32_T aebmwa0ddy
; real32_T c4osaguvpc ; real32_T c3p3mmpo2e ; real32_T lx55nwdsze ; real32_T
oartlmxrm2 ; real32_T mrty4tzbyf ; real32_T hlsknt4v0p ; real32_T lhxoelvqa0
; real32_T oqlqbiwpks [ 8 ] ; real32_T dlo31b5ncv [ 8 ] ; int32_T hppeg53im2
; int32_T pgqtwdzdtt ; int32_T krw1e2vruq ; int32_T ejw21jidiq ; uint32_T
hm4jnufcya ; uint32_T dadhjfyvf5 ; uint32_T nf1ixgefra ; uint32_T eflz0zkkbh
; uint32_T hhborlconl ; struct { int_T PrevIndex ; } bs12ltdsrz ; struct {
int_T Tail [ 3 ] ; int_T Head [ 3 ] ; int_T Last [ 3 ] ; int_T
CircularBufSize [ 3 ] ; int_T MaxNewBufSize ; } mbrtl3jxep ; struct { int_T
PrevIndex ; } kpovwqahpf ; int_T fl4ncoobbf ; int_T hazr2j5xfs ; int_T
g0qwbb3rmr ; int_T ipvngnluti ; uint8_T oeeefqcawl ; int8_T p5vsv1vlfs ;
int8_T nvl4rcxbze ; int8_T llyr5xqlde ; int8_T lb5nlzuul0 ; int8_T bmulrsumwo
; int8_T bkn0e0m15r ; int8_T melou0gnot ; int8_T d4x3urfknt ; int8_T
f2ysqhwpby ; int8_T coff0jzukp ; int8_T jh1z4qw2id ; int8_T aqiwtrmxn4 ;
int8_T gqpcxrozdd ; int8_T gqe1uo1ywn ; int8_T lsmdpslc2q ; int8_T ciwimejv0h
; uint8_T hpl1qzrd3n ; uint8_T p1qsipllhj ; uint8_T h4dfd3utpn ; boolean_T
ptfrc5kzed ; boolean_T pd0rz5i13z ; boolean_T p40srx13bh ; boolean_T
b1ttbld44a ; boolean_T jjf0m3camo ; boolean_T kvwkotkk3o ; boolean_T
ndx3ymve0s ; boolean_T geo3u0pz41 ; boolean_T jstskafrrt ; boolean_T
lcpfrlnezb ; boolean_T ccfbe454ge ; boolean_T ofiulw2caf ; gu332ryjyo
lpsrrvnkui ; gu332ryjyo jk40hfhipqx ; nb1ck4cjom n2lxxqcgg4 [ 4 ] ;
jj0xlvag5r e0fma3ayau1 ; ora3lzo1kq b0oafc4epa55 ; ora3lzo1kq b0oafc4epa5 ; }
DW ; typedef struct { real_T pyr33vr1iq [ 3 ] ; real_T fas5jic5kk [ 3 ] ;
real_T gbqlfwfp41 [ 3 ] ; real_T iotjqmw0qo [ 3 ] ; } X ; typedef int_T
PeriodicIndX [ 3 ] ; typedef real_T PeriodicRngX [ 6 ] ; typedef struct {
real_T pyr33vr1iq [ 3 ] ; real_T fas5jic5kk [ 3 ] ; real_T gbqlfwfp41 [ 3 ] ;
real_T iotjqmw0qo [ 3 ] ; } XDot ; typedef struct { boolean_T pyr33vr1iq [ 3
] ; boolean_T fas5jic5kk [ 3 ] ; boolean_T gbqlfwfp41 [ 3 ] ; boolean_T
iotjqmw0qo [ 3 ] ; } XDis ; typedef struct { real_T pyr33vr1iq [ 3 ] ; real_T
fas5jic5kk [ 3 ] ; real_T gbqlfwfp41 [ 3 ] ; real_T iotjqmw0qo [ 3 ] ; }
CStateAbsTol ; typedef struct { real_T pyr33vr1iq [ 3 ] ; real_T fas5jic5kk [
3 ] ; real_T gbqlfwfp41 [ 3 ] ; real_T iotjqmw0qo [ 3 ] ; } CXPtMin ; typedef
struct { real_T pyr33vr1iq [ 3 ] ; real_T fas5jic5kk [ 3 ] ; real_T
gbqlfwfp41 [ 3 ] ; real_T iotjqmw0qo [ 3 ] ; } CXPtMax ; typedef struct {
real_T ez4j4q1yht ; real_T ipfaiyuxud ; real_T hxlq5c4njb ; real_T hcs4x3bmpe
; real_T b1h2pqjyk0 ; real_T imeix1b3zr ; real_T lbv3othhrn ; real_T
h3dh0qoq2z ; lg2vd11bvq n2lxxqcgg4 [ 4 ] ; } ZCV ; typedef struct {
rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct iioiwscc1l_ { real32_T
Angularvelocitycontrolloop_D [ 2 ] ; real32_T Angularvelocitycontrolloop_I [
2 ] ; real32_T Velocitycontroller_I ; real32_T
Angularvelocitycontrolloop_InitialConditionForFilter ; real32_T
Velocitycontroller_InitialConditionForIntegrator ; real32_T
Angularvelocitycontrolloop_InitialConditionForIntegrator ; real32_T
Positioncontroller_LowerSaturationLimit ; real32_T
Velocitycontroller_LowerSaturationLimit ; real32_T
Angularvelocitycontrolloop_LowerSaturationLimit ; real32_T
Angularvelocitycontrolloop_N ; real32_T Positioncontroller_P ; real32_T
Velocitycontroller_P ; real32_T Anglecontrolloop_P ; real32_T
Angularvelocitycontrolloop_P [ 2 ] ; real32_T
Positioncontroller_UpperSaturationLimit ; real32_T
Velocitycontroller_UpperSaturationLimit ; real32_T
Angularvelocitycontrolloop_UpperSaturationLimit ; real_T GPSdrift_Time0 [ 501
] ; real_T GPSdrift_Data0 [ 1002 ] ; real_T barrodrift_Time0 [ 501 ] ; real_T
barrodrift_Data0 [ 501 ] ; real32_T ActuatorCmds_Y0 ; real32_T
Constant1_Value ; real32_T Constant1_Value_bg2p5q21ec ; real32_T
Integrator_gainval ; real32_T Gain_Gain [ 2 ] ; real32_T
Integrator_gainval_fkl0csx1tr ; real32_T Filter_gainval ; real32_T
DiscreteTimeIntegrator_gainval ; real32_T DiscreteTimeIntegrator_IC ;
real32_T DiscreteTimeIntegrator_UpperSat ; real32_T
DiscreteTimeIntegrator_LowerSat ; real32_T P_z1_Gain ; real32_T D_z1_Gain ;
real32_T SaturationThrust1_UpperSat ; real32_T SaturationThrust1_LowerSat ;
real32_T P_yaw_Gain ; real32_T DiscreteTimeIntegrator_gainval_oux2ktusth ;
real32_T DiscreteTimeIntegrator_IC_k4qsha3hyk ; real32_T
DiscreteTimeIntegrator_UpperSat_c5d2uk2k0s ; real32_T
DiscreteTimeIntegrator_LowerSat_azjrmee55e ; real32_T D_yaw_Gain ; real32_T
I_yaw_Gain ; real32_T I_pr_Gain ; real32_T ThrustToMotorCommand_Gain ;
real32_T Saturation5_UpperSat ; real32_T Saturation5_LowerSat ; real32_T
MotorDirections_Gain [ 4 ] ; real32_T Clamping_zero_Value ; real32_T
TorqueTotalThrustToThrustPerMotor_Value [ 16 ] ; real32_T
Clamping_zero_Value_mwkp2wofuc ; real32_T w1_Value ; int8_T Constant_Value ;
int8_T Constant2_Value ; int8_T Constant3_Value ; int8_T Constant4_Value ;
int8_T Constant_Value_e5r0lmle3l ; int8_T Constant2_Value_hfogelb41x ; int8_T
Constant3_Value_cexplrt1a1 ; int8_T Constant4_Value_cdeulapdlg ; } ; struct
l2pgyi01zx_ { real_T Gain_Gain ; real_T R1_Gain ; real_T R2_Gain ; real_T
Gain1_Gain ; real_T Gain2_Gain ; real_T Constant1_Value ; real_T
Constant3_Value [ 2 ] ; real_T Constant4_Value ; real32_T R_Gain ; real32_T
R3_Gain ; real32_T R4_Gain ; } ; struct d23d4trzhm_ { l2pgyi01zx cdz0vwtzpdl
; } ; struct P_ { struct_OSJpyIZcrpXqReVWwh9iuG
_Vehicle2f2uavPackageDeliveryDataDict_sldd_ ; struct_hE1099BMemg5OfzqcWAA6G
_initialConditions2f2uavPackageDeliveryDataDict_sldd_ ; uavPathManagerBus
_baseMission2f2uavPackageDeliveryDataDict_sldd_ [ 42 ] ; real_T
_uavIC_latLon2f2uavPackageDeliveryDataDict_sldd_ [ 2 ] ; real_T mass_param ;
real_T motor_delay_time ; real_T startFlightTime ; real_T uDOFQuaternion_Vm_0
[ 3 ] ; real_T COESAAtmosphereModel_action ; real_T CompareToConstant_const ;
real_T CompareToConstant_const_p35me42xvr ; real_T
CompareToConstant_const_gzjkgce2q4 ; real_T
CompareToConstant_const_mj4aqbmylt ; real_T
CompareToConstant_const_nwcj42kmak ; real_T
CompareToConstant_const_fugbpfpwgs ; real_T uDOFQuaternion_eul_0 [ 3 ] ;
real_T uDOFQuaternion_pm_0 [ 3 ] ; real_T FlatEarthtoLLA_psi ; uint8_T
CompareToConstant_const_h3qrt043uz ; uint8_T Landed_const ; gps_raw_int
Memory1_15_InitialCondition ; innerLoopCmdsBus
RateTransition1_InitialCondition ; real_T Step_Y0 ; real_T Step_YFinal ;
real_T Magneticfeild_Value [ 3 ] ; real_T GPSModel_RollAccuracy ; real_T
GPSModel_PitchAccuracy ; real_T GPSModel_YawAccuracy ; real_T
GPSModel_PositionAccuracy ; real_T GPSModel_VelocityAccuracy ; real_T
Constant_Value ; real_T Bias_Bias ; real_T Gain_Gain ; real_T Bias1_Bias ;
real_T Bias_Bias_i1bu5cs1jd ; real_T Bias1_Bias_i3jbvzmd2x ; real_T
Bias_Bias_o5mswgodyq ; real_T Bias1_Bias_ikyary3trd ; real_T
Constant_Value_mrukhswidt ; real_T wind_Time0 [ 501 ] ; real_T wind_Data0 [
1503 ] ; real_T u2rhoV2_Gain ; real_T Gain_Gain_bca50qwkub [ 2 ] ; real_T
Gain3_Gain ; real_T TransportDelay_InitOutput ; real_T IMUDrift_Time0 [ 501 ]
; real_T IMUDrift_Data0 [ 1503 ] ; real_T Merge_InitialOutput ; real_T
Merge_InitialOutput_ffiktmcxlg ; real_T Gain_Gain_plpwcr1skl ; real_T
Gain1_Gain ; real_T Gain2_Gain ; real_T Constant2_Value [ 9 ] ; real_T
D1_Value [ 3 ] ; real_T D2_Value [ 3 ] ; real_T D3_Value [ 3 ] ; real_T
D4_Value [ 3 ] ; real_T Constant_Value_jcocc201pv ; real_T Constant1_Value ;
real_T Constant2_Value_cvi1k0q43x ; real_T Constant2_Value_gsps0c2cqc ;
real_T Constant_Value_c2sqjmkns4 ; real_T Constant1_Value_asvirhyy4x ; real_T
Bias_Bias_ir1mwfrehi ; real_T Constant2_Value_pql0ow2xvu ; real_T
Bias1_Bias_besunzn4gp ; real_T Bias_Bias_l10zoh0uu5 ; real_T
Gain_Gain_f4cp2usue1 ; real_T Bias1_Bias_hq0ealnef0 ; real_T
Bias_Bias_owq1alblb2 ; real_T Constant2_Value_g4wkd4w02n ; real_T
Bias1_Bias_p1ta40i5bj ; real_T Constant_Value_lwxaohkvcw ; real_T
Constant1_Value_j3mahrfuck ; real_T Constant_Value_kuutqrezza ; real_T
Constant_Value_ircykwslyx ; real_T f_Value ; real_T Constant_Value_byry0rmz1r
; real_T Zeroleveltrust_Value ; real_T Step_Y0_oehiaips24 ; real_T
Step_YFinal_f1dbnugz1k ; int32_T Gain2_Gain_olwza3kd3o ; int32_T
Gain_Gain_dqksrwq0by ; int32_T Gain1_Gain_ewyr5l45gb ; real32_T
HdgCmdSat_UpperSat ; real32_T HdgCmdSat_LowerSat ; real32_T
YawCmdSat_UpperSat ; real32_T YawCmdSat_LowerSat ; real32_T
LookaheadDistance_Value ; real32_T LookaheadDistance_Value_fb3ddw2y0z ;
real32_T HdgCmdSat_UpperSat_lox2buywsz ; real32_T
HdgCmdSat_LowerSat_imiuafvcd1 ; real32_T YawCmdSat_UpperSat_l4z43obj54 ;
real32_T YawCmdSat_LowerSat_db3m0k1sno ; real32_T Saturation_UpperSat ;
real32_T Saturation_LowerSat ; real32_T LookaheadDistance_Value_hppahproe4 ;
real32_T Home_Value [ 3 ] ; real32_T Motordirections_Gain [ 4 ] ; real32_T
Saturation5_UpperSat ; real32_T Saturation5_LowerSat ; real32_T
Motordirections1_Gain [ 4 ] ; real32_T motorsToW2_Gain_Gain ; real32_T
Gain3_Gain_ccpyinsi0r ; real32_T Gain4_Gain ; real32_T
RateTransition_InitialCondition ; real32_T Memory1_2_InitialCondition ;
real32_T Memory1_3_InitialCondition ; real32_T Memory1_4_InitialCondition ;
real32_T Memory1_5_InitialCondition ; real32_T Memory1_6_InitialCondition ;
real32_T Memory1_7_InitialCondition ; real32_T Memory1_9_InitialCondition ;
real32_T Memory1_10_InitialCondition ; real32_T Memory1_11_InitialCondition ;
real32_T Memory1_12_InitialCondition ; real32_T Memory1_13_InitialCondition ;
real32_T Memory1_14_InitialCondition ; uint32_T Constant1_Value_anm2sz40q5 ;
uint32_T Constant2_Value_pl3vsgsb5a ; uint32_T Memory1_1_InitialCondition ;
uint32_T Memory1_8_InitialCondition ; uint16_T Zeroleveltrust6_Value ;
uint16_T Zeroleveltrust7_Value ; uint8_T Constant_Value_hrnfkpkbtx ; uint8_T
Constant_Value_degkb43kq4 ; uint8_T Delay_InitialCondition ; uint8_T
TakeoffIC_Value ; uint8_T MissionAction_Value ; uint8_T Zeroleveltrust5_Value
; d23d4trzhm n2lxxqcgg4 ; iioiwscc1l e0fma3ayau1 ; } ; extern const char_T *
RT_MEMORY_ALLOCATION_ERROR ; extern B rtB ; extern X rtX ; extern DW rtDW ;
extern P rtP ; extern mxArray * mr_MultirotorModel_GetDWork ( ) ; extern void
mr_MultirotorModel_SetDWork ( const mxArray * ssDW ) ; extern mxArray *
mr_MultirotorModel_GetSimStateDisallowedBlocks ( ) ; extern const
rtwCAPI_ModelMappingStaticInfo * MultirotorModel_GetCAPIStaticMap ( void ) ;
extern SimStruct * const rtS ; extern DataMapInfo * rt_dataMapInfoPtr ;
extern rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ; void MdlOutputs ( int_T
tid ) ; void MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T tid ) ; void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) ;
#endif
