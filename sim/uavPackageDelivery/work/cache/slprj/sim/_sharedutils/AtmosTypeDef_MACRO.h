#ifndef ATMOS_TYPEDEF

typedef enum { COESA = 1, MILHDBK310, MILSTD210C } AtmosTypeIdx;

typedef enum { PROFILE = 1, ENVELOPE } ModelIdx;

typedef enum { HIGHTEMP = 1, LOWTEMP, HIGHDENSITY,
  LOWDENSITY, HIGHPRESSURE, LOWPRESSURE } VarIdx;

typedef enum { PP1 = 1, PP10 } PPercentIdx;

typedef enum { K5 = 1, K10, K20, K30, K40 } PAltIdx;

typedef enum { EXTREME = 1, P1, P5, P10, P20 } EPercentIdx;

#define ATMOS_TYPEDEF
#endif
