    function targMap = targDataMap(),

    ;%***********************
    ;% Create Parameter Map *
    ;%***********************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 19;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc paramMap
        ;%
        paramMap.nSections           = nTotSects;
        paramMap.sectIdxOffset       = sectIdxOffset;
            paramMap.sections(nTotSects) = dumSection; %prealloc
        paramMap.nTotData            = -1;

        ;%
        ;% Auto data (rtP)
        ;%
            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtP._Vehicle2f2uavPackageDeliveryDataDict_sldd_
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(1) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtP._initialConditions2f2uavPackageDeliveryDataDict_sldd_
                    section.data(1).logicalSrcIdx = 1;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(2) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtP._baseMission2f2uavPackageDeliveryDataDict_sldd_
                    section.data(1).logicalSrcIdx = 2;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(3) = section;
            clear section

            section.nData     = 15;
            section.data(15)  = dumData; %prealloc

                    ;% rtP._uavIC_latLon2f2uavPackageDeliveryDataDict_sldd_
                    section.data(1).logicalSrcIdx = 3;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.mass_param
                    section.data(2).logicalSrcIdx = 4;
                    section.data(2).dtTransOffset = 2;

                    ;% rtP.motor_delay_time
                    section.data(3).logicalSrcIdx = 5;
                    section.data(3).dtTransOffset = 3;

                    ;% rtP.startFlightTime
                    section.data(4).logicalSrcIdx = 6;
                    section.data(4).dtTransOffset = 4;

                    ;% rtP.uDOFQuaternion_Vm_0
                    section.data(5).logicalSrcIdx = 7;
                    section.data(5).dtTransOffset = 5;

                    ;% rtP.COESAAtmosphereModel_action
                    section.data(6).logicalSrcIdx = 8;
                    section.data(6).dtTransOffset = 8;

                    ;% rtP.CompareToConstant_const
                    section.data(7).logicalSrcIdx = 9;
                    section.data(7).dtTransOffset = 9;

                    ;% rtP.CompareToConstant_const_p35me42xvr
                    section.data(8).logicalSrcIdx = 10;
                    section.data(8).dtTransOffset = 10;

                    ;% rtP.CompareToConstant_const_gzjkgce2q4
                    section.data(9).logicalSrcIdx = 11;
                    section.data(9).dtTransOffset = 11;

                    ;% rtP.CompareToConstant_const_mj4aqbmylt
                    section.data(10).logicalSrcIdx = 12;
                    section.data(10).dtTransOffset = 12;

                    ;% rtP.CompareToConstant_const_nwcj42kmak
                    section.data(11).logicalSrcIdx = 13;
                    section.data(11).dtTransOffset = 13;

                    ;% rtP.CompareToConstant_const_fugbpfpwgs
                    section.data(12).logicalSrcIdx = 14;
                    section.data(12).dtTransOffset = 14;

                    ;% rtP.uDOFQuaternion_eul_0
                    section.data(13).logicalSrcIdx = 15;
                    section.data(13).dtTransOffset = 15;

                    ;% rtP.uDOFQuaternion_pm_0
                    section.data(14).logicalSrcIdx = 16;
                    section.data(14).dtTransOffset = 18;

                    ;% rtP.FlatEarthtoLLA_psi
                    section.data(15).logicalSrcIdx = 17;
                    section.data(15).dtTransOffset = 21;

            nTotData = nTotData + section.nData;
            paramMap.sections(4) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% rtP.CompareToConstant_const_h3qrt043uz
                    section.data(1).logicalSrcIdx = 18;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.Landed_const
                    section.data(2).logicalSrcIdx = 19;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            paramMap.sections(5) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtP.Memory1_15_InitialCondition
                    section.data(1).logicalSrcIdx = 20;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(6) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtP.RateTransition1_InitialCondition
                    section.data(1).logicalSrcIdx = 21;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(7) = section;
            clear section

            section.nData     = 59;
            section.data(59)  = dumData; %prealloc

                    ;% rtP.Step_Y0
                    section.data(1).logicalSrcIdx = 22;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.Step_YFinal
                    section.data(2).logicalSrcIdx = 23;
                    section.data(2).dtTransOffset = 1;

                    ;% rtP.Magneticfeild_Value
                    section.data(3).logicalSrcIdx = 24;
                    section.data(3).dtTransOffset = 2;

                    ;% rtP.GPSModel_RollAccuracy
                    section.data(4).logicalSrcIdx = 25;
                    section.data(4).dtTransOffset = 5;

                    ;% rtP.GPSModel_PitchAccuracy
                    section.data(5).logicalSrcIdx = 26;
                    section.data(5).dtTransOffset = 6;

                    ;% rtP.GPSModel_YawAccuracy
                    section.data(6).logicalSrcIdx = 27;
                    section.data(6).dtTransOffset = 7;

                    ;% rtP.GPSModel_PositionAccuracy
                    section.data(7).logicalSrcIdx = 28;
                    section.data(7).dtTransOffset = 8;

                    ;% rtP.GPSModel_VelocityAccuracy
                    section.data(8).logicalSrcIdx = 29;
                    section.data(8).dtTransOffset = 9;

                    ;% rtP.Constant_Value
                    section.data(9).logicalSrcIdx = 30;
                    section.data(9).dtTransOffset = 10;

                    ;% rtP.Bias_Bias
                    section.data(10).logicalSrcIdx = 31;
                    section.data(10).dtTransOffset = 11;

                    ;% rtP.Gain_Gain
                    section.data(11).logicalSrcIdx = 32;
                    section.data(11).dtTransOffset = 12;

                    ;% rtP.Bias1_Bias
                    section.data(12).logicalSrcIdx = 33;
                    section.data(12).dtTransOffset = 13;

                    ;% rtP.Bias_Bias_i1bu5cs1jd
                    section.data(13).logicalSrcIdx = 34;
                    section.data(13).dtTransOffset = 14;

                    ;% rtP.Bias1_Bias_i3jbvzmd2x
                    section.data(14).logicalSrcIdx = 35;
                    section.data(14).dtTransOffset = 15;

                    ;% rtP.Bias_Bias_o5mswgodyq
                    section.data(15).logicalSrcIdx = 36;
                    section.data(15).dtTransOffset = 16;

                    ;% rtP.Bias1_Bias_ikyary3trd
                    section.data(16).logicalSrcIdx = 37;
                    section.data(16).dtTransOffset = 17;

                    ;% rtP.Constant_Value_mrukhswidt
                    section.data(17).logicalSrcIdx = 38;
                    section.data(17).dtTransOffset = 18;

                    ;% rtP.wind_Time0
                    section.data(18).logicalSrcIdx = 39;
                    section.data(18).dtTransOffset = 19;

                    ;% rtP.wind_Data0
                    section.data(19).logicalSrcIdx = 40;
                    section.data(19).dtTransOffset = 520;

                    ;% rtP.u2rhoV2_Gain
                    section.data(20).logicalSrcIdx = 41;
                    section.data(20).dtTransOffset = 2023;

                    ;% rtP.Gain_Gain_bca50qwkub
                    section.data(21).logicalSrcIdx = 42;
                    section.data(21).dtTransOffset = 2024;

                    ;% rtP.Gain3_Gain
                    section.data(22).logicalSrcIdx = 43;
                    section.data(22).dtTransOffset = 2026;

                    ;% rtP.TransportDelay_InitOutput
                    section.data(23).logicalSrcIdx = 44;
                    section.data(23).dtTransOffset = 2027;

                    ;% rtP.IMUDrift_Time0
                    section.data(24).logicalSrcIdx = 45;
                    section.data(24).dtTransOffset = 2028;

                    ;% rtP.IMUDrift_Data0
                    section.data(25).logicalSrcIdx = 46;
                    section.data(25).dtTransOffset = 2529;

                    ;% rtP.Merge_InitialOutput
                    section.data(26).logicalSrcIdx = 47;
                    section.data(26).dtTransOffset = 4032;

                    ;% rtP.Merge_InitialOutput_ffiktmcxlg
                    section.data(27).logicalSrcIdx = 48;
                    section.data(27).dtTransOffset = 4033;

                    ;% rtP.Gain_Gain_plpwcr1skl
                    section.data(28).logicalSrcIdx = 49;
                    section.data(28).dtTransOffset = 4034;

                    ;% rtP.Gain1_Gain
                    section.data(29).logicalSrcIdx = 50;
                    section.data(29).dtTransOffset = 4035;

                    ;% rtP.Gain2_Gain
                    section.data(30).logicalSrcIdx = 51;
                    section.data(30).dtTransOffset = 4036;

                    ;% rtP.Constant2_Value
                    section.data(31).logicalSrcIdx = 52;
                    section.data(31).dtTransOffset = 4037;

                    ;% rtP.D1_Value
                    section.data(32).logicalSrcIdx = 53;
                    section.data(32).dtTransOffset = 4046;

                    ;% rtP.D2_Value
                    section.data(33).logicalSrcIdx = 54;
                    section.data(33).dtTransOffset = 4049;

                    ;% rtP.D3_Value
                    section.data(34).logicalSrcIdx = 55;
                    section.data(34).dtTransOffset = 4052;

                    ;% rtP.D4_Value
                    section.data(35).logicalSrcIdx = 56;
                    section.data(35).dtTransOffset = 4055;

                    ;% rtP.Constant_Value_jcocc201pv
                    section.data(36).logicalSrcIdx = 57;
                    section.data(36).dtTransOffset = 4058;

                    ;% rtP.Constant1_Value
                    section.data(37).logicalSrcIdx = 58;
                    section.data(37).dtTransOffset = 4059;

                    ;% rtP.Constant2_Value_cvi1k0q43x
                    section.data(38).logicalSrcIdx = 59;
                    section.data(38).dtTransOffset = 4060;

                    ;% rtP.Constant2_Value_gsps0c2cqc
                    section.data(39).logicalSrcIdx = 60;
                    section.data(39).dtTransOffset = 4061;

                    ;% rtP.Constant_Value_c2sqjmkns4
                    section.data(40).logicalSrcIdx = 61;
                    section.data(40).dtTransOffset = 4062;

                    ;% rtP.Constant1_Value_asvirhyy4x
                    section.data(41).logicalSrcIdx = 62;
                    section.data(41).dtTransOffset = 4063;

                    ;% rtP.Bias_Bias_ir1mwfrehi
                    section.data(42).logicalSrcIdx = 63;
                    section.data(42).dtTransOffset = 4064;

                    ;% rtP.Constant2_Value_pql0ow2xvu
                    section.data(43).logicalSrcIdx = 64;
                    section.data(43).dtTransOffset = 4065;

                    ;% rtP.Bias1_Bias_besunzn4gp
                    section.data(44).logicalSrcIdx = 65;
                    section.data(44).dtTransOffset = 4066;

                    ;% rtP.Bias_Bias_l10zoh0uu5
                    section.data(45).logicalSrcIdx = 66;
                    section.data(45).dtTransOffset = 4067;

                    ;% rtP.Gain_Gain_f4cp2usue1
                    section.data(46).logicalSrcIdx = 67;
                    section.data(46).dtTransOffset = 4068;

                    ;% rtP.Bias1_Bias_hq0ealnef0
                    section.data(47).logicalSrcIdx = 68;
                    section.data(47).dtTransOffset = 4069;

                    ;% rtP.Bias_Bias_owq1alblb2
                    section.data(48).logicalSrcIdx = 69;
                    section.data(48).dtTransOffset = 4070;

                    ;% rtP.Constant2_Value_g4wkd4w02n
                    section.data(49).logicalSrcIdx = 70;
                    section.data(49).dtTransOffset = 4071;

                    ;% rtP.Bias1_Bias_p1ta40i5bj
                    section.data(50).logicalSrcIdx = 71;
                    section.data(50).dtTransOffset = 4072;

                    ;% rtP.Constant_Value_lwxaohkvcw
                    section.data(51).logicalSrcIdx = 72;
                    section.data(51).dtTransOffset = 4073;

                    ;% rtP.Constant1_Value_j3mahrfuck
                    section.data(52).logicalSrcIdx = 73;
                    section.data(52).dtTransOffset = 4074;

                    ;% rtP.Constant_Value_kuutqrezza
                    section.data(53).logicalSrcIdx = 74;
                    section.data(53).dtTransOffset = 4075;

                    ;% rtP.Constant_Value_ircykwslyx
                    section.data(54).logicalSrcIdx = 75;
                    section.data(54).dtTransOffset = 4076;

                    ;% rtP.f_Value
                    section.data(55).logicalSrcIdx = 76;
                    section.data(55).dtTransOffset = 4077;

                    ;% rtP.Constant_Value_byry0rmz1r
                    section.data(56).logicalSrcIdx = 77;
                    section.data(56).dtTransOffset = 4078;

                    ;% rtP.Zeroleveltrust_Value
                    section.data(57).logicalSrcIdx = 78;
                    section.data(57).dtTransOffset = 4079;

                    ;% rtP.Step_Y0_oehiaips24
                    section.data(58).logicalSrcIdx = 79;
                    section.data(58).dtTransOffset = 4080;

                    ;% rtP.Step_YFinal_f1dbnugz1k
                    section.data(59).logicalSrcIdx = 80;
                    section.data(59).dtTransOffset = 4081;

            nTotData = nTotData + section.nData;
            paramMap.sections(8) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% rtP.Gain2_Gain_olwza3kd3o
                    section.data(1).logicalSrcIdx = 81;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.Gain_Gain_dqksrwq0by
                    section.data(2).logicalSrcIdx = 82;
                    section.data(2).dtTransOffset = 1;

                    ;% rtP.Gain1_Gain_ewyr5l45gb
                    section.data(3).logicalSrcIdx = 83;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            paramMap.sections(9) = section;
            clear section

            section.nData     = 34;
            section.data(34)  = dumData; %prealloc

                    ;% rtP.HdgCmdSat_UpperSat
                    section.data(1).logicalSrcIdx = 84;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.HdgCmdSat_LowerSat
                    section.data(2).logicalSrcIdx = 85;
                    section.data(2).dtTransOffset = 1;

                    ;% rtP.YawCmdSat_UpperSat
                    section.data(3).logicalSrcIdx = 86;
                    section.data(3).dtTransOffset = 2;

                    ;% rtP.YawCmdSat_LowerSat
                    section.data(4).logicalSrcIdx = 87;
                    section.data(4).dtTransOffset = 3;

                    ;% rtP.LookaheadDistance_Value
                    section.data(5).logicalSrcIdx = 88;
                    section.data(5).dtTransOffset = 4;

                    ;% rtP.LookaheadDistance_Value_fb3ddw2y0z
                    section.data(6).logicalSrcIdx = 89;
                    section.data(6).dtTransOffset = 5;

                    ;% rtP.HdgCmdSat_UpperSat_lox2buywsz
                    section.data(7).logicalSrcIdx = 90;
                    section.data(7).dtTransOffset = 6;

                    ;% rtP.HdgCmdSat_LowerSat_imiuafvcd1
                    section.data(8).logicalSrcIdx = 91;
                    section.data(8).dtTransOffset = 7;

                    ;% rtP.YawCmdSat_UpperSat_l4z43obj54
                    section.data(9).logicalSrcIdx = 92;
                    section.data(9).dtTransOffset = 8;

                    ;% rtP.YawCmdSat_LowerSat_db3m0k1sno
                    section.data(10).logicalSrcIdx = 93;
                    section.data(10).dtTransOffset = 9;

                    ;% rtP.Saturation_UpperSat
                    section.data(11).logicalSrcIdx = 94;
                    section.data(11).dtTransOffset = 10;

                    ;% rtP.Saturation_LowerSat
                    section.data(12).logicalSrcIdx = 95;
                    section.data(12).dtTransOffset = 11;

                    ;% rtP.LookaheadDistance_Value_hppahproe4
                    section.data(13).logicalSrcIdx = 96;
                    section.data(13).dtTransOffset = 12;

                    ;% rtP.Home_Value
                    section.data(14).logicalSrcIdx = 97;
                    section.data(14).dtTransOffset = 13;

                    ;% rtP.Motordirections_Gain
                    section.data(15).logicalSrcIdx = 98;
                    section.data(15).dtTransOffset = 16;

                    ;% rtP.Saturation5_UpperSat
                    section.data(16).logicalSrcIdx = 99;
                    section.data(16).dtTransOffset = 20;

                    ;% rtP.Saturation5_LowerSat
                    section.data(17).logicalSrcIdx = 100;
                    section.data(17).dtTransOffset = 21;

                    ;% rtP.Motordirections1_Gain
                    section.data(18).logicalSrcIdx = 101;
                    section.data(18).dtTransOffset = 22;

                    ;% rtP.motorsToW2_Gain_Gain
                    section.data(19).logicalSrcIdx = 102;
                    section.data(19).dtTransOffset = 26;

                    ;% rtP.Gain3_Gain_ccpyinsi0r
                    section.data(20).logicalSrcIdx = 103;
                    section.data(20).dtTransOffset = 27;

                    ;% rtP.Gain4_Gain
                    section.data(21).logicalSrcIdx = 104;
                    section.data(21).dtTransOffset = 28;

                    ;% rtP.RateTransition_InitialCondition
                    section.data(22).logicalSrcIdx = 105;
                    section.data(22).dtTransOffset = 29;

                    ;% rtP.Memory1_2_InitialCondition
                    section.data(23).logicalSrcIdx = 106;
                    section.data(23).dtTransOffset = 30;

                    ;% rtP.Memory1_3_InitialCondition
                    section.data(24).logicalSrcIdx = 107;
                    section.data(24).dtTransOffset = 31;

                    ;% rtP.Memory1_4_InitialCondition
                    section.data(25).logicalSrcIdx = 108;
                    section.data(25).dtTransOffset = 32;

                    ;% rtP.Memory1_5_InitialCondition
                    section.data(26).logicalSrcIdx = 109;
                    section.data(26).dtTransOffset = 33;

                    ;% rtP.Memory1_6_InitialCondition
                    section.data(27).logicalSrcIdx = 110;
                    section.data(27).dtTransOffset = 34;

                    ;% rtP.Memory1_7_InitialCondition
                    section.data(28).logicalSrcIdx = 111;
                    section.data(28).dtTransOffset = 35;

                    ;% rtP.Memory1_9_InitialCondition
                    section.data(29).logicalSrcIdx = 112;
                    section.data(29).dtTransOffset = 36;

                    ;% rtP.Memory1_10_InitialCondition
                    section.data(30).logicalSrcIdx = 113;
                    section.data(30).dtTransOffset = 37;

                    ;% rtP.Memory1_11_InitialCondition
                    section.data(31).logicalSrcIdx = 114;
                    section.data(31).dtTransOffset = 38;

                    ;% rtP.Memory1_12_InitialCondition
                    section.data(32).logicalSrcIdx = 115;
                    section.data(32).dtTransOffset = 39;

                    ;% rtP.Memory1_13_InitialCondition
                    section.data(33).logicalSrcIdx = 116;
                    section.data(33).dtTransOffset = 40;

                    ;% rtP.Memory1_14_InitialCondition
                    section.data(34).logicalSrcIdx = 117;
                    section.data(34).dtTransOffset = 41;

            nTotData = nTotData + section.nData;
            paramMap.sections(10) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% rtP.Constant1_Value_anm2sz40q5
                    section.data(1).logicalSrcIdx = 118;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.Constant2_Value_pl3vsgsb5a
                    section.data(2).logicalSrcIdx = 119;
                    section.data(2).dtTransOffset = 1;

                    ;% rtP.Memory1_1_InitialCondition
                    section.data(3).logicalSrcIdx = 120;
                    section.data(3).dtTransOffset = 2;

                    ;% rtP.Memory1_8_InitialCondition
                    section.data(4).logicalSrcIdx = 121;
                    section.data(4).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            paramMap.sections(11) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% rtP.Zeroleveltrust6_Value
                    section.data(1).logicalSrcIdx = 122;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.Zeroleveltrust7_Value
                    section.data(2).logicalSrcIdx = 123;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            paramMap.sections(12) = section;
            clear section

            section.nData     = 6;
            section.data(6)  = dumData; %prealloc

                    ;% rtP.Constant_Value_hrnfkpkbtx
                    section.data(1).logicalSrcIdx = 124;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.Constant_Value_degkb43kq4
                    section.data(2).logicalSrcIdx = 125;
                    section.data(2).dtTransOffset = 1;

                    ;% rtP.Delay_InitialCondition
                    section.data(3).logicalSrcIdx = 126;
                    section.data(3).dtTransOffset = 2;

                    ;% rtP.TakeoffIC_Value
                    section.data(4).logicalSrcIdx = 127;
                    section.data(4).dtTransOffset = 3;

                    ;% rtP.MissionAction_Value
                    section.data(5).logicalSrcIdx = 128;
                    section.data(5).dtTransOffset = 4;

                    ;% rtP.Zeroleveltrust5_Value
                    section.data(6).logicalSrcIdx = 129;
                    section.data(6).dtTransOffset = 5;

            nTotData = nTotData + section.nData;
            paramMap.sections(13) = section;
            clear section

            section.nData     = 8;
            section.data(8)  = dumData; %prealloc

                    ;% rtP.n2lxxqcgg4.cdz0vwtzpdl.Gain_Gain
                    section.data(1).logicalSrcIdx = 130;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.n2lxxqcgg4.cdz0vwtzpdl.R1_Gain
                    section.data(2).logicalSrcIdx = 131;
                    section.data(2).dtTransOffset = 1;

                    ;% rtP.n2lxxqcgg4.cdz0vwtzpdl.R2_Gain
                    section.data(3).logicalSrcIdx = 132;
                    section.data(3).dtTransOffset = 2;

                    ;% rtP.n2lxxqcgg4.cdz0vwtzpdl.Gain1_Gain
                    section.data(4).logicalSrcIdx = 133;
                    section.data(4).dtTransOffset = 3;

                    ;% rtP.n2lxxqcgg4.cdz0vwtzpdl.Gain2_Gain
                    section.data(5).logicalSrcIdx = 134;
                    section.data(5).dtTransOffset = 4;

                    ;% rtP.n2lxxqcgg4.cdz0vwtzpdl.Constant1_Value
                    section.data(6).logicalSrcIdx = 135;
                    section.data(6).dtTransOffset = 5;

                    ;% rtP.n2lxxqcgg4.cdz0vwtzpdl.Constant3_Value
                    section.data(7).logicalSrcIdx = 136;
                    section.data(7).dtTransOffset = 6;

                    ;% rtP.n2lxxqcgg4.cdz0vwtzpdl.Constant4_Value
                    section.data(8).logicalSrcIdx = 137;
                    section.data(8).dtTransOffset = 8;

            nTotData = nTotData + section.nData;
            paramMap.sections(14) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% rtP.n2lxxqcgg4.cdz0vwtzpdl.R_Gain
                    section.data(1).logicalSrcIdx = 138;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.n2lxxqcgg4.cdz0vwtzpdl.R3_Gain
                    section.data(2).logicalSrcIdx = 139;
                    section.data(2).dtTransOffset = 1;

                    ;% rtP.n2lxxqcgg4.cdz0vwtzpdl.R4_Gain
                    section.data(3).logicalSrcIdx = 140;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            paramMap.sections(15) = section;
            clear section

            section.nData     = 17;
            section.data(17)  = dumData; %prealloc

                    ;% rtP.e0fma3ayau1.Angularvelocitycontrolloop_D
                    section.data(1).logicalSrcIdx = 141;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.e0fma3ayau1.Angularvelocitycontrolloop_I
                    section.data(2).logicalSrcIdx = 142;
                    section.data(2).dtTransOffset = 2;

                    ;% rtP.e0fma3ayau1.Velocitycontroller_I
                    section.data(3).logicalSrcIdx = 143;
                    section.data(3).dtTransOffset = 4;

                    ;% rtP.e0fma3ayau1.Angularvelocitycontrolloop_InitialConditionForFilter
                    section.data(4).logicalSrcIdx = 144;
                    section.data(4).dtTransOffset = 5;

                    ;% rtP.e0fma3ayau1.Velocitycontroller_InitialConditionForIntegrator
                    section.data(5).logicalSrcIdx = 145;
                    section.data(5).dtTransOffset = 6;

                    ;% rtP.e0fma3ayau1.Angularvelocitycontrolloop_InitialConditionForIntegrator
                    section.data(6).logicalSrcIdx = 146;
                    section.data(6).dtTransOffset = 7;

                    ;% rtP.e0fma3ayau1.Positioncontroller_LowerSaturationLimit
                    section.data(7).logicalSrcIdx = 147;
                    section.data(7).dtTransOffset = 8;

                    ;% rtP.e0fma3ayau1.Velocitycontroller_LowerSaturationLimit
                    section.data(8).logicalSrcIdx = 148;
                    section.data(8).dtTransOffset = 9;

                    ;% rtP.e0fma3ayau1.Angularvelocitycontrolloop_LowerSaturationLimit
                    section.data(9).logicalSrcIdx = 149;
                    section.data(9).dtTransOffset = 10;

                    ;% rtP.e0fma3ayau1.Angularvelocitycontrolloop_N
                    section.data(10).logicalSrcIdx = 150;
                    section.data(10).dtTransOffset = 11;

                    ;% rtP.e0fma3ayau1.Positioncontroller_P
                    section.data(11).logicalSrcIdx = 151;
                    section.data(11).dtTransOffset = 12;

                    ;% rtP.e0fma3ayau1.Velocitycontroller_P
                    section.data(12).logicalSrcIdx = 152;
                    section.data(12).dtTransOffset = 13;

                    ;% rtP.e0fma3ayau1.Anglecontrolloop_P
                    section.data(13).logicalSrcIdx = 153;
                    section.data(13).dtTransOffset = 14;

                    ;% rtP.e0fma3ayau1.Angularvelocitycontrolloop_P
                    section.data(14).logicalSrcIdx = 154;
                    section.data(14).dtTransOffset = 15;

                    ;% rtP.e0fma3ayau1.Positioncontroller_UpperSaturationLimit
                    section.data(15).logicalSrcIdx = 155;
                    section.data(15).dtTransOffset = 17;

                    ;% rtP.e0fma3ayau1.Velocitycontroller_UpperSaturationLimit
                    section.data(16).logicalSrcIdx = 156;
                    section.data(16).dtTransOffset = 18;

                    ;% rtP.e0fma3ayau1.Angularvelocitycontrolloop_UpperSaturationLimit
                    section.data(17).logicalSrcIdx = 157;
                    section.data(17).dtTransOffset = 19;

            nTotData = nTotData + section.nData;
            paramMap.sections(16) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% rtP.e0fma3ayau1.GPSdrift_Time0
                    section.data(1).logicalSrcIdx = 158;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.e0fma3ayau1.GPSdrift_Data0
                    section.data(2).logicalSrcIdx = 159;
                    section.data(2).dtTransOffset = 501;

                    ;% rtP.e0fma3ayau1.barrodrift_Time0
                    section.data(3).logicalSrcIdx = 160;
                    section.data(3).dtTransOffset = 1503;

                    ;% rtP.e0fma3ayau1.barrodrift_Data0
                    section.data(4).logicalSrcIdx = 161;
                    section.data(4).dtTransOffset = 2004;

            nTotData = nTotData + section.nData;
            paramMap.sections(17) = section;
            clear section

            section.nData     = 31;
            section.data(31)  = dumData; %prealloc

                    ;% rtP.e0fma3ayau1.ActuatorCmds_Y0
                    section.data(1).logicalSrcIdx = 162;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.e0fma3ayau1.Constant1_Value
                    section.data(2).logicalSrcIdx = 163;
                    section.data(2).dtTransOffset = 1;

                    ;% rtP.e0fma3ayau1.Constant1_Value_bg2p5q21ec
                    section.data(3).logicalSrcIdx = 164;
                    section.data(3).dtTransOffset = 2;

                    ;% rtP.e0fma3ayau1.Integrator_gainval
                    section.data(4).logicalSrcIdx = 165;
                    section.data(4).dtTransOffset = 3;

                    ;% rtP.e0fma3ayau1.Gain_Gain
                    section.data(5).logicalSrcIdx = 166;
                    section.data(5).dtTransOffset = 4;

                    ;% rtP.e0fma3ayau1.Integrator_gainval_fkl0csx1tr
                    section.data(6).logicalSrcIdx = 167;
                    section.data(6).dtTransOffset = 6;

                    ;% rtP.e0fma3ayau1.Filter_gainval
                    section.data(7).logicalSrcIdx = 168;
                    section.data(7).dtTransOffset = 7;

                    ;% rtP.e0fma3ayau1.DiscreteTimeIntegrator_gainval
                    section.data(8).logicalSrcIdx = 169;
                    section.data(8).dtTransOffset = 8;

                    ;% rtP.e0fma3ayau1.DiscreteTimeIntegrator_IC
                    section.data(9).logicalSrcIdx = 170;
                    section.data(9).dtTransOffset = 9;

                    ;% rtP.e0fma3ayau1.DiscreteTimeIntegrator_UpperSat
                    section.data(10).logicalSrcIdx = 171;
                    section.data(10).dtTransOffset = 10;

                    ;% rtP.e0fma3ayau1.DiscreteTimeIntegrator_LowerSat
                    section.data(11).logicalSrcIdx = 172;
                    section.data(11).dtTransOffset = 11;

                    ;% rtP.e0fma3ayau1.P_z1_Gain
                    section.data(12).logicalSrcIdx = 173;
                    section.data(12).dtTransOffset = 12;

                    ;% rtP.e0fma3ayau1.D_z1_Gain
                    section.data(13).logicalSrcIdx = 174;
                    section.data(13).dtTransOffset = 13;

                    ;% rtP.e0fma3ayau1.SaturationThrust1_UpperSat
                    section.data(14).logicalSrcIdx = 175;
                    section.data(14).dtTransOffset = 14;

                    ;% rtP.e0fma3ayau1.SaturationThrust1_LowerSat
                    section.data(15).logicalSrcIdx = 176;
                    section.data(15).dtTransOffset = 15;

                    ;% rtP.e0fma3ayau1.P_yaw_Gain
                    section.data(16).logicalSrcIdx = 177;
                    section.data(16).dtTransOffset = 16;

                    ;% rtP.e0fma3ayau1.DiscreteTimeIntegrator_gainval_oux2ktusth
                    section.data(17).logicalSrcIdx = 178;
                    section.data(17).dtTransOffset = 17;

                    ;% rtP.e0fma3ayau1.DiscreteTimeIntegrator_IC_k4qsha3hyk
                    section.data(18).logicalSrcIdx = 179;
                    section.data(18).dtTransOffset = 18;

                    ;% rtP.e0fma3ayau1.DiscreteTimeIntegrator_UpperSat_c5d2uk2k0s
                    section.data(19).logicalSrcIdx = 180;
                    section.data(19).dtTransOffset = 19;

                    ;% rtP.e0fma3ayau1.DiscreteTimeIntegrator_LowerSat_azjrmee55e
                    section.data(20).logicalSrcIdx = 181;
                    section.data(20).dtTransOffset = 20;

                    ;% rtP.e0fma3ayau1.D_yaw_Gain
                    section.data(21).logicalSrcIdx = 182;
                    section.data(21).dtTransOffset = 21;

                    ;% rtP.e0fma3ayau1.I_yaw_Gain
                    section.data(22).logicalSrcIdx = 183;
                    section.data(22).dtTransOffset = 22;

                    ;% rtP.e0fma3ayau1.I_pr_Gain
                    section.data(23).logicalSrcIdx = 184;
                    section.data(23).dtTransOffset = 23;

                    ;% rtP.e0fma3ayau1.ThrustToMotorCommand_Gain
                    section.data(24).logicalSrcIdx = 185;
                    section.data(24).dtTransOffset = 24;

                    ;% rtP.e0fma3ayau1.Saturation5_UpperSat
                    section.data(25).logicalSrcIdx = 186;
                    section.data(25).dtTransOffset = 25;

                    ;% rtP.e0fma3ayau1.Saturation5_LowerSat
                    section.data(26).logicalSrcIdx = 187;
                    section.data(26).dtTransOffset = 26;

                    ;% rtP.e0fma3ayau1.MotorDirections_Gain
                    section.data(27).logicalSrcIdx = 188;
                    section.data(27).dtTransOffset = 27;

                    ;% rtP.e0fma3ayau1.Clamping_zero_Value
                    section.data(28).logicalSrcIdx = 189;
                    section.data(28).dtTransOffset = 31;

                    ;% rtP.e0fma3ayau1.TorqueTotalThrustToThrustPerMotor_Value
                    section.data(29).logicalSrcIdx = 190;
                    section.data(29).dtTransOffset = 32;

                    ;% rtP.e0fma3ayau1.Clamping_zero_Value_mwkp2wofuc
                    section.data(30).logicalSrcIdx = 191;
                    section.data(30).dtTransOffset = 48;

                    ;% rtP.e0fma3ayau1.w1_Value
                    section.data(31).logicalSrcIdx = 192;
                    section.data(31).dtTransOffset = 49;

            nTotData = nTotData + section.nData;
            paramMap.sections(18) = section;
            clear section

            section.nData     = 8;
            section.data(8)  = dumData; %prealloc

                    ;% rtP.e0fma3ayau1.Constant_Value
                    section.data(1).logicalSrcIdx = 193;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.e0fma3ayau1.Constant2_Value
                    section.data(2).logicalSrcIdx = 194;
                    section.data(2).dtTransOffset = 1;

                    ;% rtP.e0fma3ayau1.Constant3_Value
                    section.data(3).logicalSrcIdx = 195;
                    section.data(3).dtTransOffset = 2;

                    ;% rtP.e0fma3ayau1.Constant4_Value
                    section.data(4).logicalSrcIdx = 196;
                    section.data(4).dtTransOffset = 3;

                    ;% rtP.e0fma3ayau1.Constant_Value_e5r0lmle3l
                    section.data(5).logicalSrcIdx = 197;
                    section.data(5).dtTransOffset = 4;

                    ;% rtP.e0fma3ayau1.Constant2_Value_hfogelb41x
                    section.data(6).logicalSrcIdx = 198;
                    section.data(6).dtTransOffset = 5;

                    ;% rtP.e0fma3ayau1.Constant3_Value_cexplrt1a1
                    section.data(7).logicalSrcIdx = 199;
                    section.data(7).dtTransOffset = 6;

                    ;% rtP.e0fma3ayau1.Constant4_Value_cdeulapdlg
                    section.data(8).logicalSrcIdx = 200;
                    section.data(8).dtTransOffset = 7;

            nTotData = nTotData + section.nData;
            paramMap.sections(19) = section;
            clear section


            ;%
            ;% Non-auto Data (parameter)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        paramMap.nTotData = nTotData;



    ;%**************************
    ;% Create Block Output Map *
    ;%**************************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 21;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc sigMap
        ;%
        sigMap.nSections           = nTotSects;
        sigMap.sectIdxOffset       = sectIdxOffset;
            sigMap.sections(nTotSects) = dumSection; %prealloc
        sigMap.nTotData            = -1;

        ;%
        ;% Auto data (rtB)
        ;%
            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtB.pxvla503xe
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(1) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtB.l5cxq1n3v3
                    section.data(1).logicalSrcIdx = 1;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(2) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% rtB.ifjwmthkqu
                    section.data(1).logicalSrcIdx = 2;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.gjlwqkue0m
                    section.data(2).logicalSrcIdx = 3;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            sigMap.sections(3) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% rtB.imabc3fpd3
                    section.data(1).logicalSrcIdx = 4;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.osyifedrkf
                    section.data(2).logicalSrcIdx = 5;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            sigMap.sections(4) = section;
            clear section

            section.nData     = 110;
            section.data(110)  = dumData; %prealloc

                    ;% rtB.ldobphcgii
                    section.data(1).logicalSrcIdx = 6;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.mqn4wqkqt1
                    section.data(2).logicalSrcIdx = 7;
                    section.data(2).dtTransOffset = 1;

                    ;% rtB.n5zy0dlddi
                    section.data(3).logicalSrcIdx = 8;
                    section.data(3).dtTransOffset = 4;

                    ;% rtB.b2vzl4jvmf
                    section.data(4).logicalSrcIdx = 9;
                    section.data(4).dtTransOffset = 7;

                    ;% rtB.h0l55ev322
                    section.data(5).logicalSrcIdx = 10;
                    section.data(5).dtTransOffset = 16;

                    ;% rtB.m2pff5eoce
                    section.data(6).logicalSrcIdx = 11;
                    section.data(6).dtTransOffset = 19;

                    ;% rtB.c2ezod5wqa
                    section.data(7).logicalSrcIdx = 12;
                    section.data(7).dtTransOffset = 22;

                    ;% rtB.ltnejzrzsb
                    section.data(8).logicalSrcIdx = 13;
                    section.data(8).dtTransOffset = 25;

                    ;% rtB.dnzqyzmjq1
                    section.data(9).logicalSrcIdx = 14;
                    section.data(9).dtTransOffset = 26;

                    ;% rtB.fsw5y3sk52
                    section.data(10).logicalSrcIdx = 15;
                    section.data(10).dtTransOffset = 27;

                    ;% rtB.k5abkespad
                    section.data(11).logicalSrcIdx = 16;
                    section.data(11).dtTransOffset = 28;

                    ;% rtB.leirfnlkmj
                    section.data(12).logicalSrcIdx = 17;
                    section.data(12).dtTransOffset = 29;

                    ;% rtB.ka3trac23w
                    section.data(13).logicalSrcIdx = 18;
                    section.data(13).dtTransOffset = 30;

                    ;% rtB.amy52mba00
                    section.data(14).logicalSrcIdx = 19;
                    section.data(14).dtTransOffset = 31;

                    ;% rtB.p1jt4kwpsi
                    section.data(15).logicalSrcIdx = 20;
                    section.data(15).dtTransOffset = 34;

                    ;% rtB.ibijw5nyvt
                    section.data(16).logicalSrcIdx = 21;
                    section.data(16).dtTransOffset = 37;

                    ;% rtB.bujbjhloby
                    section.data(17).logicalSrcIdx = 22;
                    section.data(17).dtTransOffset = 40;

                    ;% rtB.bnlqh5e3ok
                    section.data(18).logicalSrcIdx = 23;
                    section.data(18).dtTransOffset = 43;

                    ;% rtB.nnzby1zie1
                    section.data(19).logicalSrcIdx = 24;
                    section.data(19).dtTransOffset = 46;

                    ;% rtB.dubdi4n5k1
                    section.data(20).logicalSrcIdx = 25;
                    section.data(20).dtTransOffset = 49;

                    ;% rtB.hzvglzjvo1
                    section.data(21).logicalSrcIdx = 26;
                    section.data(21).dtTransOffset = 52;

                    ;% rtB.fdyykdyy0z
                    section.data(22).logicalSrcIdx = 27;
                    section.data(22).dtTransOffset = 55;

                    ;% rtB.lay0qse3ey
                    section.data(23).logicalSrcIdx = 28;
                    section.data(23).dtTransOffset = 58;

                    ;% rtB.g05sp32g1r
                    section.data(24).logicalSrcIdx = 29;
                    section.data(24).dtTransOffset = 61;

                    ;% rtB.coytgocfzx
                    section.data(25).logicalSrcIdx = 30;
                    section.data(25).dtTransOffset = 62;

                    ;% rtB.ih3r40m4ke
                    section.data(26).logicalSrcIdx = 31;
                    section.data(26).dtTransOffset = 63;

                    ;% rtB.kaqyna3uhe
                    section.data(27).logicalSrcIdx = 32;
                    section.data(27).dtTransOffset = 64;

                    ;% rtB.ib13fuehnp
                    section.data(28).logicalSrcIdx = 33;
                    section.data(28).dtTransOffset = 65;

                    ;% rtB.nbzr0n555h
                    section.data(29).logicalSrcIdx = 34;
                    section.data(29).dtTransOffset = 66;

                    ;% rtB.a3a54gq2ph
                    section.data(30).logicalSrcIdx = 35;
                    section.data(30).dtTransOffset = 67;

                    ;% rtB.h25sqqw3yx
                    section.data(31).logicalSrcIdx = 36;
                    section.data(31).dtTransOffset = 68;

                    ;% rtB.dxfnmue1xt
                    section.data(32).logicalSrcIdx = 37;
                    section.data(32).dtTransOffset = 70;

                    ;% rtB.m4xdglyhk3
                    section.data(33).logicalSrcIdx = 38;
                    section.data(33).dtTransOffset = 71;

                    ;% rtB.bd5s2as1af
                    section.data(34).logicalSrcIdx = 39;
                    section.data(34).dtTransOffset = 74;

                    ;% rtB.mh5uen3aqi
                    section.data(35).logicalSrcIdx = 40;
                    section.data(35).dtTransOffset = 77;

                    ;% rtB.frwbosnrut
                    section.data(36).logicalSrcIdx = 41;
                    section.data(36).dtTransOffset = 80;

                    ;% rtB.jchu5yjfmw
                    section.data(37).logicalSrcIdx = 42;
                    section.data(37).dtTransOffset = 83;

                    ;% rtB.ajmwlylmw1
                    section.data(38).logicalSrcIdx = 43;
                    section.data(38).dtTransOffset = 86;

                    ;% rtB.lxkiufmzes
                    section.data(39).logicalSrcIdx = 44;
                    section.data(39).dtTransOffset = 89;

                    ;% rtB.o5oqm2simu
                    section.data(40).logicalSrcIdx = 45;
                    section.data(40).dtTransOffset = 92;

                    ;% rtB.ohrfgdroql
                    section.data(41).logicalSrcIdx = 46;
                    section.data(41).dtTransOffset = 93;

                    ;% rtB.jvtmh22qst
                    section.data(42).logicalSrcIdx = 47;
                    section.data(42).dtTransOffset = 94;

                    ;% rtB.ggxt3gr3he
                    section.data(43).logicalSrcIdx = 48;
                    section.data(43).dtTransOffset = 95;

                    ;% rtB.fquojcpwbw
                    section.data(44).logicalSrcIdx = 49;
                    section.data(44).dtTransOffset = 96;

                    ;% rtB.puw4d5oseo
                    section.data(45).logicalSrcIdx = 50;
                    section.data(45).dtTransOffset = 97;

                    ;% rtB.jcz2kvnpxn
                    section.data(46).logicalSrcIdx = 51;
                    section.data(46).dtTransOffset = 98;

                    ;% rtB.akwoigfag4
                    section.data(47).logicalSrcIdx = 52;
                    section.data(47).dtTransOffset = 101;

                    ;% rtB.gissagiggk
                    section.data(48).logicalSrcIdx = 53;
                    section.data(48).dtTransOffset = 104;

                    ;% rtB.pa4gk1y4g3
                    section.data(49).logicalSrcIdx = 54;
                    section.data(49).dtTransOffset = 113;

                    ;% rtB.bqv4wu45ri
                    section.data(50).logicalSrcIdx = 55;
                    section.data(50).dtTransOffset = 116;

                    ;% rtB.olgghceo5j
                    section.data(51).logicalSrcIdx = 56;
                    section.data(51).dtTransOffset = 119;

                    ;% rtB.lqfwoh0n1n
                    section.data(52).logicalSrcIdx = 57;
                    section.data(52).dtTransOffset = 122;

                    ;% rtB.db1ezvojmn
                    section.data(53).logicalSrcIdx = 58;
                    section.data(53).dtTransOffset = 125;

                    ;% rtB.i0thgs5tav
                    section.data(54).logicalSrcIdx = 59;
                    section.data(54).dtTransOffset = 128;

                    ;% rtB.pjmasymrdk
                    section.data(55).logicalSrcIdx = 60;
                    section.data(55).dtTransOffset = 129;

                    ;% rtB.eplpvzodf3
                    section.data(56).logicalSrcIdx = 61;
                    section.data(56).dtTransOffset = 130;

                    ;% rtB.awp3hht3oi
                    section.data(57).logicalSrcIdx = 62;
                    section.data(57).dtTransOffset = 131;

                    ;% rtB.hxchelqktd
                    section.data(58).logicalSrcIdx = 63;
                    section.data(58).dtTransOffset = 132;

                    ;% rtB.kayt4m3gqp
                    section.data(59).logicalSrcIdx = 64;
                    section.data(59).dtTransOffset = 133;

                    ;% rtB.mp3myeon1n
                    section.data(60).logicalSrcIdx = 65;
                    section.data(60).dtTransOffset = 134;

                    ;% rtB.mchs4l4edm
                    section.data(61).logicalSrcIdx = 66;
                    section.data(61).dtTransOffset = 135;

                    ;% rtB.cj1amiomxp
                    section.data(62).logicalSrcIdx = 67;
                    section.data(62).dtTransOffset = 136;

                    ;% rtB.bbluvjkieu
                    section.data(63).logicalSrcIdx = 68;
                    section.data(63).dtTransOffset = 137;

                    ;% rtB.krnjwyjvkj
                    section.data(64).logicalSrcIdx = 69;
                    section.data(64).dtTransOffset = 138;

                    ;% rtB.lodenvs5g1
                    section.data(65).logicalSrcIdx = 70;
                    section.data(65).dtTransOffset = 139;

                    ;% rtB.mwoevuj2os
                    section.data(66).logicalSrcIdx = 71;
                    section.data(66).dtTransOffset = 140;

                    ;% rtB.e33twyhqos
                    section.data(67).logicalSrcIdx = 72;
                    section.data(67).dtTransOffset = 141;

                    ;% rtB.iuexrpviik
                    section.data(68).logicalSrcIdx = 73;
                    section.data(68).dtTransOffset = 142;

                    ;% rtB.ntohuvbasf
                    section.data(69).logicalSrcIdx = 74;
                    section.data(69).dtTransOffset = 143;

                    ;% rtB.cqiy2axvyl
                    section.data(70).logicalSrcIdx = 75;
                    section.data(70).dtTransOffset = 145;

                    ;% rtB.kca5cb5tsf
                    section.data(71).logicalSrcIdx = 76;
                    section.data(71).dtTransOffset = 146;

                    ;% rtB.afefjghhdn
                    section.data(72).logicalSrcIdx = 77;
                    section.data(72).dtTransOffset = 147;

                    ;% rtB.ni2sll21du
                    section.data(73).logicalSrcIdx = 78;
                    section.data(73).dtTransOffset = 148;

                    ;% rtB.kzlvg4hjk3
                    section.data(74).logicalSrcIdx = 79;
                    section.data(74).dtTransOffset = 149;

                    ;% rtB.jrp05rk55u
                    section.data(75).logicalSrcIdx = 80;
                    section.data(75).dtTransOffset = 150;

                    ;% rtB.nkit20fvts
                    section.data(76).logicalSrcIdx = 81;
                    section.data(76).dtTransOffset = 151;

                    ;% rtB.lfaiqqscqd
                    section.data(77).logicalSrcIdx = 82;
                    section.data(77).dtTransOffset = 152;

                    ;% rtB.hvp2sppawf
                    section.data(78).logicalSrcIdx = 83;
                    section.data(78).dtTransOffset = 153;

                    ;% rtB.l0pnc1s4mu
                    section.data(79).logicalSrcIdx = 84;
                    section.data(79).dtTransOffset = 154;

                    ;% rtB.f03ol2ggzn
                    section.data(80).logicalSrcIdx = 85;
                    section.data(80).dtTransOffset = 155;

                    ;% rtB.ifsq42ee3o
                    section.data(81).logicalSrcIdx = 86;
                    section.data(81).dtTransOffset = 156;

                    ;% rtB.olos53ginz
                    section.data(82).logicalSrcIdx = 87;
                    section.data(82).dtTransOffset = 165;

                    ;% rtB.krxkpaiksh
                    section.data(83).logicalSrcIdx = 88;
                    section.data(83).dtTransOffset = 174;

                    ;% rtB.izylkdvpau
                    section.data(84).logicalSrcIdx = 89;
                    section.data(84).dtTransOffset = 183;

                    ;% rtB.hc0qcnw5on
                    section.data(85).logicalSrcIdx = 90;
                    section.data(85).dtTransOffset = 195;

                    ;% rtB.cribstruca
                    section.data(86).logicalSrcIdx = 91;
                    section.data(86).dtTransOffset = 196;

                    ;% rtB.ak5ymkxznu
                    section.data(87).logicalSrcIdx = 92;
                    section.data(87).dtTransOffset = 197;

                    ;% rtB.ofukpmkdy5
                    section.data(88).logicalSrcIdx = 93;
                    section.data(88).dtTransOffset = 198;

                    ;% rtB.lu42x34o2b
                    section.data(89).logicalSrcIdx = 94;
                    section.data(89).dtTransOffset = 199;

                    ;% rtB.fxd0ubsotk
                    section.data(90).logicalSrcIdx = 95;
                    section.data(90).dtTransOffset = 200;

                    ;% rtB.nh44hic2sm
                    section.data(91).logicalSrcIdx = 96;
                    section.data(91).dtTransOffset = 201;

                    ;% rtB.awzdvp4jqe
                    section.data(92).logicalSrcIdx = 97;
                    section.data(92).dtTransOffset = 202;

                    ;% rtB.exzkjoehou
                    section.data(93).logicalSrcIdx = 98;
                    section.data(93).dtTransOffset = 203;

                    ;% rtB.p3yyiopuki
                    section.data(94).logicalSrcIdx = 99;
                    section.data(94).dtTransOffset = 204;

                    ;% rtB.aaenzgbubh
                    section.data(95).logicalSrcIdx = 100;
                    section.data(95).dtTransOffset = 205;

                    ;% rtB.hxsj2amrkv
                    section.data(96).logicalSrcIdx = 101;
                    section.data(96).dtTransOffset = 206;

                    ;% rtB.lm2bui53nh
                    section.data(97).logicalSrcIdx = 102;
                    section.data(97).dtTransOffset = 207;

                    ;% rtB.k2mqf4yhf5
                    section.data(98).logicalSrcIdx = 103;
                    section.data(98).dtTransOffset = 208;

                    ;% rtB.fadxil2qeo
                    section.data(99).logicalSrcIdx = 104;
                    section.data(99).dtTransOffset = 209;

                    ;% rtB.b5zrucajw2
                    section.data(100).logicalSrcIdx = 105;
                    section.data(100).dtTransOffset = 210;

                    ;% rtB.gmom2xsbq5
                    section.data(101).logicalSrcIdx = 106;
                    section.data(101).dtTransOffset = 211;

                    ;% rtB.btcdwx5g4u
                    section.data(102).logicalSrcIdx = 107;
                    section.data(102).dtTransOffset = 223;

                    ;% rtB.hixslm14r1
                    section.data(103).logicalSrcIdx = 108;
                    section.data(103).dtTransOffset = 226;

                    ;% rtB.o0in1k2qbd
                    section.data(104).logicalSrcIdx = 109;
                    section.data(104).dtTransOffset = 238;

                    ;% rtB.enyi2k544r
                    section.data(105).logicalSrcIdx = 110;
                    section.data(105).dtTransOffset = 241;

                    ;% rtB.kphyjd1y4z
                    section.data(106).logicalSrcIdx = 111;
                    section.data(106).dtTransOffset = 242;

                    ;% rtB.lu30jzebtd
                    section.data(107).logicalSrcIdx = 112;
                    section.data(107).dtTransOffset = 243;

                    ;% rtB.a0aytf3nca
                    section.data(108).logicalSrcIdx = 113;
                    section.data(108).dtTransOffset = 244;

                    ;% rtB.ebpbhsjiym
                    section.data(109).logicalSrcIdx = 114;
                    section.data(109).dtTransOffset = 245;

                    ;% rtB.g3i3wdoj5b
                    section.data(110).logicalSrcIdx = 115;
                    section.data(110).dtTransOffset = 246;

            nTotData = nTotData + section.nData;
            sigMap.sections(5) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% rtB.ghlmhvgqsy
                    section.data(1).logicalSrcIdx = 116;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.ghlmhvgqsym
                    section.data(2).logicalSrcIdx = 117;
                    section.data(2).dtTransOffset = 1;

                    ;% rtB.mp2q4lalh1
                    section.data(3).logicalSrcIdx = 118;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            sigMap.sections(6) = section;
            clear section

            section.nData     = 11;
            section.data(11)  = dumData; %prealloc

                    ;% rtB.cg5tlsmqt5
                    section.data(1).logicalSrcIdx = 119;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.e5mtnzgp51
                    section.data(2).logicalSrcIdx = 120;
                    section.data(2).dtTransOffset = 4;

                    ;% rtB.nrhrd0m3xa
                    section.data(3).logicalSrcIdx = 121;
                    section.data(3).dtTransOffset = 8;

                    ;% rtB.pxjrjgzynn
                    section.data(4).logicalSrcIdx = 122;
                    section.data(4).dtTransOffset = 11;

                    ;% rtB.ieijn20t5v
                    section.data(5).logicalSrcIdx = 123;
                    section.data(5).dtTransOffset = 14;

                    ;% rtB.pp5kihwvjz
                    section.data(6).logicalSrcIdx = 124;
                    section.data(6).dtTransOffset = 17;

                    ;% rtB.o3kzvxzo2u
                    section.data(7).logicalSrcIdx = 125;
                    section.data(7).dtTransOffset = 20;

                    ;% rtB.hggs2tnlhf
                    section.data(8).logicalSrcIdx = 127;
                    section.data(8).dtTransOffset = 29;

                    ;% rtB.of1zobrivn
                    section.data(9).logicalSrcIdx = 128;
                    section.data(9).dtTransOffset = 30;

                    ;% rtB.i0ash4qqgy
                    section.data(10).logicalSrcIdx = 129;
                    section.data(10).dtTransOffset = 34;

                    ;% rtB.k0g1kz0qhh
                    section.data(11).logicalSrcIdx = 130;
                    section.data(11).dtTransOffset = 42;

            nTotData = nTotData + section.nData;
            sigMap.sections(7) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% rtB.mihh5w3wpj
                    section.data(1).logicalSrcIdx = 131;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.c1aqnnzjag
                    section.data(2).logicalSrcIdx = 132;
                    section.data(2).dtTransOffset = 1;

                    ;% rtB.pbeyz3hpj5
                    section.data(3).logicalSrcIdx = 133;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            sigMap.sections(8) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% rtB.j5eopnr54g
                    section.data(1).logicalSrcIdx = 135;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.f03tvkqvfh
                    section.data(2).logicalSrcIdx = 136;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            sigMap.sections(9) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% rtB.mzzvbyhare
                    section.data(1).logicalSrcIdx = 137;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.lssntlpr1j
                    section.data(2).logicalSrcIdx = 138;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            sigMap.sections(10) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% rtB.mnqovcasj3
                    section.data(1).logicalSrcIdx = 139;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.dxlmtpmwu1
                    section.data(2).logicalSrcIdx = 140;
                    section.data(2).dtTransOffset = 1;

                    ;% rtB.dtlgarrfas
                    section.data(3).logicalSrcIdx = 141;
                    section.data(3).dtTransOffset = 2;

                    ;% rtB.lla5dgr3rs
                    section.data(4).logicalSrcIdx = 142;
                    section.data(4).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            sigMap.sections(11) = section;
            clear section

            section.nData     = 39;
            section.data(39)  = dumData; %prealloc

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.bzzbdit0sb
                    section.data(1).logicalSrcIdx = 143;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.hzj0ngsgbf
                    section.data(2).logicalSrcIdx = 144;
                    section.data(2).dtTransOffset = 1;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.ctrmt3ruiy
                    section.data(3).logicalSrcIdx = 145;
                    section.data(3).dtTransOffset = 2;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.frik1umsb1
                    section.data(4).logicalSrcIdx = 146;
                    section.data(4).dtTransOffset = 3;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.h0hu3zuwxl
                    section.data(5).logicalSrcIdx = 147;
                    section.data(5).dtTransOffset = 4;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.nzhmh1iiv3
                    section.data(6).logicalSrcIdx = 148;
                    section.data(6).dtTransOffset = 5;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.byifrgckux
                    section.data(7).logicalSrcIdx = 149;
                    section.data(7).dtTransOffset = 6;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.jk0syur3pd
                    section.data(8).logicalSrcIdx = 150;
                    section.data(8).dtTransOffset = 9;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.bz1nbajjxg
                    section.data(9).logicalSrcIdx = 151;
                    section.data(9).dtTransOffset = 12;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.htpsnc44z1
                    section.data(10).logicalSrcIdx = 152;
                    section.data(10).dtTransOffset = 16;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.o2ftfvin3w
                    section.data(11).logicalSrcIdx = 153;
                    section.data(11).dtTransOffset = 20;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.p0ofr4te2s
                    section.data(12).logicalSrcIdx = 154;
                    section.data(12).dtTransOffset = 21;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.lpt2tec5yl
                    section.data(13).logicalSrcIdx = 155;
                    section.data(13).dtTransOffset = 22;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.pw3xiweg5z
                    section.data(14).logicalSrcIdx = 156;
                    section.data(14).dtTransOffset = 23;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.eusqimawql
                    section.data(15).logicalSrcIdx = 157;
                    section.data(15).dtTransOffset = 24;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.iefbjyefbn
                    section.data(16).logicalSrcIdx = 158;
                    section.data(16).dtTransOffset = 25;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.jwrntb0tlg
                    section.data(17).logicalSrcIdx = 159;
                    section.data(17).dtTransOffset = 26;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.c2qvm4wzez
                    section.data(18).logicalSrcIdx = 160;
                    section.data(18).dtTransOffset = 27;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.ggv340ktgd
                    section.data(19).logicalSrcIdx = 161;
                    section.data(19).dtTransOffset = 28;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.ioekd3zzrj
                    section.data(20).logicalSrcIdx = 162;
                    section.data(20).dtTransOffset = 29;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.emz5cbfumi
                    section.data(21).logicalSrcIdx = 163;
                    section.data(21).dtTransOffset = 31;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.oinqopv1s5
                    section.data(22).logicalSrcIdx = 164;
                    section.data(22).dtTransOffset = 33;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.kaviwvhjw5
                    section.data(23).logicalSrcIdx = 165;
                    section.data(23).dtTransOffset = 34;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.ffmvr5qhqu
                    section.data(24).logicalSrcIdx = 166;
                    section.data(24).dtTransOffset = 36;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.n221biixnu
                    section.data(25).logicalSrcIdx = 167;
                    section.data(25).dtTransOffset = 38;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.coapjggyum
                    section.data(26).logicalSrcIdx = 168;
                    section.data(26).dtTransOffset = 39;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.axa5vb4vvu
                    section.data(27).logicalSrcIdx = 169;
                    section.data(27).dtTransOffset = 40;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.hlx0tda2tp
                    section.data(28).logicalSrcIdx = 170;
                    section.data(28).dtTransOffset = 41;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.eye2nivohz
                    section.data(29).logicalSrcIdx = 171;
                    section.data(29).dtTransOffset = 42;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.fquuajxaq5
                    section.data(30).logicalSrcIdx = 172;
                    section.data(30).dtTransOffset = 43;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.fchutrhkap
                    section.data(31).logicalSrcIdx = 173;
                    section.data(31).dtTransOffset = 46;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.o1gktkwf5w
                    section.data(32).logicalSrcIdx = 174;
                    section.data(32).dtTransOffset = 47;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.mftojpmhk4
                    section.data(33).logicalSrcIdx = 175;
                    section.data(33).dtTransOffset = 48;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.mzpqh2vdfb
                    section.data(34).logicalSrcIdx = 176;
                    section.data(34).dtTransOffset = 49;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.cc4oemevxd
                    section.data(35).logicalSrcIdx = 177;
                    section.data(35).dtTransOffset = 50;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.gqcp0i2mb4
                    section.data(36).logicalSrcIdx = 178;
                    section.data(36).dtTransOffset = 51;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.dclal1bmnw
                    section.data(37).logicalSrcIdx = 179;
                    section.data(37).dtTransOffset = 52;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.n4ve44gcoh
                    section.data(38).logicalSrcIdx = 180;
                    section.data(38).dtTransOffset = 55;

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.mras3opkdb
                    section.data(39).logicalSrcIdx = 181;
                    section.data(39).dtTransOffset = 58;

            nTotData = nTotData + section.nData;
            sigMap.sections(12) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtB.n2lxxqcgg4[3].cdz0vwtzpdl.j1k0d2o2h4
                    section.data(1).logicalSrcIdx = 182;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(13) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% rtB.e0fma3ayau1.nuh41wxn0w
                    section.data(1).logicalSrcIdx = 183;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.e0fma3ayau1.ijwq3brrz4
                    section.data(2).logicalSrcIdx = 184;
                    section.data(2).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            sigMap.sections(14) = section;
            clear section

            section.nData     = 7;
            section.data(7)  = dumData; %prealloc

                    ;% rtB.e0fma3ayau1.l104xnual1
                    section.data(1).logicalSrcIdx = 185;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.e0fma3ayau1.l12az3stgk
                    section.data(2).logicalSrcIdx = 186;
                    section.data(2).dtTransOffset = 2;

                    ;% rtB.e0fma3ayau1.lr21nhybup
                    section.data(3).logicalSrcIdx = 187;
                    section.data(3).dtTransOffset = 4;

                    ;% rtB.e0fma3ayau1.asrhskbxtm
                    section.data(4).logicalSrcIdx = 188;
                    section.data(4).dtTransOffset = 6;

                    ;% rtB.e0fma3ayau1.lgjoygnciy
                    section.data(5).logicalSrcIdx = 189;
                    section.data(5).dtTransOffset = 7;

                    ;% rtB.e0fma3ayau1.ajskuditcp
                    section.data(6).logicalSrcIdx = 190;
                    section.data(6).dtTransOffset = 8;

                    ;% rtB.e0fma3ayau1.kmaxtby45v
                    section.data(7).logicalSrcIdx = 191;
                    section.data(7).dtTransOffset = 12;

            nTotData = nTotData + section.nData;
            sigMap.sections(15) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtB.e0fma3ayau1.epoamlrzja.p1z4jzjbvh
                    section.data(1).logicalSrcIdx = 194;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(16) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtB.e0fma3ayau1.isgfynkqjw.p1z4jzjbvh
                    section.data(1).logicalSrcIdx = 195;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(17) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% rtB.b0oafc4epa55.in15ttdbct
                    section.data(1).logicalSrcIdx = 196;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.b0oafc4epa55.cydxr5upba
                    section.data(2).logicalSrcIdx = 197;
                    section.data(2).dtTransOffset = 3;

                    ;% rtB.b0oafc4epa55.daz2zss5gc
                    section.data(3).logicalSrcIdx = 198;
                    section.data(3).dtTransOffset = 4;

            nTotData = nTotData + section.nData;
            sigMap.sections(18) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtB.b0oafc4epa55.ebmwo0mdgk
                    section.data(1).logicalSrcIdx = 199;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(19) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% rtB.b0oafc4epa5.in15ttdbct
                    section.data(1).logicalSrcIdx = 200;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.b0oafc4epa5.cydxr5upba
                    section.data(2).logicalSrcIdx = 201;
                    section.data(2).dtTransOffset = 3;

                    ;% rtB.b0oafc4epa5.daz2zss5gc
                    section.data(3).logicalSrcIdx = 202;
                    section.data(3).dtTransOffset = 4;

            nTotData = nTotData + section.nData;
            sigMap.sections(20) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtB.b0oafc4epa5.ebmwo0mdgk
                    section.data(1).logicalSrcIdx = 203;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(21) = section;
            clear section


            ;%
            ;% Non-auto Data (signal)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        sigMap.nTotData = nTotData;



    ;%*******************
    ;% Create DWork Map *
    ;%*******************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 32;
        sectIdxOffset = 21;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc dworkMap
        ;%
        dworkMap.nSections           = nTotSects;
        dworkMap.sectIdxOffset       = sectIdxOffset;
            dworkMap.sections(nTotSects) = dumSection; %prealloc
        dworkMap.nTotData            = -1;

        ;%
        ;% Auto data (rtDW)
        ;%
            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.itautcby1t
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.llsff5iey1
                    section.data(1).logicalSrcIdx = 1;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.bfywtrujvk
                    section.data(1).logicalSrcIdx = 2;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.jtryrsd4lf
                    section.data(1).logicalSrcIdx = 3;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.jridowmstm
                    section.data(1).logicalSrcIdx = 4;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(5) = section;
            clear section

            section.nData     = 9;
            section.data(9)  = dumData; %prealloc

                    ;% rtDW.d1vf1pvdnr
                    section.data(1).logicalSrcIdx = 5;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.l1ssryyvmx
                    section.data(2).logicalSrcIdx = 6;
                    section.data(2).dtTransOffset = 9;

                    ;% rtDW.jbvbpmq1xi
                    section.data(3).logicalSrcIdx = 7;
                    section.data(3).dtTransOffset = 17;

                    ;% rtDW.jwmjvb1gsq
                    section.data(4).logicalSrcIdx = 8;
                    section.data(4).dtTransOffset = 25;

                    ;% rtDW.du0pxq2bfe
                    section.data(5).logicalSrcIdx = 9;
                    section.data(5).dtTransOffset = 26;

                    ;% rtDW.odhpjjs3qb
                    section.data(6).logicalSrcIdx = 10;
                    section.data(6).dtTransOffset = 27;

                    ;% rtDW.lzhq3izrk0
                    section.data(7).logicalSrcIdx = 11;
                    section.data(7).dtTransOffset = 28;

                    ;% rtDW.a1jomnvv0w
                    section.data(8).logicalSrcIdx = 12;
                    section.data(8).dtTransOffset = 29;

                    ;% rtDW.njltddwgg3.modelTStart
                    section.data(9).logicalSrcIdx = 13;
                    section.data(9).dtTransOffset = 30;

            nTotData = nTotData + section.nData;
            dworkMap.sections(6) = section;
            clear section

            section.nData     = 11;
            section.data(11)  = dumData; %prealloc

                    ;% rtDW.knnczm1loo.AQHandles
                    section.data(1).logicalSrcIdx = 14;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.ffvksv0qiv.TimePtr
                    section.data(2).logicalSrcIdx = 15;
                    section.data(2).dtTransOffset = 23;

                    ;% rtDW.bmdtacp0cy.TUbufferPtrs
                    section.data(3).logicalSrcIdx = 16;
                    section.data(3).dtTransOffset = 24;

                    ;% rtDW.nrkk55g5lf.TimePtr
                    section.data(4).logicalSrcIdx = 17;
                    section.data(4).dtTransOffset = 30;

                    ;% rtDW.pp4attafbv
                    section.data(5).logicalSrcIdx = 18;
                    section.data(5).dtTransOffset = 31;

                    ;% rtDW.hzlvzh2k3j
                    section.data(6).logicalSrcIdx = 19;
                    section.data(6).dtTransOffset = 32;

                    ;% rtDW.m5vjodt2wj
                    section.data(7).logicalSrcIdx = 20;
                    section.data(7).dtTransOffset = 33;

                    ;% rtDW.culj3unyhd
                    section.data(8).logicalSrcIdx = 21;
                    section.data(8).dtTransOffset = 34;

                    ;% rtDW.hqdkd0qvom
                    section.data(9).logicalSrcIdx = 22;
                    section.data(9).dtTransOffset = 35;

                    ;% rtDW.gw1octhf5m.LoggedData
                    section.data(10).logicalSrcIdx = 23;
                    section.data(10).dtTransOffset = 36;

                    ;% rtDW.kjcfkoikbv.LoggedData
                    section.data(11).logicalSrcIdx = 24;
                    section.data(11).dtTransOffset = 37;

            nTotData = nTotData + section.nData;
            dworkMap.sections(7) = section;
            clear section

            section.nData     = 27;
            section.data(27)  = dumData; %prealloc

                    ;% rtDW.b15gt53unz
                    section.data(1).logicalSrcIdx = 25;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.pixzc3oljz
                    section.data(2).logicalSrcIdx = 26;
                    section.data(2).dtTransOffset = 4;

                    ;% rtDW.h04sx1dkfi
                    section.data(3).logicalSrcIdx = 27;
                    section.data(3).dtTransOffset = 5;

                    ;% rtDW.dovhm5unul
                    section.data(4).logicalSrcIdx = 28;
                    section.data(4).dtTransOffset = 6;

                    ;% rtDW.pxykrwenlr
                    section.data(5).logicalSrcIdx = 29;
                    section.data(5).dtTransOffset = 7;

                    ;% rtDW.odmghcctis
                    section.data(6).logicalSrcIdx = 30;
                    section.data(6).dtTransOffset = 8;

                    ;% rtDW.kcvcsskptr
                    section.data(7).logicalSrcIdx = 31;
                    section.data(7).dtTransOffset = 9;

                    ;% rtDW.jiq5msx5pw
                    section.data(8).logicalSrcIdx = 32;
                    section.data(8).dtTransOffset = 10;

                    ;% rtDW.ldfvbvtevx
                    section.data(9).logicalSrcIdx = 33;
                    section.data(9).dtTransOffset = 11;

                    ;% rtDW.gxa1ivuu24
                    section.data(10).logicalSrcIdx = 34;
                    section.data(10).dtTransOffset = 12;

                    ;% rtDW.ly4ib1avym
                    section.data(11).logicalSrcIdx = 35;
                    section.data(11).dtTransOffset = 13;

                    ;% rtDW.ejprdguzqs
                    section.data(12).logicalSrcIdx = 36;
                    section.data(12).dtTransOffset = 14;

                    ;% rtDW.e52z4zlwgx
                    section.data(13).logicalSrcIdx = 37;
                    section.data(13).dtTransOffset = 15;

                    ;% rtDW.fi5xbril21
                    section.data(14).logicalSrcIdx = 38;
                    section.data(14).dtTransOffset = 16;

                    ;% rtDW.kcf5q2qge2
                    section.data(15).logicalSrcIdx = 39;
                    section.data(15).dtTransOffset = 17;

                    ;% rtDW.otxm1fxjsh
                    section.data(16).logicalSrcIdx = 40;
                    section.data(16).dtTransOffset = 18;

                    ;% rtDW.lagggpzidr
                    section.data(17).logicalSrcIdx = 41;
                    section.data(17).dtTransOffset = 19;

                    ;% rtDW.aebmwa0ddy
                    section.data(18).logicalSrcIdx = 42;
                    section.data(18).dtTransOffset = 20;

                    ;% rtDW.c4osaguvpc
                    section.data(19).logicalSrcIdx = 43;
                    section.data(19).dtTransOffset = 21;

                    ;% rtDW.c3p3mmpo2e
                    section.data(20).logicalSrcIdx = 44;
                    section.data(20).dtTransOffset = 22;

                    ;% rtDW.lx55nwdsze
                    section.data(21).logicalSrcIdx = 45;
                    section.data(21).dtTransOffset = 23;

                    ;% rtDW.oartlmxrm2
                    section.data(22).logicalSrcIdx = 46;
                    section.data(22).dtTransOffset = 24;

                    ;% rtDW.mrty4tzbyf
                    section.data(23).logicalSrcIdx = 47;
                    section.data(23).dtTransOffset = 25;

                    ;% rtDW.hlsknt4v0p
                    section.data(24).logicalSrcIdx = 48;
                    section.data(24).dtTransOffset = 26;

                    ;% rtDW.lhxoelvqa0
                    section.data(25).logicalSrcIdx = 49;
                    section.data(25).dtTransOffset = 27;

                    ;% rtDW.oqlqbiwpks
                    section.data(26).logicalSrcIdx = 50;
                    section.data(26).dtTransOffset = 28;

                    ;% rtDW.dlo31b5ncv
                    section.data(27).logicalSrcIdx = 51;
                    section.data(27).dtTransOffset = 36;

            nTotData = nTotData + section.nData;
            dworkMap.sections(8) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% rtDW.hppeg53im2
                    section.data(1).logicalSrcIdx = 52;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.pgqtwdzdtt
                    section.data(2).logicalSrcIdx = 53;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.krw1e2vruq
                    section.data(3).logicalSrcIdx = 54;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.ejw21jidiq
                    section.data(4).logicalSrcIdx = 55;
                    section.data(4).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            dworkMap.sections(9) = section;
            clear section

            section.nData     = 5;
            section.data(5)  = dumData; %prealloc

                    ;% rtDW.hm4jnufcya
                    section.data(1).logicalSrcIdx = 56;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.dadhjfyvf5
                    section.data(2).logicalSrcIdx = 57;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.nf1ixgefra
                    section.data(3).logicalSrcIdx = 58;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.eflz0zkkbh
                    section.data(4).logicalSrcIdx = 59;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.hhborlconl
                    section.data(5).logicalSrcIdx = 60;
                    section.data(5).dtTransOffset = 4;

            nTotData = nTotData + section.nData;
            dworkMap.sections(10) = section;
            clear section

            section.nData     = 7;
            section.data(7)  = dumData; %prealloc

                    ;% rtDW.bs12ltdsrz.PrevIndex
                    section.data(1).logicalSrcIdx = 61;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.mbrtl3jxep.Tail
                    section.data(2).logicalSrcIdx = 62;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.kpovwqahpf.PrevIndex
                    section.data(3).logicalSrcIdx = 63;
                    section.data(3).dtTransOffset = 14;

                    ;% rtDW.fl4ncoobbf
                    section.data(4).logicalSrcIdx = 64;
                    section.data(4).dtTransOffset = 15;

                    ;% rtDW.hazr2j5xfs
                    section.data(5).logicalSrcIdx = 65;
                    section.data(5).dtTransOffset = 16;

                    ;% rtDW.g0qwbb3rmr
                    section.data(6).logicalSrcIdx = 66;
                    section.data(6).dtTransOffset = 17;

                    ;% rtDW.ipvngnluti
                    section.data(7).logicalSrcIdx = 67;
                    section.data(7).dtTransOffset = 18;

            nTotData = nTotData + section.nData;
            dworkMap.sections(11) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.oeeefqcawl
                    section.data(1).logicalSrcIdx = 68;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(12) = section;
            clear section

            section.nData     = 16;
            section.data(16)  = dumData; %prealloc

                    ;% rtDW.p5vsv1vlfs
                    section.data(1).logicalSrcIdx = 69;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.nvl4rcxbze
                    section.data(2).logicalSrcIdx = 70;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.llyr5xqlde
                    section.data(3).logicalSrcIdx = 71;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.lb5nlzuul0
                    section.data(4).logicalSrcIdx = 72;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.bmulrsumwo
                    section.data(5).logicalSrcIdx = 73;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.bkn0e0m15r
                    section.data(6).logicalSrcIdx = 74;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.melou0gnot
                    section.data(7).logicalSrcIdx = 75;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.d4x3urfknt
                    section.data(8).logicalSrcIdx = 76;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.f2ysqhwpby
                    section.data(9).logicalSrcIdx = 77;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.coff0jzukp
                    section.data(10).logicalSrcIdx = 78;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.jh1z4qw2id
                    section.data(11).logicalSrcIdx = 79;
                    section.data(11).dtTransOffset = 10;

                    ;% rtDW.aqiwtrmxn4
                    section.data(12).logicalSrcIdx = 80;
                    section.data(12).dtTransOffset = 11;

                    ;% rtDW.gqpcxrozdd
                    section.data(13).logicalSrcIdx = 81;
                    section.data(13).dtTransOffset = 12;

                    ;% rtDW.gqe1uo1ywn
                    section.data(14).logicalSrcIdx = 82;
                    section.data(14).dtTransOffset = 13;

                    ;% rtDW.lsmdpslc2q
                    section.data(15).logicalSrcIdx = 83;
                    section.data(15).dtTransOffset = 14;

                    ;% rtDW.ciwimejv0h
                    section.data(16).logicalSrcIdx = 84;
                    section.data(16).dtTransOffset = 15;

            nTotData = nTotData + section.nData;
            dworkMap.sections(13) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% rtDW.hpl1qzrd3n
                    section.data(1).logicalSrcIdx = 85;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.p1qsipllhj
                    section.data(2).logicalSrcIdx = 86;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.h4dfd3utpn
                    section.data(3).logicalSrcIdx = 87;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            dworkMap.sections(14) = section;
            clear section

            section.nData     = 12;
            section.data(12)  = dumData; %prealloc

                    ;% rtDW.ptfrc5kzed
                    section.data(1).logicalSrcIdx = 88;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.pd0rz5i13z
                    section.data(2).logicalSrcIdx = 89;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.p40srx13bh
                    section.data(3).logicalSrcIdx = 90;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.b1ttbld44a
                    section.data(4).logicalSrcIdx = 91;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.jjf0m3camo
                    section.data(5).logicalSrcIdx = 92;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.kvwkotkk3o
                    section.data(6).logicalSrcIdx = 93;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.ndx3ymve0s
                    section.data(7).logicalSrcIdx = 94;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.geo3u0pz41
                    section.data(8).logicalSrcIdx = 95;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.jstskafrrt
                    section.data(9).logicalSrcIdx = 96;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.lcpfrlnezb
                    section.data(10).logicalSrcIdx = 97;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.ccfbe454ge
                    section.data(11).logicalSrcIdx = 98;
                    section.data(11).dtTransOffset = 10;

                    ;% rtDW.ofiulw2caf
                    section.data(12).logicalSrcIdx = 99;
                    section.data(12).dtTransOffset = 11;

            nTotData = nTotData + section.nData;
            dworkMap.sections(15) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.lpsrrvnkui.dgdbrcmdfi
                    section.data(1).logicalSrcIdx = 100;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(16) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.jk40hfhipqx.dgdbrcmdfi
                    section.data(1).logicalSrcIdx = 101;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(17) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.n2lxxqcgg4[3].cdz0vwtzpdl.bwedep1kq5
                    section.data(1).logicalSrcIdx = 102;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(18) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% rtDW.e0fma3ayau1.fiqkp1x5ab.TimePtr
                    section.data(1).logicalSrcIdx = 103;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.e0fma3ayau1.m20af3kcir.TimePtr
                    section.data(2).logicalSrcIdx = 104;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            dworkMap.sections(19) = section;
            clear section

            section.nData     = 5;
            section.data(5)  = dumData; %prealloc

                    ;% rtDW.e0fma3ayau1.jedjixn4wf
                    section.data(1).logicalSrcIdx = 105;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.e0fma3ayau1.ptz0olsknc
                    section.data(2).logicalSrcIdx = 106;
                    section.data(2).dtTransOffset = 2;

                    ;% rtDW.e0fma3ayau1.ligbfy0ydp
                    section.data(3).logicalSrcIdx = 107;
                    section.data(3).dtTransOffset = 4;

                    ;% rtDW.e0fma3ayau1.gmp0gvi1eg
                    section.data(4).logicalSrcIdx = 108;
                    section.data(4).dtTransOffset = 6;

                    ;% rtDW.e0fma3ayau1.pkseerw1ps
                    section.data(5).logicalSrcIdx = 109;
                    section.data(5).dtTransOffset = 7;

            nTotData = nTotData + section.nData;
            dworkMap.sections(20) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% rtDW.e0fma3ayau1.fwtojkoxil
                    section.data(1).logicalSrcIdx = 110;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.e0fma3ayau1.axf2ivmffy
                    section.data(2).logicalSrcIdx = 111;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            dworkMap.sections(21) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% rtDW.e0fma3ayau1.jrt4ahxcr3.PrevIndex
                    section.data(1).logicalSrcIdx = 112;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.e0fma3ayau1.fhqba1ac5a.PrevIndex
                    section.data(2).logicalSrcIdx = 113;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            dworkMap.sections(22) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.e0fma3ayau1.ngqa3cl3ch
                    section.data(1).logicalSrcIdx = 114;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(23) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% rtDW.e0fma3ayau1.drdqb2nbcf
                    section.data(1).logicalSrcIdx = 115;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.e0fma3ayau1.b34gs5nizr
                    section.data(2).logicalSrcIdx = 116;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.e0fma3ayau1.jdoajjowei
                    section.data(3).logicalSrcIdx = 117;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            dworkMap.sections(24) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.e0fma3ayau1.epoamlrzja.paemnr03id
                    section.data(1).logicalSrcIdx = 118;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(25) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.e0fma3ayau1.epoamlrzja.kosbuxw4nx
                    section.data(1).logicalSrcIdx = 119;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(26) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.e0fma3ayau1.isgfynkqjw.paemnr03id
                    section.data(1).logicalSrcIdx = 120;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(27) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.e0fma3ayau1.isgfynkqjw.kosbuxw4nx
                    section.data(1).logicalSrcIdx = 121;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(28) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.b0oafc4epa55.chbsydlnjm
                    section.data(1).logicalSrcIdx = 122;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(29) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.b0oafc4epa55.manwfisai4
                    section.data(1).logicalSrcIdx = 123;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(30) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.b0oafc4epa5.chbsydlnjm
                    section.data(1).logicalSrcIdx = 124;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(31) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.b0oafc4epa5.manwfisai4
                    section.data(1).logicalSrcIdx = 125;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(32) = section;
            clear section


            ;%
            ;% Non-auto Data (dwork)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        dworkMap.nTotData = nTotData;



    ;%
    ;% Add individual maps to base struct.
    ;%

    targMap.paramMap  = paramMap;
    targMap.signalMap = sigMap;
    targMap.dworkMap  = dworkMap;

    ;%
    ;% Add checksums to base struct.
    ;%


    targMap.checksum0 = 1303935297;
    targMap.checksum1 = 4210426834;
    targMap.checksum2 = 3603647867;
    targMap.checksum3 = 3267985234;

