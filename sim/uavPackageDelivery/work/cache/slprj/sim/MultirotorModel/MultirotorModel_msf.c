#if !defined(S_FUNCTION_NAME)
#define S_FUNCTION_NAME MultirotorModel_msf
#endif
#define S_FUNCTION_LEVEL 2
#if !defined(RTW_GENERATED_S_FUNCTION)
#define RTW_GENERATED_S_FUNCTION
#endif
#include <stdio.h>
#include <math.h>
#include "simstruc.h"
#include "fixedpoint.h"
#include "mwstringutil.h"
#define rt_logging_h
#include "MultirotorModel_types.h"
#include "MultirotorModel.h"
#include "MultirotorModel_private.h"
struct_OSJpyIZcrpXqReVWwh9iuG rtP__Vehicle2f2uavPackageDeliveryDataDict_sldd_
; struct_hE1099BMemg5OfzqcWAA6G
rtP__initialConditions2f2uavPackageDeliveryDataDict_sldd_ ; real_T
rtP__uavIC_latLon2f2uavPackageDeliveryDataDict_sldd_ [ 2 ] ; real_T
rtP_mass_param ; real_T rtP_motor_delay_time ; real_T rtP_startFlightTime ;
const char * rt_GetMatSignalLoggingFileName ( void ) { return NULL ; } const
char * rt_GetMatSigLogSelectorFileName ( void ) { return NULL ; } void *
rt_GetOSigstreamManager ( void ) { return NULL ; } void * rt_slioCatalogue ( void ) { return NULL ; } void * rtwGetPointerFromUniquePtr ( void * uniquePtr ) { return NULL ; } void * CreateDiagnosticAsVoidPtr ( const char * id , int nargs , ... ) { void * voidPtrDiagnostic = NULL ; va_list args ; va_start ( args , nargs ) ; slmrCreateDiagnostic ( id , nargs , args , & voidPtrDiagnostic ) ; va_end ( args ) ; return voidPtrDiagnostic ; } void rt_ssSet_slErrMsg ( void * S , void * diag ) { SimStruct * simStrcut = ( SimStruct * ) S ; if ( ! _ssIsErrorStatusAslErrMsg ( simStrcut ) ) { _ssSet_slLocalErrMsg ( simStrcut , diag ) ; } else { _ssDiscardDiagnostic ( simStrcut , diag ) ; } } void rt_ssReportDiagnosticAsWarning ( void * S , void * diag ) { _ssReportDiagnosticAsWarning ( ( SimStruct * ) S , diag ) ; } void rt_ssReportDiagnosticAsInfo ( void * S , void * diag ) { _ssReportDiagnosticAsInfo ( ( SimStruct * ) S , diag ) ; } const char * rt_CreateFullPathToTop ( const char * toppath , const char * subpath ) { char * fullpath = NULL ; slmrCreateFullPathToTop ( toppath , subpath , & fullpath ) ; return fullpath ; } boolean_T slIsRapidAcceleratorSimulating ( void ) { return false ; } void rt_RAccelReplaceFromFilename ( const char * blockpath , char * fileName ) { ( void ) blockpath ; ( void ) fileName ; } void rt_RAccelReplaceToFilename ( const char * blockpath , char * fileName ) { ( void ) blockpath ; ( void ) fileName ; } void * slsa_malloc ( size_t s ) { return malloc ( s ) ; } void slsa_free ( void * ptr ) { free ( ptr ) ; } void slsaCacheDWorkPointerForSimTargetOP ( void * ss , void * * ptr ) { ( void ) ss ; ( void ) ptr ; } void slsaCacheDWorkDataForSimTargetOP ( void * ss , void * ptr , unsigned int sizeInBytes ) { ( void ) ss ; ( void ) ptr ; ( void ) sizeInBytes ; } void slsaSaveRawMemoryForSimTargetOP ( void * ss , const char * key , void * * ptr , unsigned int sizeInBytes , void * ( * customOPSaveFcn ) ( void * dworkPtr , unsigned int * sizeInBytes ) , void ( * customOPRestoreFcn ) ( void * dworkPtr , const void * data , unsigned int sizeInBytes ) ) { ( void ) ss ; ( void ) key ; ( void ) ptr ; ( void ) sizeInBytes ; ( void ) customOPSaveFcn ; ( void ) customOPRestoreFcn ; }
#define MDL_PROCESS_PARAMETERS
#if defined(MATLAB_MEX_FILE)
static void mdlProcessParameters ( SimStruct * S ) {
struct_OSJpyIZcrpXqReVWwh9iuG * GlobalPrm_0 = ( struct_OSJpyIZcrpXqReVWwh9iuG
* ) NULL ; struct_hE1099BMemg5OfzqcWAA6G * GlobalPrm_1 = ( struct_hE1099BMemg5OfzqcWAA6G * ) NULL ; real_T * GlobalPrm_2 = ( real_T * ) NULL ; real_T * GlobalPrm_3 = ( real_T * ) NULL ; real_T * GlobalPrm_4 = ( real_T * ) NULL ; real_T * GlobalPrm_5 = ( real_T * ) NULL ; if ( ! ssGetModelRefGlobalParamData ( S , 0 , ( void * * ) ( & GlobalPrm_0 ) ) ) return ; if ( GlobalPrm_0 != NULL ) { ( void ) memcpy ( & ( rtP__Vehicle2f2uavPackageDeliveryDataDict_sldd_ ) , GlobalPrm_0 , sizeof ( struct_OSJpyIZcrpXqReVWwh9iuG ) ) ; } if ( ! ssGetModelRefGlobalParamData ( S , 1 , ( void * * ) ( & GlobalPrm_1 ) ) ) return ; if ( GlobalPrm_1 != NULL ) { ( void ) memcpy ( & ( rtP__initialConditions2f2uavPackageDeliveryDataDict_sldd_ ) , GlobalPrm_1 , sizeof ( struct_hE1099BMemg5OfzqcWAA6G ) ) ; } if ( ! ssGetModelRefGlobalParamData ( S , 2 , ( void * * ) ( & GlobalPrm_2 ) ) ) return ; if ( GlobalPrm_2 != NULL ) { ( void ) memcpy ( & ( rtP__uavIC_latLon2f2uavPackageDeliveryDataDict_sldd_ [ 0 ] ) , GlobalPrm_2 , sizeof ( real_T ) * 2 ) ; } if ( ! ssGetModelRefGlobalParamData ( S , 3 , ( void * * ) ( & GlobalPrm_3 ) ) ) return ; if ( GlobalPrm_3 != NULL ) { ( void ) memcpy ( & ( rtP_mass_param ) , GlobalPrm_3 , sizeof ( real_T ) ) ; } if ( ! ssGetModelRefGlobalParamData ( S , 4 , ( void * * ) ( & GlobalPrm_4 ) ) ) return ; if ( GlobalPrm_4 != NULL ) { ( void ) memcpy ( & ( rtP_motor_delay_time ) , GlobalPrm_4 , sizeof ( real_T ) ) ; } if ( ! ssGetModelRefGlobalParamData ( S , 5 , ( void * * ) ( & GlobalPrm_5 ) ) ) return ; if ( GlobalPrm_5 != NULL ) { ( void ) memcpy ( & ( rtP_startFlightTime ) , GlobalPrm_5 , sizeof ( real_T ) ) ; } }
#endif
static void mdlInitializeConditions ( SimStruct * S ) { lacdxp2wo3g * dw = ( lacdxp2wo3g * ) ssGetDWork ( S , 0 ) ; uavPathManagerBus * o_o_B_54_2 = ( uavPathManagerBus * ) ssGetOutputPortSignal ( S , 1 ) ; dbyqsu3sbk * localX = ( dbyqsu3sbk * ) ssGetContStates ( S ) ; fodvfnvwzh ( o_o_B_54_2 , & ( dw -> rtb ) , & ( dw -> rtdw ) , localX ) ; ssSetPeriodicContState ( S , 0 , 0 , - 3.1415926535897931 , 3.1415926535897931 ) ; ssSetPeriodicContState ( S , 1 , 1 , - 3.1415926535897931 , 3.1415926535897931 ) ; ssSetPeriodicContState ( S , 2 , 2 , - 3.1415926535897931 , 3.1415926535897931 ) ; } static void mdlReset ( SimStruct * S ) { lacdxp2wo3g * dw = ( lacdxp2wo3g * ) ssGetDWork ( S , 0 ) ; dbyqsu3sbk * localX = ( dbyqsu3sbk * ) ssGetContStates ( S ) ; ovar5ql1uc ( & ( dw -> rtb ) , & ( dw -> rtdw ) , localX ) ; } static void mdlPeriodicOutputUpdate ( SimStruct * S , int_T tid ) { lacdxp2wo3g * dw = ( lacdxp2wo3g * ) ssGetDWork ( S , 0 ) ; uavPathManagerBus const * i_m552tnzcbg = ( uavPathManagerBus * ) ssGetInputPortSignal ( S , 1 ) ; uavStateBus * o_B_54_1 = ( uavStateBus * ) ssGetOutputPortSignal ( S , 0 ) ; uavPathManagerBus * o_o_B_54_2 = ( uavPathManagerBus * ) ssGetOutputPortSignal ( S , 1 ) ; dbyqsu3sbk * localX = ( dbyqsu3sbk * ) ssGetContStates ( S ) ; if ( tid == 0 ) { MultirotorModel ( & ( dw -> rtm ) , i_m552tnzcbg , o_B_54_1 , o_o_B_54_2 , & ( dw -> rtb ) , & ( dw -> rtdw ) , localX ) ; hnayfzj5xb ( & ( dw -> rtm ) , & ( dw -> rtb ) , & ( dw -> rtdw ) ) ; } } static void mdlInitializeSizes ( SimStruct * S ) { if ( ( S -> mdlInfo -> genericFcn != ( NULL ) ) && ( ! ( S -> mdlInfo -> genericFcn ) ( S , GEN_FCN_CHK_MODELREF_SFUN_HAS_MODEL_BLOCK , - 1 , ( NULL ) ) ) ) { return ; } ssSetNumSFcnParams ( S , 0 ) ; ssFxpSetU32BitRegionCompliant ( S , 1 ) ; if ( S -> mdlInfo -> genericFcn != ( NULL ) ) { _GenericFcn fcn = S -> mdlInfo -> genericFcn ; } ssSetRTWGeneratedSFcn ( S , 2 ) ; ssSetNumContStates ( S , 12 ) ; ssSetNumDiscStates ( S , 0 ) ; ssSetNumPeriodicContStates ( S , 3 ) ; slmrInitializeIOPortDataVectors ( S , 2 , 2 ) ; if ( ! ssSetNumInputPorts ( S , 2 ) ) return ; if ( ! ssSetInputPortVectorDimension ( S , 0 , 1 ) ) return ; ssSetInputPortDimensionsMode ( S , 0 , FIXED_DIMS_MODE ) ; ssSetInputPortFrameData ( S , 0 , FRAME_NO ) ; if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetInputPortDataType ( S , 0 , SS_SINGLE ) ; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetInputPortUnit ( S , 0 , unitIdReg ) ;
#endif
} ssSetInputPortDirectFeedThrough ( S , 0 , 0 ) ;
ssSetInputPortRequiredContiguous ( S , 0 , 1 ) ; ssSetInputPortOptimOpts ( S
, 0 , SS_NOT_REUSABLE_AND_LOCAL ) ; ssSetInputPortOverWritable ( S , 0 ,
false ) ; ssSetInputPortSampleTime ( S , 0 , 0.02 ) ;
ssSetInputPortOffsetTime ( S , 0 , 0.0 ) ; if ( !
ssSetInputPortVectorDimension ( S , 1 , 42 ) ) return ;
ssSetInputPortDimensionsMode ( S , 1 , FIXED_DIMS_MODE ) ;
ssSetInputPortFrameData ( S , 1 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
{ DTypeId dataTypeIdReg ; ssRegisterTypeFromNamedObject ( S ,
"uavPathManagerBus" , & dataTypeIdReg ) ; if ( dataTypeIdReg ==
INVALID_DTYPE_ID ) return ; ssSetInputPortDataType ( S , 1 , dataTypeIdReg )
; }
#endif
} if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetInputPortUnit ( S , 1 , unitIdReg ) ;
#endif
} ssSetInputPortDirectFeedThrough ( S , 1 , 1 ) ;
ssSetInputPortRequiredContiguous ( S , 1 , 1 ) ; ssSetInputPortOptimOpts ( S
, 1 , SS_NOT_REUSABLE_AND_LOCAL ) ; ssSetInputPortOverWritable ( S , 1 ,
false ) ; ssSetInputPortSampleTime ( S , 1 , 0.02 ) ;
ssSetInputPortOffsetTime ( S , 1 , 0.0 ) ; if ( ! ssSetNumOutputPorts ( S , 2
) ) return ; if ( ! ssSetOutputPortVectorDimension ( S , 0 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 0 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 0 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
{ DTypeId dataTypeIdReg ; ssRegisterTypeFromNamedObject ( S , "uavStateBus" ,
& dataTypeIdReg ) ; if ( dataTypeIdReg == INVALID_DTYPE_ID ) return ;
ssSetOutputPortDataType ( S , 0 , dataTypeIdReg ) ; }
#endif
} if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 0 , unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 0 , 0.0 ) ; ssSetOutputPortOffsetTime ( S ,
0 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 0 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 0 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 0 , false , false , false ) ;
ssSetOutputPortOptimOpts ( S , 0 , SS_NOT_REUSABLE_AND_GLOBAL ) ; if ( !
ssSetOutputPortVectorDimension ( S , 1 , 2 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 1 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 1 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
{ DTypeId dataTypeIdReg ; ssRegisterTypeFromNamedObject ( S ,
"uavPathManagerBus" , & dataTypeIdReg ) ; if ( dataTypeIdReg ==
INVALID_DTYPE_ID ) return ; ssSetOutputPortDataType ( S , 1 , dataTypeIdReg )
; }
#endif
} if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 1 , unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 1 , 0.005 ) ; ssSetOutputPortOffsetTime ( S
, 1 , 0.0 ) ; ssSetOutputPortDiscreteValuedOutput ( S , 1 , 0 ) ;
ssSetOutputPortOkToMerge ( S , 1 , SS_OK_TO_MERGE_CONDITIONAL ) ;
ssSetOutputPortICAttributes ( S , 1 , false , true , false ) ;
ssSetOutputPortOptimOpts ( S , 1 , SS_NOT_REUSABLE_AND_LOCAL ) ;
ssSetSimStateCompliance ( S , USE_CUSTOM_SIM_STATE ) ;
mr_MultirotorModel_RegisterSimStateChecksum ( S ) ; ssSetNumSampleTimes ( S ,
6 ) ; ssSetParameterTuningCompliance ( S , true ) ; ssSetNumRWork ( S , 0 ) ;
ssSetNumIWork ( S , 0 ) ; ssSetNumPWork ( S , 0 ) ; ssSetNumModes ( S , 0 ) ;
{ int_T zcsIdx = 0 ; zcsIdx = ssCreateAndAddZcSignalInfo ( S ) ;
ssSetZcSignalWidth ( S , zcsIdx , 1 ) ; ssSetZcSignalName ( S , zcsIdx ,
"AbsZc" ) ; ssSetZcSignalType ( S , zcsIdx , SL_ZCS_TYPE_CONT ) ;
ssSetZcSignalZcEventType ( S , zcsIdx , SL_ZCS_EVENT_ALL ) ;
ssSetZcSignalNeedsEventNotification ( S , zcsIdx , 0 ) ; zcsIdx =
ssCreateAndAddZcSignalInfo ( S ) ; ssSetZcSignalWidth ( S , zcsIdx , 1 ) ;
ssSetZcSignalName ( S , zcsIdx , "RelopInput" ) ; ssSetZcSignalType ( S ,
zcsIdx , SL_ZCS_TYPE_CONT ) ; ssSetZcSignalZcEventType ( S , zcsIdx ,
SL_ZCS_EVENT_ALL ) ; ssSetZcSignalNeedsEventNotification ( S , zcsIdx , 0 ) ;
zcsIdx = ssCreateAndAddZcSignalInfo ( S ) ; ssSetZcSignalWidth ( S , zcsIdx ,
1 ) ; ssSetZcSignalName ( S , zcsIdx , "AbsZc" ) ; ssSetZcSignalType ( S ,
zcsIdx , SL_ZCS_TYPE_CONT ) ; ssSetZcSignalZcEventType ( S , zcsIdx ,
SL_ZCS_EVENT_ALL ) ; ssSetZcSignalNeedsEventNotification ( S , zcsIdx , 0 ) ;
zcsIdx = ssCreateAndAddZcSignalInfo ( S ) ; ssSetZcSignalWidth ( S , zcsIdx ,
1 ) ; ssSetZcSignalName ( S , zcsIdx , "IfInput" ) ; ssSetZcSignalType ( S ,
zcsIdx , SL_ZCS_TYPE_CONT ) ; ssSetZcSignalZcEventType ( S , zcsIdx ,
SL_ZCS_EVENT_ALL ) ; ssSetZcSignalNeedsEventNotification ( S , zcsIdx , 0 ) ;
zcsIdx = ssCreateAndAddZcSignalInfo ( S ) ; ssSetZcSignalWidth ( S , zcsIdx ,
1 ) ; ssSetZcSignalName ( S , zcsIdx , "AbsZc" ) ; ssSetZcSignalType ( S ,
zcsIdx , SL_ZCS_TYPE_CONT ) ; ssSetZcSignalZcEventType ( S , zcsIdx ,
SL_ZCS_EVENT_ALL ) ; ssSetZcSignalNeedsEventNotification ( S , zcsIdx , 0 ) ;
zcsIdx = ssCreateAndAddZcSignalInfo ( S ) ; ssSetZcSignalWidth ( S , zcsIdx ,
1 ) ; ssSetZcSignalName ( S , zcsIdx , "RelopInput" ) ; ssSetZcSignalType ( S
, zcsIdx , SL_ZCS_TYPE_CONT ) ; ssSetZcSignalZcEventType ( S , zcsIdx ,
SL_ZCS_EVENT_ALL ) ; ssSetZcSignalNeedsEventNotification ( S , zcsIdx , 0 ) ;
zcsIdx = ssCreateAndAddZcSignalInfo ( S ) ; ssSetZcSignalWidth ( S , zcsIdx ,
1 ) ; ssSetZcSignalName ( S , zcsIdx , "AbsZc" ) ; ssSetZcSignalType ( S ,
zcsIdx , SL_ZCS_TYPE_CONT ) ; ssSetZcSignalZcEventType ( S , zcsIdx ,
SL_ZCS_EVENT_ALL ) ; ssSetZcSignalNeedsEventNotification ( S , zcsIdx , 0 ) ;
zcsIdx = ssCreateAndAddZcSignalInfo ( S ) ; ssSetZcSignalWidth ( S , zcsIdx ,
1 ) ; ssSetZcSignalName ( S , zcsIdx , "RelopInput" ) ; ssSetZcSignalType ( S
, zcsIdx , SL_ZCS_TYPE_CONT ) ; ssSetZcSignalZcEventType ( S , zcsIdx ,
SL_ZCS_EVENT_ALL ) ; ssSetZcSignalNeedsEventNotification ( S , zcsIdx , 0 ) ;
zcsIdx = ssCreateAndAddZcSignalInfo ( S ) ; ssSetZcSignalWidth ( S , zcsIdx ,
1 ) ; ssSetZcSignalName ( S , zcsIdx , "SwitchCond" ) ; ssSetZcSignalType ( S
, zcsIdx , SL_ZCS_TYPE_CONT ) ; ssSetZcSignalZcEventType ( S , zcsIdx ,
SL_ZCS_EVENT_ALL ) ; ssSetZcSignalNeedsEventNotification ( S , zcsIdx , 0 ) ;
zcsIdx = ssCreateAndAddZcSignalInfo ( S ) ; ssSetZcSignalWidth ( S , zcsIdx ,
1 ) ; ssSetZcSignalName ( S , zcsIdx , "SwitchCond" ) ; ssSetZcSignalType ( S
, zcsIdx , SL_ZCS_TYPE_CONT ) ; ssSetZcSignalZcEventType ( S , zcsIdx ,
SL_ZCS_EVENT_ALL ) ; ssSetZcSignalNeedsEventNotification ( S , zcsIdx , 0 ) ;
zcsIdx = ssCreateAndAddZcSignalInfo ( S ) ; ssSetZcSignalWidth ( S , zcsIdx ,
1 ) ; ssSetZcSignalName ( S , zcsIdx , "SwitchCond" ) ; ssSetZcSignalType ( S
, zcsIdx , SL_ZCS_TYPE_CONT ) ; ssSetZcSignalZcEventType ( S , zcsIdx ,
SL_ZCS_EVENT_ALL ) ; ssSetZcSignalNeedsEventNotification ( S , zcsIdx , 0 ) ;
zcsIdx = ssCreateAndAddZcSignalInfo ( S ) ; ssSetZcSignalWidth ( S , zcsIdx ,
1 ) ; ssSetZcSignalName ( S , zcsIdx , "SwitchCond" ) ; ssSetZcSignalType ( S
, zcsIdx , SL_ZCS_TYPE_CONT ) ; ssSetZcSignalZcEventType ( S , zcsIdx ,
SL_ZCS_EVENT_ALL ) ; ssSetZcSignalNeedsEventNotification ( S , zcsIdx , 0 ) ;
zcsIdx = ssCreateAndAddZcSignalInfo ( S ) ; ssSetZcSignalWidth ( S , zcsIdx ,
1 ) ; ssSetZcSignalName ( S , zcsIdx , "RelopInput" ) ; ssSetZcSignalType ( S
, zcsIdx , SL_ZCS_TYPE_CONT ) ; ssSetZcSignalZcEventType ( S , zcsIdx ,
SL_ZCS_EVENT_ALL ) ; ssSetZcSignalNeedsEventNotification ( S , zcsIdx , 0 ) ;
zcsIdx = ssCreateAndAddZcSignalInfo ( S ) ; ssSetZcSignalWidth ( S , zcsIdx ,
1 ) ; ssSetZcSignalName ( S , zcsIdx , "RelopInput" ) ; ssSetZcSignalType ( S
, zcsIdx , SL_ZCS_TYPE_CONT ) ; ssSetZcSignalZcEventType ( S , zcsIdx ,
SL_ZCS_EVENT_ALL ) ; ssSetZcSignalNeedsEventNotification ( S , zcsIdx , 0 ) ;
zcsIdx = ssCreateAndAddZcSignalInfo ( S ) ; ssSetZcSignalWidth ( S , zcsIdx ,
1 ) ; ssSetZcSignalName ( S , zcsIdx , "RelopInput" ) ; ssSetZcSignalType ( S
, zcsIdx , SL_ZCS_TYPE_CONT ) ; ssSetZcSignalZcEventType ( S , zcsIdx ,
SL_ZCS_EVENT_ALL ) ; ssSetZcSignalNeedsEventNotification ( S , zcsIdx , 0 ) ;
} ssSetZCCacheNeedsReset ( S , 1 ) ; ssSetOutputPortIsNonContinuous ( S , 0 ,
1 ) ; ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 0 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 1 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 1 , 0 ) ;
ssSetInputPortIsNotDerivPort ( S , 0 , 1 ) ; ssSetInputPortIsNotDerivPort ( S
, 1 , 1 ) ; ssSetModelReferenceSampleTimeInheritanceRule ( S ,
DISALLOW_SAMPLE_TIME_INHERITANCE ) ; ssSetAcceptsFcnCallInputs ( S ) ;
ssSetModelReferenceNormalModeSupport ( S ,
MDL_START_AND_MDL_PROCESS_PARAMS_OK ) ; ssSupportsMultipleExecInstances ( S ,
false ) ; ssRegisterMsgForNotSupportingMultiExecInst ( S ,
 "<diag_root><diag id=\"Simulink:blocks:BlockDoesNotSupportMultiExecInstances\" pr=\"d\"><arguments><arg type=\"encoded\">TQB1AGwAdABpAHIAbwB0AG8AcgBNAG8AZABlAGwALwBJAG4AbgBlAHIAIABMAG8AbwBwACAAYQBuAGQAIABQAGwAYQBuAHQAIABNAG8AZABlAGwALwBIAGkAZwBoAC0ARgBpAGQAZQBsAGkAdAB5AE0AbwBkAGUAbAAvAEUAbgB2AGkAcgBvAG4AbQBlAG4AdAAvAFcARwBTADgANAAgAEcAcgBhAHYAaQB0AHkAIABNAG8AZABlAGwAIAAgAAAA</arg><arg type=\"encoded\">PABfAF8AaQBpAFMAUwBfAF8APgA8AC8AXwBfAGkAaQBTAFMAXwBfAD4AAAA=</arg><arg type=\"encoded\">PABfAF8AaQB0AGUAcgBCAGwAawBfAF8APgA8AC8AXwBfAGkAdABlAHIAQgBsAGsAXwBfAD4AAAA=</arg></arguments><hs><h>AAAAcABWs0DI</h></hs></diag></diag_root>"
) ; ssHasStateInsideForEachSS ( S , false ) ; ssSetOptions ( S ,
SS_OPTION_ALLOW_CONSTANT_PORT_SAMPLE_TIME |
SS_OPTION_PORT_SAMPLE_TIMES_ASSIGNED | SS_OPTION_SUPPORTS_ALIAS_DATA_TYPES |
SS_OPTION_DISALLOW_CONSTANT_SAMPLE_TIME | SS_OPTION_EXCEPTION_FREE_CODE |
SS_OPTION_WORKS_WITH_CODE_REUSE ) ;
#if SS_SFCN_FOR_SIM
if ( S -> mdlInfo -> genericFcn != ( NULL ) && ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { int_T retVal = 1 ;
mr_MultirotorModel_MdlInfoRegFcn ( S , "MultirotorModel" , & retVal ) ; if ( !
retVal ) return ; }
#endif
#if SS_SFCN_FOR_SIM
if ( ssSetNumDWork ( S , 1 ) ) { int mdlrefDWTypeId ; ssRegMdlRefDWorkType ( S
, & mdlrefDWTypeId ) ; if ( mdlrefDWTypeId == INVALID_DTYPE_ID ) return ; if
( ! ssSetDataTypeSize ( S , mdlrefDWTypeId , sizeof ( lacdxp2wo3g ) ) )
return ; ssSetDWorkDataType ( S , 0 , mdlrefDWTypeId ) ; ssSetDWorkWidth ( S
, 0 , 1 ) ; }
#else
if ( ! ssSetNumDWork ( S , 1 ) ) { return ; }
#endif
slmrRegisterSystemInitializeMethod ( S , mdlInitializeConditions ) ;
slmrRegisterSystemResetMethod ( S , mdlReset ) ;
slmrRegisterPeriodicOutputUpdateMethod ( S , mdlPeriodicOutputUpdate ) ;
ssSetSimulinkVersionGeneratedIn ( S , "24.2" ) ; ssSetNeedAbsoluteTime ( S ,
1 ) ; } static void mdlInitializeSampleTimes ( SimStruct * S ) {
ssSetSampleTime ( S , 0 , 0 ) ; ssSetOffsetTime ( S , 0 , 0 ) ;
ssSetSampleTime ( S , 1 , 0 ) ; ssSetOffsetTime ( S , 1 , 1 ) ;
ssSetSampleTime ( S , 2 , 0.005 ) ; ssSetOffsetTime ( S , 2 , 0 ) ;
ssSetSampleTime ( S , 3 , 0.02 ) ; ssSetOffsetTime ( S , 3 , 0 ) ;
ssSetSampleTime ( S , 4 , 0.1 ) ; ssSetOffsetTime ( S , 4 , 0 ) ;
ssSetSampleTime ( S , 5 , mxGetInf ( ) ) ; ssSetOffsetTime ( S , 5 , 0 ) ;
return ; }
#define MDL_SET_WORK_WIDTHS
static void mdlSetWorkWidths ( SimStruct * S ) { if ( S -> mdlInfo ->
genericFcn != ( NULL ) ) { _GenericFcn fcn = S -> mdlInfo -> genericFcn ;
ssSetSignalSizesComputeType ( S , SS_VARIABLE_SIZE_FROM_INPUT_VALUE_AND_SIZE
) ; } { static const char * toFileNames [ ] = { "" } ; static const char *
fromFileNames [ ] = { "" } ; if ( ! ssSetModelRefFromFiles ( S , 0 ,
fromFileNames ) ) return ; if ( ! ssSetModelRefToFiles ( S , 0 , toFileNames
) ) return ; } }
#define MDL_SETUP_RUNTIME_RESOURCES
static void mdlSetupRuntimeResources ( SimStruct * S ) { lacdxp2wo3g * dw = ( lacdxp2wo3g * ) ssGetDWork ( S , 0 ) ; dbyqsu3sbk * localX = ( dbyqsu3sbk * ) ssGetContStates ( S ) ; ssNonContDerivSigFeedingOutports mr_nonContOutput0 [ 6 ] ; ssNonContDerivSigFeedingOutports * mr_nonContOutputArray [ 2 ] ; void * sysRanPtr = ( NULL ) ; int sysTid = 0 ; ssGetContextSysRanBCPtr ( S , & sysRanPtr ) ; ssGetContextSysTid ( S , & sysTid ) ; if ( sysTid == CONSTANT_TID ) { sysTid = 0 ; } mr_nonContOutputArray [ 0 ] = mr_nonContOutput0 ; mr_nonContOutputArray [ 1 ] = ( NULL ) ; aejlhnfdgm ( S , mr_nonContOutputArray , slmrGetTopTidFromMdlRefChildTid ( S , 0 , false ) , slmrGetTopTidFromMdlRefChildTid ( S , 1 , false ) , slmrGetTopTidFromMdlRefChildTid ( S , 2 , false ) , slmrGetTopTidFromMdlRefChildTid ( S , 3 , false ) , slmrGetTopTidFromMdlRefChildTid ( S , 4 , false ) , slmrGetTopTidFromMdlRefChildTid ( S , 5 , true ) , & ( dw -> rtm ) , & ( dw -> rtb ) , & ( dw -> rtdw ) , localX , sysRanPtr , sysTid , ( ( NULL ) ) , ( ( NULL ) ) , 0 , - 1 ) ; ssSetModelMappingInfoPtr ( S , & ( dw -> rtm . DataMapInfo . mmi ) ) ; if ( S -> mdlInfo -> genericFcn != ( NULL ) ) { _GenericFcn fcn = S -> mdlInfo -> genericFcn ; if ( ! ( fcn ) ( S , GEN_FCN_REG_MODELREF_NONCONTSIGS , 0 , mr_nonContOutput0 ) ) return ; } }
#define MDL_START
static void mdlStart ( SimStruct * S ) { lacdxp2wo3g * dw = ( lacdxp2wo3g * )
ssGetDWork ( S , 0 ) ; mdlProcessParameters ( S ) ; kc0svyewlp ( & ( dw ->
rtm ) , & ( dw -> rtb ) , & ( dw -> rtdw ) ) ; }
#define RTW_GENERATED_DISABLE
static void mdlDisable ( SimStruct * S ) { lacdxp2wo3g * dw = ( lacdxp2wo3g *
) ssGetDWork ( S , 0 ) ; kt1xdc3hp0 ( & ( dw -> rtm ) , & ( dw -> rtb ) , & ( dw
-> rtdw ) ) ; return ; } static void mdlOutputs ( SimStruct * S , int_T tid )
{ lacdxp2wo3g * dw = ( lacdxp2wo3g * ) ssGetDWork ( S , 0 ) ;
uavPathManagerBus const * i_m552tnzcbg = ( uavPathManagerBus * )
ssGetInputPortSignal ( S , 1 ) ; uavStateBus * o_B_54_1 = ( uavStateBus * )
ssGetOutputPortSignal ( S , 0 ) ; uavPathManagerBus * o_o_B_54_2 = ( uavPathManagerBus * ) ssGetOutputPortSignal ( S , 1 ) ; dbyqsu3sbk * localX = ( dbyqsu3sbk * ) ssGetContStates ( S ) ; if ( tid == PARAMETER_TUNING_TID ) { MultirotorModelTID5 ( & ( dw -> rtm ) , & ( dw -> rtb ) , & ( dw -> rtdw ) ) ; } if ( tid != CONSTANT_TID && tid != PARAMETER_TUNING_TID ) { if ( ssIsSampleHit ( S , 0 , tid ) || ssIsMinorTimeStep ( S ) ) { MultirotorModel ( & ( dw -> rtm ) , i_m552tnzcbg , o_B_54_1 , o_o_B_54_2 , & ( dw -> rtb ) , & ( dw -> rtdw ) , localX ) ; } } }
#define MDL_UPDATE
static void mdlUpdate ( SimStruct * S , int_T tid ) { lacdxp2wo3g * dw = ( lacdxp2wo3g * ) ssGetDWork ( S , 0 ) ; hnayfzj5xb ( & ( dw -> rtm ) , & ( dw -> rtb ) , & ( dw -> rtdw ) ) ; return ; }
#define MDL_ZERO_CROSSINGS
static void mdlZeroCrossings ( SimStruct * S ) { lacdxp2wo3g * dw = ( lacdxp2wo3g * ) ssGetDWork ( S , 0 ) ; guifzd0yex * localZCSV = ( guifzd0yex * ) ssGetNonsampledZCs ( S ) ; hplavxsbbo ( & ( dw -> rtb ) , localZCSV ) ; }
#define MDL_DERIVATIVES
static void mdlDerivatives ( SimStruct * S ) { lacdxp2wo3g * dw = ( lacdxp2wo3g
* ) ssGetDWork ( S , 0 ) ; pzcew1lt2d * localXdot = ( pzcew1lt2d * ) ssGetdX
( S ) ; fmhobljpby ( & ( dw -> rtb ) , localXdot ) ; } static void
mdlTerminate ( SimStruct * S ) { lacdxp2wo3g * dw = ( lacdxp2wo3g * )
ssGetDWork ( S , 0 ) ; aw1j1mqjpo ( & ( dw -> rtm ) ) ; return ; }
#define MDL_CLEANUP_RUNTIME_RESOURCES
static void mdlCleanupRuntimeResources ( SimStruct * S ) { }
#if !defined(MDL_SIM_STATE)
#define MDL_SIM_STATE
#endif
static mxArray * mdlGetSimState ( SimStruct * S ) { static const char *
simStateFieldNames [ 6 ] = { "localX" , "mdlrefDW" , "disallowedStateData" ,
"tNext" , "tNextTid" , "nonContDerivSigInfoPrevVal" , } ; mxArray * ss =
mxCreateStructMatrix ( 1 , 1 , 6 , simStateFieldNames ) ; { const dbyqsu3sbk
* localX = ( const dbyqsu3sbk * ) ssGetContStates ( S ) ; const size_t
numBytes = sizeof ( dbyqsu3sbk ) ; mxArray * storedX = mxCreateNumericMatrix
( 1 , numBytes , mxUINT8_CLASS , mxREAL ) ; UINT8_T * rawData = ( UINT8_T * )
mxGetData ( storedX ) ; memcpy ( & rawData [ 0 ] , localX , numBytes ) ;
mxSetFieldByNumber ( ss , 0 , 0 , storedX ) ; } { mxArray * mdlrefDW =
mr_MultirotorModel_GetDWork ( ssGetDWork ( S , 0 ) ) ; mxSetFieldByNumber ( ss
, 0 , 1 , mdlrefDW ) ; } { mxArray * data =
mr_MultirotorModel_GetSimStateDisallowedBlocks ( ) ; mxSetFieldByNumber ( ss
, 0 , 2 , data ) ; } ; mxSetFieldByNumber ( ss , 0 , 3 , mxCreateDoubleScalar
( ( double ) ssGetTNext ( S ) ) ) ; mxSetFieldByNumber ( ss , 0 , 4 ,
mxCreateDoubleScalar ( ( double ) ssGetTNextTid ( S ) ) ) ; { lacdxp2wo3g *
dw = ( lacdxp2wo3g * ) ssGetDWork ( S , 0 ) ; hv4jthdiag * rtm = & ( dw ->
rtm ) ; mxArray * nonContDerivSigInfo = mxCreateCellMatrix ( 21 , 1 ) ; for ( int i = 0 ; i < 21 ; ++ i ) { mxArray * prevValmxArray = mxCreateNumericMatrix ( 1 , rtm -> nonContDerivSignal [ i ] . sizeInBytes , mxUINT8_CLASS , mxREAL ) ; memcpy ( ( uint8_T * ) mxGetData ( prevValmxArray ) , ( const uint8_T * ) rtm -> nonContDerivSignal [ i ] . pPrevVal , rtm -> nonContDerivSignal [ i ] . sizeInBytes ) ; mxSetCell ( nonContDerivSigInfo , i , prevValmxArray ) ; } mxSetFieldByNumber ( ss , 0 , 5 , nonContDerivSigInfo ) ; } return ss ; }
#if !defined(MDL_SIM_STATE)
#define MDL_SIM_STATE
#endif
static void mdlSetSimState ( SimStruct * S , const mxArray * ss ) { {
dbyqsu3sbk * localX = ( dbyqsu3sbk * ) ssGetContStates ( S ) ; const size_t
numBytes = sizeof ( dbyqsu3sbk ) ; const mxArray * storedX =
mxGetFieldByNumber ( ss , 0 , 0 ) ; const UINT8_T * rawData = ( const UINT8_T
* ) mxGetData ( storedX ) ; memcpy ( localX , & rawData [ 0 ] , numBytes ) ;
} mr_MultirotorModel_SetDWork ( ssGetDWork ( S , 0 ) , mxGetFieldByNumber ( ss
, 0 , 1 ) ) ; ssSetTNext ( S , ( time_T ) mxGetScalar ( mxGetFieldByNumber ( ss
, 0 , 3 ) ) ) ; ssSetTNextTid ( S , ( int_T ) mxGetScalar ( mxGetFieldByNumber
( ss , 0 , 4 ) ) ) ; { mxArray * nonContDerivSigInfo = mxGetFieldByNumber ( ss
, 0 , 5 ) ; lacdxp2wo3g * dw = ( lacdxp2wo3g * ) ssGetDWork ( S , 0 ) ;
hv4jthdiag * rtm = & ( dw -> rtm ) ; for ( int i = 0 ; i < 21 ; ++ i ) {
mxArray * prevValmxArray = mxGetCell ( nonContDerivSigInfo , i ) ; ( void )
memcpy ( rtm -> nonContDerivSignal [ i ] . pPrevVal , ( char * ) mxGetData ( prevValmxArray ) , rtm -> nonContDerivSignal [ i ] . sizeInBytes ) ; } } }
#ifdef MATLAB_MEX_FILE 
#include "simulink.c"
#include "fixedpoint.c"
#else
#error Assertion failed: file must be compiled as a MEX-file
#endif
