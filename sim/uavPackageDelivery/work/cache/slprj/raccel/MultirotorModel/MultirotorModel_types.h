#ifndef MultirotorModel_types_h_
#define MultirotorModel_types_h_
#include "rtwtypes.h"
#ifndef DEFINED_TYPEDEF_FOR_innerLoopCmdsBus_
#define DEFINED_TYPEDEF_FOR_innerLoopCmdsBus_
typedef struct { real32_T LAP [ 3 ] ; real32_T HeadingCmd ; real32_T YawCmd ;
uint8_T sl_padding0 [ 4 ] ; } innerLoopCmdsBus ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_local_position_ned_
#define DEFINED_TYPEDEF_FOR_local_position_ned_
typedef struct { uint32_T time_boot_ms ; real32_T x ; real32_T y ; real32_T z
; real32_T vx ; real32_T vy ; real32_T vz ; uint8_T sl_padding0 [ 4 ] ; }
local_position_ned ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_attitudeBus_
#define DEFINED_TYPEDEF_FOR_attitudeBus_
typedef struct { uint32_T time_boot_ms ; real32_T roll ; real32_T pitch ;
real32_T yaw ; real32_T rollspeed_p ; real32_T pitchspeed_q ; real32_T
yawspeed_r ; uint8_T sl_padding0 [ 4 ] ; } attitudeBus ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_gps_raw_int_
#define DEFINED_TYPEDEF_FOR_gps_raw_int_
typedef struct { uint32_T time_usec ; uint8_T fix_type ; uint8_T sl_padding0
[ 3 ] ; int32_T lat ; int32_T lon ; int32_T alt ; uint16_T eph ; uint16_T epv
; uint16_T vel ; uint16_T cog ; uint8_T sl_padding1 [ 4 ] ; } gps_raw_int ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_uavStateBus_
#define DEFINED_TYPEDEF_FOR_uavStateBus_
typedef struct { local_position_ned pos_vel ; attitudeBus attitude ;
gps_raw_int gps ; } uavStateBus ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_AtmosphereBus_
#define DEFINED_TYPEDEF_FOR_AtmosphereBus_
typedef struct { real_T air_temp ; real_T speed_sound ; real_T pressure ;
real_T air_density ; } AtmosphereBus ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_EnvironmentBus_
#define DEFINED_TYPEDEF_FOR_EnvironmentBus_
typedef struct { real_T Gravity_ned [ 3 ] ; AtmosphereBus AtmosphereBus ;
real_T MagneticField_ned [ 3 ] ; } EnvironmentBus ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_uavPathManagerBus_
#define DEFINED_TYPEDEF_FOR_uavPathManagerBus_
typedef struct { uint8_T mode ; uint8_T sl_padding0 [ 3 ] ; real32_T position
[ 3 ] ; real32_T params [ 4 ] ; } uavPathManagerBus ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_GdncModeType_
#define DEFINED_TYPEDEF_FOR_GdncModeType_
typedef enum { GdncModeType_None = 0 , GdncModeType_OnGround ,
GdncModeType_Takeoff , GdncModeType_WP , GdncModeType_Orbit ,
GdncModeType_ToLand , GdncModeType_Descend } GdncModeType ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_hE1099BMemg5OfzqcWAA6G_
#define DEFINED_TYPEDEF_FOR_struct_hE1099BMemg5OfzqcWAA6G_
typedef struct { real_T date [ 6 ] ; real_T posLLA [ 3 ] ; real_T posNED [ 3
] ; real_T vb [ 3 ] ; real_T euler [ 3 ] ; real_T angRates [ 3 ] ; }
struct_hE1099BMemg5OfzqcWAA6G ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_XRMsui9C07VjBvdq1msujB_
#define DEFINED_TYPEDEF_FOR_struct_XRMsui9C07VjBvdq1msujB_
typedef struct { real_T initGreenwich ; real_T quatGain ; }
struct_XRMsui9C07VjBvdq1msujB ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_hxsmtt0xTZOLDNa2Rz7GAF_
#define DEFINED_TYPEDEF_FOR_struct_hxsmtt0xTZOLDNa2Rz7GAF_
typedef struct { real_T xAxis ; } struct_hxsmtt0xTZOLDNa2Rz7GAF ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_IZWOW0zYvpphl7qLgSfN7E_
#define DEFINED_TYPEDEF_FOR_struct_IZWOW0zYvpphl7qLgSfN7E_
typedef struct { real_T href ; struct_hxsmtt0xTZOLDNa2Rz7GAF FlatEarthToLLA ;
} struct_IZWOW0zYvpphl7qLgSfN7E ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_q6UUpnZ4gTjFvULFx6Rxa_
#define DEFINED_TYPEDEF_FOR_struct_q6UUpnZ4gTjFvULFx6Rxa_
typedef struct { real_T mass ; real_T inertia [ 9 ] ; real_T d ; real_T xy ;
real_T h ; real_T Cdx ; real_T Cdy ; real_T diameter ; }
struct_q6UUpnZ4gTjFvULFx6Rxa ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_OMRgDnJcZuQneKEj9vdTyD_
#define DEFINED_TYPEDEF_FOR_struct_OMRgDnJcZuQneKEj9vdTyD_
typedef struct { real_T blades ; real_T radius ; real_T chord ; real_T
flappingOffset ; real_T bladeMass ; real_T bladeInertia ; real_T hubMass ;
real_T hubInertia ; real_T inertia ; real_T Ct ; real_T Cq ; real_T solidity
; real_T theta0 ; real_T thetaTip ; real_T theta1 ; real_T theta34 ; real_T a
; real_T area ; real_T lock ; real_T b ; real_T k ; real_T w2ToThrustGain ; }
struct_OMRgDnJcZuQneKEj9vdTyD ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_p3FXZIgqtjF2uqDpmYjb6C_
#define DEFINED_TYPEDEF_FOR_struct_p3FXZIgqtjF2uqDpmYjb6C_
typedef struct { real_T maxLimit ; real_T minLimit ; real_T commandToW2Gain ;
real_T thrustToMotorCommand ; } struct_p3FXZIgqtjF2uqDpmYjb6C ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_OSJpyIZcrpXqReVWwh9iuG_
#define DEFINED_TYPEDEF_FOR_struct_OSJpyIZcrpXqReVWwh9iuG_
typedef struct { struct_XRMsui9C07VjBvdq1msujB SixDOF ;
struct_IZWOW0zYvpphl7qLgSfN7E PositionOnEarth ; struct_q6UUpnZ4gTjFvULFx6Rxa
Airframe ; struct_OMRgDnJcZuQneKEj9vdTyD Rotor ;
struct_p3FXZIgqtjF2uqDpmYjb6C Motor ; } struct_OSJpyIZcrpXqReVWwh9iuG ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_eAf0NJvzCY9HYTXF7bLNgB_
#define DEFINED_TYPEDEF_FOR_struct_eAf0NJvzCY9HYTXF7bLNgB_
typedef struct { real_T Ts2Q [ 16 ] ; real_T Q2Ts [ 16 ] ; real_T takeoffGain
; real_T totalThrustMaxRelative ; real_T motorsThrustPerMotorMax ; }
struct_eAf0NJvzCY9HYTXF7bLNgB ;
#endif
#ifndef struct_tag_BlgwLpgj2bjudmbmVKWwDE
#define struct_tag_BlgwLpgj2bjudmbmVKWwDE
struct tag_BlgwLpgj2bjudmbmVKWwDE { uint32_T f1 [ 8 ] ; } ;
#endif
#ifndef typedef_k4apvruus2
#define typedef_k4apvruus2
typedef struct tag_BlgwLpgj2bjudmbmVKWwDE k4apvruus2 ;
#endif
#ifndef struct_tag_UDXkglVeIfbfM1Did3vPvC
#define struct_tag_UDXkglVeIfbfM1Did3vPvC
struct tag_UDXkglVeIfbfM1Did3vPvC { int32_T isInitialized ; k4apvruus2
inputVarSize [ 3 ] ; real32_T LookaheadDistance ; real_T WaypointIndex ;
real32_T InitYaw ; real32_T FinalYaw ; real_T NumWaypoints ; real32_T
WaypointsInternal [ 8 ] ; boolean_T LastWaypointFlag ; boolean_T StartFlag ;
real32_T InitialPose [ 4 ] ; real_T LookaheadFactor ; boolean_T SearchFlag ;
uint8_T LookaheadDistFlag ; } ;
#endif
#ifndef typedef_jair554vtb
#define typedef_jair554vtb
typedef struct tag_UDXkglVeIfbfM1Did3vPvC jair554vtb ;
#endif
#ifndef struct_tag_9PVbRffVGISrK7bqTZ7GxG
#define struct_tag_9PVbRffVGISrK7bqTZ7GxG
struct tag_9PVbRffVGISrK7bqTZ7GxG { int32_T isInitialized ; real_T NumCircles
; real32_T PrevPosition [ 3 ] ; boolean_T StartFlag ; real32_T
LookaheadDistance ; boolean_T SelectTurnDirectionFlag ; real_T
TurnDirectionInternal ; real32_T OrbitCenterInternal [ 3 ] ; real32_T
OrbitRadiusInternal ; uint8_T OrbitRadiusFlag ; uint8_T LookaheadDistFlag ;
real32_T PrevResetSignal ; } ;
#endif
#ifndef typedef_k420dbwipx
#define typedef_k420dbwipx
typedef struct tag_9PVbRffVGISrK7bqTZ7GxG k420dbwipx ;
#endif
#ifndef struct_tag_w4tojZfPSThQFKwJE3XCWB
#define struct_tag_w4tojZfPSThQFKwJE3XCWB
struct tag_w4tojZfPSThQFKwJE3XCWB { uint32_T Seed ; uint32_T State [ 625 ] ;
} ;
#endif
#ifndef typedef_jil0sqh3x1
#define typedef_jil0sqh3x1
typedef struct tag_w4tojZfPSThQFKwJE3XCWB jil0sqh3x1 ;
#endif
#ifndef struct_tag_FCo0ba8bmQSLTT1WsDbgbF
#define struct_tag_FCo0ba8bmQSLTT1WsDbgbF
struct tag_FCo0ba8bmQSLTT1WsDbgbF { int32_T isInitialized ; real_T
MissionPointCounter ; uavPathManagerBus MissionParams [ 2 ] ;
uavPathManagerBus PrevMissionPoint ; boolean_T MissionStart ; boolean_T
PrevModeStatus ; boolean_T PoseHoldFlag ; boolean_T PoseRTLFlag ; real32_T
HoldPose [ 4 ] ; boolean_T EnableRepeat ; boolean_T FinalMissionPoint ; } ;
#endif
#ifndef typedef_mbqtt1uxdw
#define typedef_mbqtt1uxdw
typedef struct tag_FCo0ba8bmQSLTT1WsDbgbF mbqtt1uxdw ;
#endif
#ifndef typedef_p1mvpwhrm5
#define typedef_p1mvpwhrm5
typedef int32_T p1mvpwhrm5 ;
#endif
#ifndef coder_internal_RngNt_constants
#define coder_internal_RngNt_constants
#define coder_internal_RngNt_ziggurat (0)
#define coder_internal_RngNt_polar (1)
#define coder_internal_RngNt_inversion (2)
#endif
#ifndef struct_tag_16QXCsbiPKMq6pb9EnUeR
#define struct_tag_16QXCsbiPKMq6pb9EnUeR
struct tag_16QXCsbiPKMq6pb9EnUeR { p1mvpwhrm5 NtMethod ; real_T
SavedPolarValue ; boolean_T HaveSavedPolarValue ; jil0sqh3x1 * Generator ;
jil0sqh3x1 MtGenerator ; } ;
#endif
#ifndef typedef_adiya5mght
#define typedef_adiya5mght
typedef struct tag_16QXCsbiPKMq6pb9EnUeR adiya5mght ;
#endif
#ifndef struct_tag_gYLRTfxVpvf5oNsKqQWXJE
#define struct_tag_gYLRTfxVpvf5oNsKqQWXJE
struct tag_gYLRTfxVpvf5oNsKqQWXJE { int32_T isInitialized ; real_T
RollAccuracy ; real_T PitchAccuracy ; real_T YawAccuracy ; real_T
PositionAccuracy [ 3 ] ; real_T VelocityAccuracy ; adiya5mght * pStream ;
adiya5mght _pobj0 ; } ;
#endif
#ifndef typedef_orfegcv4kn
#define typedef_orfegcv4kn
typedef struct tag_gYLRTfxVpvf5oNsKqQWXJE orfegcv4kn ;
#endif
#ifndef SS_UINT64
#define SS_UINT64 42
#endif
#ifndef SS_INT64
#define SS_INT64 43
#endif
typedef struct iioiwscc1l_ iioiwscc1l ; typedef struct l2pgyi01zx_ l2pgyi01zx
; typedef struct d23d4trzhm_ d23d4trzhm ; typedef struct P_ P ;
#endif
