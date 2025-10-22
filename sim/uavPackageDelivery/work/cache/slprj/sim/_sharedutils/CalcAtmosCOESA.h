#ifndef CalcAtmosCOESA_h_
#define CalcAtmosCOESA_h_
#include "rtwtypes.h"
#include "multiword_types.h"

void CalcAtmosCOESA(const real_T *altitude, real_T *temp, real_T *pressure,
                    real_T *density, real_T *speedofsound, real_T *temperature76,
                    real_T *pressureRatio76, int_T numPoints);

#endif
