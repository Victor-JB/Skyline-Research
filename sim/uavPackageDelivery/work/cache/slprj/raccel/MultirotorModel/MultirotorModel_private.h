#ifndef MultirotorModel_private_h_
#define MultirotorModel_private_h_
#include "rtwtypes.h"
#include "builtin_typeid_types.h"
#include "multiword_types.h"
#include <stddef.h>
#include <float.h>
#include "mwmathutil.h"
#include "MultirotorModel.h"
#include "MultirotorModel_types.h"
#if !defined(rt_VALIDATE_MEMORY)
#define rt_VALIDATE_MEMORY(S, ptr)     if(!(ptr)) {\
    ssSetErrorStatus(rtS, RT_MEMORY_ALLOCATION_ERROR);\
    }
#endif
#if !defined(rt_FREE)
#if !defined(_WIN32)
#define rt_FREE(ptr)     if((ptr) != (NULL)) {\
    free((ptr));\
    (ptr) = (NULL);\
    }
#else
#define rt_FREE(ptr)     if((ptr) != (NULL)) {\
    free((void *)(ptr));\
    (ptr) = (NULL);\
    }
#endif
#endif
#ifndef rtInterpolate
#define rtInterpolate(v1,v2,f1,f2)     (((v1)==(v2))?((double)(v1)):    (((f1)*((double)(v1)))+((f2)*((double)(v2)))))
#endif
#ifndef rtRound
#define rtRound(v) ( ((v) >= 0) ?     muDoubleScalarFloor((v) + 0.5) :     muDoubleScalarCeil((v) - 0.5) )
#endif
#ifndef UCHAR_MAX
#include <limits.h>
#endif
#if ( UCHAR_MAX != (0xFFU) ) || ( SCHAR_MAX != (0x7F) )
#error Code was generated for compiler with different sized uchar/char. \Consider adjusting Test hardware word size settings on the \Hardware Implementation pane to match your compiler word sizes as \defined in limits.h of the compiler. Alternatively, you can \select the Test hardware is the same as production hardware option and \select the Enable portable word sizes option on the Code Generation > \Verification pane for ERT based targets, which will disable the \preprocessor word size checks.
#endif
#if ( USHRT_MAX != (0xFFFFU) ) || ( SHRT_MAX != (0x7FFF) )
#error Code was generated for compiler with different sized ushort/short. \Consider adjusting Test hardware word size settings on the \Hardware Implementation pane to match your compiler word sizes as \defined in limits.h of the compiler. Alternatively, you can \select the Test hardware is the same as production hardware option and \select the Enable portable word sizes option on the Code Generation > \Verification pane for ERT based targets, which will disable the \preprocessor word size checks.
#endif
#if ( UINT_MAX != (0xFFFFFFFFU) ) || ( INT_MAX != (0x7FFFFFFF) )
#error Code was generated for compiler with different sized uint/int. \Consider adjusting Test hardware word size settings on the \Hardware Implementation pane to match your compiler word sizes as \defined in limits.h of the compiler. Alternatively, you can \select the Test hardware is the same as production hardware option and \select the Enable portable word sizes option on the Code Generation > \Verification pane for ERT based targets, which will disable the \preprocessor word size checks.
#endif
#ifndef ATMOS_TYPEDEF
typedef enum { COESA = 1 , MILHDBK310 , MILSTD210C } AtmosTypeIdx ; typedef
enum { PROFILE = 1 , ENVELOPE } ModelIdx ; typedef enum { HIGHTEMP = 1 ,
LOWTEMP , HIGHDENSITY , LOWDENSITY , HIGHPRESSURE , LOWPRESSURE } VarIdx ;
typedef enum { PP1 = 1 , PP10 } PPercentIdx ; typedef enum { K5 = 1 , K10 ,
K20 , K30 , K40 } PAltIdx ; typedef enum { EXTREME = 1 , P1 , P5 , P10 , P20
} EPercentIdx ;
#define ATMOS_TYPEDEF
#endif
#ifndef ATMOS_DEFINE
#define PRESSURE0   101325.0     
#define TEMPERATURE0   288.15    
#define GRAV_CONST       9.80665 
#define MOL_WT          28.9644  
#define R_HAT         8314.32    
#define GAMMA            1.4     
#define GMR       ( GRAV_CONST * MOL_WT / R_HAT )
#define ATMOS_DEFINE
#endif
#ifndef COESA76_DEFINE_DATA
#define NUM1976PTS 8
static real_T altitude76 [ NUM1976PTS ] = { 0.0 , 11000.0 , 20000.0 , 32000.0
, 47000.0 , 51000.0 , 71000.0 , 84852.0 } ; static real_T tempGradient76 [
NUM1976PTS ] = { ( - 0.0065 ) , 0.0 , 0.0010 , 0.0028 , 0.0 , - 0.0028 , -
0.0020 , - 0.0020 } ;
#define COESA76_DEFINE_DATA
#endif
#ifndef __RTW_UTFREE__
extern void * utMalloc ( size_t ) ; extern void utFree ( void * ) ;
#endif
extern void rt_mrdivide_U1d1x3_U2d3x3_Yd1x3_snf ( const real_T u0 [ 3 ] ,
const real_T u1 [ 9 ] , real_T y [ 3 ] ) ; void * rt_TDelayCreateBuf ( int_T
numBuffer , int_T bufSz , int_T elemSz ) ; boolean_T
rt_TDelayUpdateTailOrGrowBuf ( int_T * bufSzPtr , int_T * tailPtr , int_T *
headPtr , int_T * lastPtr , real_T tMinusDelay , real_T * * uBufPtr ,
boolean_T isfixedbuf , boolean_T istransportdelay , int_T * maxNewBufSzPtr )
; real_T rt_TDelayInterpolate ( real_T tMinusDelay , real_T tStart , real_T *
uBuf , int_T bufSz , int_T * lastIdx , int_T oldestIdx , int_T newIdx ,
real_T initOutput , boolean_T discrete , boolean_T
minorStepAndTAtLastMajorOutput ) ; void rt_TDelayFreeBuf ( void * buf ) ;
void InitCalcAtmosCOESA ( real_T * temperature76 , real_T * pressureRatio76 )
; void CalcAtmosCOESA ( const real_T * altitude , real_T * temp , real_T *
pressure , real_T * density , real_T * speedofsound , real_T * temperature76
, real_T * pressureRatio76 , int_T numPoints ) ; extern void ll1kxu4ies ( ora3lzo1kq * localDW ) ; extern void jt3xhtgflx ( ora3lzo1kq * localDW ) ; extern void b0oafc4epa ( const real32_T beys5oavx4 [ 4 ] , const real32_T ckz3nfxnda [ 8 ] , real32_T fn3qlimls2 , gzpvk2dmzl * localB , ora3lzo1kq * localDW ) ; extern void a3nl0rpgxn ( fqudw5urz2 * localDW ) ; extern void dz4suezgf1 ( fqudw5urz2 * localDW ) ; extern void ldne0hy3e3 ( real32_T dkq00goks2 , iwnkvslm2k * localB , fqudw5urz2 * localDW ) ; extern void ikcxumow30 ( e13evn0iar * localB , jj0xlvag5r * localDW , iioiwscc1l * localP ) ; extern void muiewosgtl ( jj0xlvag5r * localDW , iioiwscc1l * localP ) ; extern void eofwln5wql ( SimStruct * rtS_m , jj0xlvag5r * localDW , iioiwscc1l * localP ) ; extern void nupk3hglqz ( jj0xlvag5r * localDW ) ; extern void c3ka4koyel ( SimStruct * rtS_b , e13evn0iar * localB , jj0xlvag5r * localDW , iioiwscc1l * localP ) ; extern void e0fma3ayau ( SimStruct * rtS_k , real_T friln02wrj , const innerLoopCmdsBus * fwdopyd3tz , real32_T i510kp3tfg , real32_T onhasdisqz , real32_T opm3avlpqs , real32_T nlgsprth0o , real32_T iolxxusfxs , real32_T nongy0oqm1 , real32_T apo0zocgpn , real32_T bpgdvptnw2 , real32_T i0r0wtqpvl , real32_T d2s4fccz4x , real32_T awdaxcblft , real32_T offn5kxcjx , e13evn0iar * localB , jj0xlvag5r * localDW , iioiwscc1l * localP ) ; extern void e0fma3ayauTID5 ( SimStruct * rtS_c , e13evn0iar * localB , jj0xlvag5r * localDW , iioiwscc1l * localP ) ; extern void neu5t01wuf ( n0i54lkvw5 * localB ) ; extern void nnlkeiqidh ( n0i54lkvw5 * localB , f4m2uufdao * localZCSV ) ; extern void cdz0vwtzpd ( SimStruct * rtS_d , const real_T coweoyweja [ 3 ] , const real_T msmbn3wm5g [ 3 ] , real_T p3wgimw1ng , real32_T p3v42vegf5 , const real_T bhzdwkhcdi [ 3 ] , n0i54lkvw5 * localB , cuhcxx0ncj * localDW , l2pgyi01zx * localP ) ; extern void klvpzbewxi ( SimStruct * rtS_d ) ; extern void dbmfexlmy1 ( SimStruct * rtS_l ) ; extern void jk40hfhipq ( real_T of1u4nxexl , real_T jpwj52cmkz , real_T * fytb0xrfjb ) ; extern void lpkknfdr5g ( void ) ; extern void awyavb0d5m ( void ) ; extern void a2xgkst3yb ( int32_T nkfucjbzf1 ) ; extern void dpsztx441z ( jj0xlvag5r * localDW ) ;
#if defined(MULTITASKING)
#error Models using the variable step solvers cannot define MULTITASKING
#endif
#endif
