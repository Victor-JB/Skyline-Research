#include "CalcAtmosCOESA.h"
#include "COESA76DATA_MACRO.h"
#include "COESAATMOS_MACRO.h"
#include "mwmathutil.h"
#include "rtwtypes.h"

void CalcAtmosCOESA(const real_T *altitude, real_T *temp, real_T *pressure,
                    real_T *density, real_T *speedofsound, real_T *temperature76,
                    real_T *pressureRatio76, int_T numPoints)
{
  int_T i;
  for (i=0; i < numPoints; i++) {
    int_T bottom = 0;
    int_T top = NUM1976PTS-1;
    int_T idx;
    if (altitude[i] <= altitude76[bottom]) {
      idx = bottom;
    } else if (altitude[i] >= altitude76[top]) {
      idx = NUM1976PTS-2;
    } else {
      for (;;) {
        idx = (bottom + top)/2;
        if (altitude[i] < altitude76[idx]) {
          top = idx - 1;
        } else if (altitude[i] >= altitude76[idx+1]) {
          bottom = idx + 1;
        } else {
          break;
        }
      }
    }

    if (tempGradient76[idx] != 0.0 ) {
      temp[i] = temperature76[idx] +
        tempGradient76[idx] * (altitude[i] - altitude76[idx]);
      pressure[i] = PRESSURE0 * pressureRatio76[idx] *
        muDoubleScalarPower(temperature76[idx]/temp[i], GMR/tempGradient76[idx]);
    } else {
      temp[i] = temperature76[idx];
      pressure[i] = PRESSURE0 * pressureRatio76[idx] *
        muDoubleScalarExp((-GMR)*(altitude[i] - altitude76[idx]) /
                          temperature76[idx]);
    }

    density[i] = pressure[i] / ((R_HAT/MOL_WT)*temp[i]);
    speedofsound[i] = muDoubleScalarSqrt(GAMMA*temp[i]*(R_HAT/MOL_WT));
  }
}
