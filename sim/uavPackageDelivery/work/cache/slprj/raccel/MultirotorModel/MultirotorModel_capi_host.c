#include "MultirotorModel_capi_host.h"
static MultirotorModel_host_DataMapInfo_T root;
static int initialized = 0;
rtwCAPI_ModelMappingInfo *getRootMappingInfo()
{
    if (initialized == 0) {
        initialized = 1;
        MultirotorModel_host_InitializeDataMapInfo(&(root), "MultirotorModel");
    }
    return &root.mmi;
}

rtwCAPI_ModelMappingInfo *mexFunction(){return(getRootMappingInfo());}
