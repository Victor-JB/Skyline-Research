#ifndef MultirotorModel_h_
#define MultirotorModel_h_
#ifndef MultirotorModel_COMMON_INCLUDES_
#define MultirotorModel_COMMON_INCLUDES_
#include <stdio.h>
#include "rtwtypes.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "sl_AsyncioQueue/AsyncioQueueCAPI.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "rt_nonfinite.h"
#include "math.h"
#include "sf_runtime/sfc_sdi.h"
#endif
#include "MultirotorModel_types.h"
#include "mwmathutil.h"
#include <stddef.h>
#include <string.h>
#include "rtGetNaN.h"
#include "model_reference_types.h"
#include "rtw_modelmap_simtarget.h"
typedef struct { real32_T gnlt55m3ed [ 3 ] ; real32_T bejzsjefxd ; real32_T
mynpe45avo ; uint8_T fn20wsba2b ; } puox5yk4dx ; typedef struct { gaz0rnib0a
beiugnlj4v ; boolean_T dlv4yaga4w ; } fcgolzjfxx ; typedef struct { real32_T
jk14oxzvfg ; } c5qh3bil5e ; typedef struct { real_T ghpb3rnkuz [ 2 ] ; real_T
msofhhoiyh ; real32_T czrpxoxeqd [ 2 ] ; real32_T k3s3klsvrv [ 2 ] ; real32_T
lmczud5gzw [ 2 ] ; real32_T hbdxbveej4 ; real32_T kpcfkhcxww ; real32_T
di3npfcpcn [ 4 ] ; real32_T lm0hdko0wo [ 16 ] ; c5qh3bil5e ole3zw1vlu ;
c5qh3bil5e oclgsvu3n2 ; } b3vr43zqnf ; typedef struct { struct { void *
TimePtr ; void * DataPtr ; void * RSimInfoPtr ; } m5slprcfm0 ; struct { void
* TimePtr ; void * DataPtr ; void * RSimInfoPtr ; } drpz2db4un ; real32_T
pwuv51bapc [ 2 ] ; real32_T eenrfbyhfi [ 2 ] ; real32_T l4rli4l33h [ 2 ] ;
real32_T cyhxayzpnu ; real32_T mldgdwhsmu ; struct { int_T PrevIndex ; }
fsewa5w3yi ; struct { int_T PrevIndex ; } ccg3kfjfr4 ; int8_T lsdazu5ckv ;
boolean_T lo3zwondhl ; } nl3x2fvj2x ; typedef struct { int8_T h5p4dga5rn ; }
lvi5rayxv3 ; typedef struct { int8_T oiwv5zx23i ; } jvg2tplwbt ; typedef
struct { real_T ffpnjnntyd [ 3 ] ; real_T om4sfoyayr [ 4 ] ; real_T
lojvfdklws [ 4 ] ; real_T a0iw033qlw ; real_T fbpvqwlywu ; real_T ad5c1rnwil
; real_T nwpehsyi00 [ 2 ] ; real_T efs22dk5bp [ 2 ] ; real_T nobtd3illq ;
real_T lunhuizmay ; real_T gmehut4egd ; real_T h2ebxc40mw ; real_T k25w2gkr0q
[ 3 ] ; real_T cfpe5o04fg [ 3 ] ; real_T ifopziuyrw [ 3 ] ; real_T cyoqsazroo
[ 3 ] ; real32_T jasoabdoqj ; } jiqv3fk12t ; typedef struct { boolean_T
f3xsg0hgbm ; } hcfrkq23ga ; typedef struct { real_T axhhixrx0w ; } egplgpzezy
; typedef struct { jiqv3fk12t ojzok3fjk5n ; } ezmzidsxiv ; typedef struct {
hcfrkq23ga ojzok3fjk5n ; } iyv2cwlfpo ; typedef struct { egplgpzezy
ojzok3fjk5n ; } mjmuymlqxm ; typedef struct { EnvironmentBus clvriwq2jv ;
gps_raw_int ogr03skp4n ; innerLoopCmdsBus cqw0od3b1l ; innerLoopCmdsBus
nzj0ygxoo0 ; real_T fzipajnl1y ; real_T facv3gd4ph [ 3 ] ; real_T etls5llv0v
[ 3 ] ; real_T cvxnooohho [ 3 ] ; real_T gosbeot1je [ 3 ] ; real_T d5prl5rx0s
[ 3 ] ; real_T hkk4bn3bah ; real_T d1mjosn1jy [ 2 ] ; real_T czazuuvzwc ;
real_T nbyeszy5ad [ 3 ] ; real_T ne4dbnn01h [ 3 ] ; real_T dcqoty43yh [ 3 ] ;
real_T cxf3eqpqf0 [ 3 ] ; real_T ojd13dfhwc [ 3 ] ; real_T kfgdktms5b ;
real_T be04fqrqon ; real_T lpvhmncuko [ 2 ] ; real_T nte3bxdf3g ; real_T
dytvvdzk2y ; real_T nco1syudhq ; real_T fwc133zdfu ; real_T btb0xcs3i4 ;
real_T ihn3jwjjda ; real_T o5jdtk32b2 ; real_T o0ev1kejnw ; real_T hluxwihtam
[ 9 ] ; real_T lhlffgvoyy [ 9 ] ; real_T cn4ip21n1x [ 9 ] ; real_T d42vnzi0zl
[ 12 ] ; real_T ewv25whzo3 ; real_T gon413nd0k ; real_T e0kbkyyhfa ; real_T
kvgi3mwzsb ; real_T dzexbfjmom ; real_T jwjzdwnv3t ; real_T c2ta5btcrx ;
real_T j2ml4dp3ve ; real_T kpjw5vunnx [ 12 ] ; real_T how4kqc5op [ 12 ] ;
real_T ghmgohrf2k ; real_T affyde1pvj ; real_T mnrbnpouyh ; real_T osxutjsz42
; real_T nzmx2pun1j ; real_T a14ehr2k1u ; real_T oe5prqdkqs ; real_T
kwjypsg3ab ; real_T d3qxbw4uhn ; real_T n1qmcujczy ; real_T p33eoftkza ;
real_T pahdkk4lef ; real_T c2clvfmih3 [ 13 ] ; real_T gd42py3zop [ 13 ] ;
real_T njpl5vq0dj ; real_T o1j0yfhi5w ; real_T iehrirdefv ; real_T grhklnpkyq
; real_T jbilfgg3jq ; real_T p3z4e1ttuf ; real_T h2hq0mng1q ; real_T
atkmoztwzd ; real_T bt0rpzswts ; real_T jyhf454lo3 ; real_T mfunp0ogrz ;
real_T gi5qnl2vzc [ 4 ] ; real_T lsfszksxrh ; real_T gqwyq0qtsx ; real_T
lzkscxitz3 ; real_T aidazj5jmk ; real_T h5k1a0bc5g [ 169 ] ; real_T
cy50zvrwkj [ 169 ] ; real_T a10ohyridf [ 169 ] ; real_T jq2k0ajc0f [ 169 ] ;
real_T b5qimer01k ; real_T bb4c2uz1fk [ 169 ] ; real_T oqgz3xg3vj ; real_T
ljwucxsm2g [ 169 ] ; real_T des031cigc [ 13 ] ; real_T o0eybgngpk ; real_T
gdyk3fgefv [ 13 ] ; real_T nhfexqkald [ 13 ] ; uint32_T nxjluz1c5u ; real32_T
inaps1sa52 [ 4 ] ; real32_T biprlgugn1 ; real32_T ixh42dcpys ; real32_T
epgwva0ssb ; real32_T p3yy5vvkri ; real32_T oynscw3j2s ; real32_T kb0i3g1yaj
[ 4 ] ; real32_T frmmpfacvd [ 3 ] ; real32_T otc30laitr [ 3 ] ; real32_T
knxhxlkpdw [ 3 ] ; real32_T hgv0pudxcg [ 3 ] ; uint8_T bygez1zf0b ; boolean_T
igvpnni2ea ; boolean_T omrf1y4uzc ; boolean_T nwzwctdqjn ; boolean_T
fcryvdcaov ; ezmzidsxiv lo2wwx0xpo [ 4 ] ; b3vr43zqnf cc3wuemuhb3 ;
puox5yk4dx b1ucvg2jbgvb ; puox5yk4dx b1ucvg2jbgv ; } nrk2rvahtg ; typedef
struct { npbdddxwgn a3csxs1ekv ; p1rtyy4dfj njcnler2yh ; nchh0risbu
lbgwftm541 ; gps_raw_int g5ilqsa3in ; innerLoopCmdsBus o1qxpmu0db ; real_T
o25vuem2xm [ 2 ] ; real_T jf3p2di2qy ; real_T itwj3q5so0 [ 4 ] ; real_T
feliw2frco ; real_T agp0obdtua ; real_T p3bhrcoevi ; real_T eemz1jsfof ;
real_T ijknf0mifk [ 169 ] ; real_T dbqsegushi [ 169 ] ; real_T fz4smffnky [
169 ] ; real_T jj5vdn2ehz [ 169 ] ; real_T f3afcfgx33 [ 13 ] ; real_T
logl03et3e [ 9 ] ; real_T jbketgxzrl [ 8 ] ; real_T nf3thn1mzj [ 8 ] ; real_T
h4ntmfppzl ; real_T bfeusamdhe ; real_T exxzjpoifx ; real_T aunodqze2f ;
struct { real_T modelTStart ; real_T TUbufferArea [ 6144 ] ; } kezvpmwazj ;
struct { void * TimePtr ; void * DataPtr ; void * RSimInfoPtr ; } nrljllwkmz
; struct { void * TUbufferPtrs [ 6 ] ; } f3kyhea3zp ; struct { void * TimePtr
; void * DataPtr ; void * RSimInfoPtr ; } owdavr0l2b ; real32_T kmlq4dtkp2 [
4 ] ; real32_T ne2ywmnirx ; real32_T fbbw2f5fzh ; real32_T lhg2hjpap5 ;
real32_T i3ouw0b2ew ; real32_T djvgx5nkpv ; real32_T gqd2pn004h ; real32_T
l3qswdbnok ; real32_T lrflgojall ; real32_T n1ejg0lg1f ; real32_T pef21seckx
; real32_T pz5xlztrum ; real32_T na5jazqsps ; real32_T ofa4pwguke ; real32_T
lrftpeh5ax ; real32_T h34vzdryrf ; real32_T l0eiej3pun ; real32_T afxmwpvxdd
; real32_T pbf205mpk5 ; real32_T kh012c4vpo ; real32_T lmawlit2gx ; real32_T
htnygn3ppt ; real32_T bh55tdfuku ; real32_T fvtyh14bo4 ; real32_T noagmga5vo
; real32_T encspzdomp ; real32_T piqwe21de4 ; real32_T ah3udkc1pn ; real32_T
kdmyqy32wo ; real32_T bi2ehhcqpf ; real32_T gclntfkrqm [ 8 ] ; real32_T
a1gjc5prvd [ 8 ] ; uint32_T fkbw52q4eu ; uint32_T bkgctw34na ; struct { int_T
PrevIndex ; } m3cjmkzn21 ; struct { int_T Tail [ 3 ] ; int_T Head [ 3 ] ;
int_T Last [ 3 ] ; int_T CircularBufSize [ 3 ] ; } orbty1vgax ; struct {
int_T PrevIndex ; } pxbdkgfalw ; int_T fcv2c552es ; int_T ndcugeioso ; int_T
gaylem4do4 ; int_T aasm1kiapr ; uint8_T erhqa1tt1r ; int8_T db3c022w4r ;
int8_T of5k5ym2p5 ; int8_T elmpjuftel ; int8_T km53nx2zvi ; int8_T i5guyz4xjy
; int8_T hpw5yqselj ; int8_T fkfh1kxwym ; int8_T f0vichqqxp ; int8_T
psrx45dbwy ; int8_T hcmznoq4tz ; int8_T klya42pcvb ; int8_T mvxpoic5ak ;
int8_T hmbm1pddqc ; int8_T etezsnnpev ; int8_T lk5u5rb4sy ; int8_T bd50mkgxyq
; int8_T gxoe3dqp51 ; int8_T kxzr3k2mwt ; int8_T kuhdldet55 ; int8_T
gj3zgzcatp ; int8_T l31dtbu52b ; int8_T hdgs5p0yps ; int8_T mlkixgndwj ;
int8_T ndgmnq0b2t ; int8_T mce04sfrwz ; int8_T n3n24lpzpj ; int8_T lrxmlhyw2n
; int8_T cckidp4t4s ; int8_T ocku22yr4z ; int8_T jvjimxfbp5 ; int8_T
kl3xr1yv3o ; int8_T burujs2j5i ; int8_T hhmffbtfcj ; int8_T cmv1yw2ols ;
int8_T ek4c1nh2xf ; int8_T ptdyfnda4e ; int8_T f4ztkjnbb1 ; int8_T krwauhi5zr
; int8_T i0plxo5m5v ; int8_T l1ustp411h ; int8_T lcugsuhajg ; int8_T
jla3yeenuz ; uint8_T g4jyuqfbqk [ 6 ] ; uint8_T oor0sk0zxt ; uint8_T
iy2vlvch1h ; uint8_T imb0pn2eqr ; uint8_T bt22cow1e2 ; uint8_T nthtlzxgrq ;
boolean_T mzbme2x4be ; boolean_T mnfeynmrcu ; boolean_T morg3c2pxr ;
boolean_T czozu12nuu ; boolean_T l213nbvc25 ; boolean_T fqek1ii4kr ;
boolean_T ijo5pfrlcb ; boolean_T mnnal3chtb ; boolean_T dwxqfgls30 ;
boolean_T iq41sdaesi ; boolean_T p5vp3loenp ; boolean_T niihk4hdj4 ;
boolean_T d3szkcsaec ; jvg2tplwbt nyeucfzgjg ; lvi5rayxv3 ofd0zs2gcf ;
lvi5rayxv3 pdjqiq5pg3 ; iyv2cwlfpo lo2wwx0xpo [ 4 ] ; jvg2tplwbt e2a4rdzruxj
; lvi5rayxv3 a4xxuu2i5kn ; nl3x2fvj2x cc3wuemuhb3 ; fcgolzjfxx b1ucvg2jbgvb ;
fcgolzjfxx b1ucvg2jbgv ; } ly14ibumw1 ; typedef struct { real_T hnct3z1vrz [
3 ] ; real_T kmx224b1dx [ 3 ] ; real_T fnjqygdgt3 [ 3 ] ; real_T gbdxnwrxqp [
3 ] ; } dbyqsu3sbk ; typedef int_T oghvx3e5oa [ 3 ] ; typedef real_T
hfqjownrmo [ 6 ] ; typedef struct { real_T hnct3z1vrz [ 3 ] ; real_T
kmx224b1dx [ 3 ] ; real_T fnjqygdgt3 [ 3 ] ; real_T gbdxnwrxqp [ 3 ] ; }
pzcew1lt2d ; typedef struct { boolean_T hnct3z1vrz [ 3 ] ; boolean_T
kmx224b1dx [ 3 ] ; boolean_T fnjqygdgt3 [ 3 ] ; boolean_T gbdxnwrxqp [ 3 ] ;
} lyxy2ucrzi ; typedef struct { real_T hnct3z1vrz [ 3 ] ; real_T kmx224b1dx [
3 ] ; real_T fnjqygdgt3 [ 3 ] ; real_T gbdxnwrxqp [ 3 ] ; } emw0epsbse ;
typedef struct { real_T hnct3z1vrz [ 3 ] ; real_T kmx224b1dx [ 3 ] ; real_T
fnjqygdgt3 [ 3 ] ; real_T gbdxnwrxqp [ 3 ] ; } cgce5qnfxs ; typedef struct {
real_T hnct3z1vrz [ 3 ] ; real_T kmx224b1dx [ 3 ] ; real_T fnjqygdgt3 [ 3 ] ;
real_T gbdxnwrxqp [ 3 ] ; } eudipdqa5r ; typedef struct { real_T lmk3wt01pt ;
real_T lttnj4e32p ; real_T b4fkmeyuwp ; real_T alyrx15qr3 ; real_T m2wqngitiv
; real_T j5452oxuf0 ; real_T iscyu11ki3 ; real_T pmmmojtnj1 ; mjmuymlqxm
lo2wwx0xpo [ 4 ] ; real_T mkfred1ofa ; real_T m5f01nurr1 ; real_T fcvqgxlyzo
; } guifzd0yex ; struct bviejcbtrp_ { real32_T P_0 [ 2 ] ; real32_T P_1 [ 2 ]
; real32_T P_2 ; real32_T P_3 ; real32_T P_4 ; real32_T P_5 ; real32_T P_6 ;
real32_T P_7 ; real32_T P_8 ; real32_T P_9 ; real32_T P_10 ; real32_T P_11 ;
real32_T P_12 ; real32_T P_13 [ 2 ] ; real32_T P_14 ; real32_T P_15 ;
real32_T P_16 ; real32_T P_17 ; real32_T P_18 ; real32_T P_19 ; real32_T P_20
; real32_T P_21 [ 2 ] ; real32_T P_22 ; real32_T P_23 ; real32_T P_24 ;
real32_T P_25 ; real32_T P_26 ; real32_T P_27 ; real32_T P_28 ; real32_T P_29
; real32_T P_30 ; real32_T P_31 ; real32_T P_32 ; real32_T P_33 ; real32_T
P_34 ; real32_T P_35 ; real32_T P_36 ; real32_T P_37 ; real32_T P_38 ;
real32_T P_39 ; real32_T P_40 ; real32_T P_41 ; real32_T P_42 ; real32_T P_43
[ 4 ] ; real32_T P_44 ; real32_T P_45 [ 16 ] ; real32_T P_46 ; real32_T P_47
; int8_T P_48 ; int8_T P_49 ; int8_T P_50 ; int8_T P_51 ; int8_T P_52 ;
int8_T P_53 ; int8_T P_54 ; int8_T P_55 ; } ; struct dz0n2amz1v_ { real_T P_0
; } ; struct oqnzyv23fp_ { real_T P_0 ; real_T P_1 ; real_T P_2 ; real_T P_3
; real_T P_4 ; real_T P_5 ; real_T P_6 [ 2 ] ; real_T P_7 ; real32_T P_8 ;
real32_T P_9 ; real32_T P_10 ; } ; struct b31jzqt0yw_ { oqnzyv23fp
ojzok3fjk5n ; } ; struct iiy2tsharng_ { real_T P_6 [ 3 ] ; real_T P_7 ;
real_T P_8 ; real_T P_9 ; real_T P_10 ; real_T P_11 ; real_T P_12 ; real_T
P_13 ; real_T P_14 ; real_T P_15 ; real_T P_16 ; real_T P_17 [ 3 ] ; real_T
P_18 ; real_T P_19 ; real_T P_20 ; real_T P_21 ; real_T P_22 ; real_T P_23 ;
real_T P_24 ; real_T P_25 ; real_T P_26 [ 3 ] ; real_T P_27 ; uint8_T P_28 ;
uint8_T P_29 ; gps_raw_int P_30 ; innerLoopCmdsBus P_31 ; real_T P_32 ;
real_T P_33 ; real_T P_34 ; real_T P_35 ; real_T P_36 ; real_T P_37 ; real_T
P_38 ; real_T P_39 ; real_T P_40 ; real_T P_41 [ 13 ] ; real_T P_42 ; real_T
P_43 [ 13 ] ; real_T P_44 [ 169 ] ; real_T P_45 ; real_T P_46 [ 13 ] ; real_T
P_47 ; real_T P_48 ; real_T P_49 ; real_T P_50 ; real_T P_51 ; real_T P_52 ;
real_T P_53 ; real_T P_54 ; real_T P_55 ; real_T P_56 [ 169 ] ; real_T P_57 [
169 ] ; real_T P_58 [ 169 ] ; real_T P_59 [ 169 ] ; real_T P_60 [ 169 ] ;
real_T P_61 ; real_T P_62 ; real_T P_63 ; real_T P_64 [ 169 ] ; real_T P_65 [
169 ] ; real_T P_66 [ 169 ] ; real_T P_67 [ 169 ] ; real_T P_68 [ 169 ] ;
real_T P_69 [ 169 ] ; real_T P_70 ; real_T P_71 ; real_T P_72 ; real_T P_73 ;
real_T P_74 ; real_T P_75 ; real_T P_76 ; real_T P_77 ; real_T P_78 ; real_T
P_79 ; real_T P_80 ; real_T P_81 [ 13 ] ; real_T P_82 [ 13 ] ; real_T P_83 ;
real_T P_84 [ 4 ] ; real_T P_85 ; real_T P_86 [ 4 ] ; real_T P_87 ; real_T
P_88 ; real_T P_89 ; real_T P_90 ; real_T P_91 ; real_T P_92 ; real_T P_93 ;
real_T P_94 ; real_T P_95 ; real_T P_96 [ 11 ] ; real_T P_97 [ 11 ] ; real_T
P_98 ; real_T P_99 ; real_T P_100 ; real_T P_101 [ 11 ] ; real_T P_102 [ 11 ]
; real_T P_103 [ 13 ] ; real_T P_104 [ 13 ] ; real_T P_105 ; real_T P_106 ;
real_T P_107 ; real_T P_108 ; real_T P_109 ; real_T P_110 ; real_T P_111 ;
real_T P_112 ; real_T P_113 ; real_T P_114 ; real_T P_115 ; real_T P_116 ;
real_T P_117 ; real_T P_118 ; real_T P_119 ; real_T P_120 ; real_T P_121 ;
real_T P_122 ; real_T P_123 ; real_T P_124 ; real_T P_125 ; real_T P_126 ;
real_T P_127 ; real_T P_128 ; real_T P_129 ; real_T P_130 ; real_T P_131 ;
real_T P_132 ; real_T P_133 ; real_T P_134 ; real_T P_135 ; real_T P_136 ;
real_T P_137 [ 2 ] ; real_T P_138 ; real_T P_139 ; real_T P_140 ; real_T
P_141 ; real_T P_142 ; real_T P_143 ; real_T P_144 ; real_T P_145 [ 9 ] ;
real_T P_146 [ 3 ] ; real_T P_147 [ 3 ] ; real_T P_148 [ 3 ] ; real_T P_149 [
3 ] ; real_T P_150 ; real_T P_151 ; real_T P_152 ; real_T P_153 ; real_T
P_154 ; real_T P_155 ; real_T P_156 ; real_T P_157 ; real_T P_158 ; real_T
P_159 ; real_T P_160 ; real_T P_161 ; real_T P_162 ; real_T P_163 ; real_T
P_164 ; real_T P_165 ; real_T P_166 ; real_T P_167 ; real_T P_168 ; real_T
P_169 ; real_T P_170 ; real_T P_171 ; real_T P_172 ; real_T P_173 ; int32_T
P_174 ; int32_T P_175 ; int32_T P_176 ; int32_T P_177 ; int32_T P_178 ;
int32_T P_179 ; int32_T P_180 ; int32_T P_181 ; int32_T P_182 ; int32_T P_183
; int32_T P_184 ; int32_T P_185 ; int32_T P_186 ; int32_T P_187 ; int32_T
P_188 ; int32_T P_189 ; int32_T P_190 ; int32_T P_191 ; int32_T P_192 ;
int32_T P_193 ; int32_T P_194 ; int32_T P_195 ; int32_T P_196 ; int32_T P_197
; int32_T P_198 ; int32_T P_199 ; int32_T P_200 ; int32_T P_201 ; int32_T
P_202 ; int32_T P_203 ; int32_T P_204 ; int32_T P_205 ; int32_T P_206 ;
real32_T P_207 ; real32_T P_208 ; real32_T P_209 ; real32_T P_210 ; real32_T
P_211 ; real32_T P_212 ; real32_T P_213 ; real32_T P_214 ; real32_T P_215 ;
real32_T P_216 ; real32_T P_217 ; real32_T P_218 ; real32_T P_219 ; real32_T
P_220 [ 3 ] ; real32_T P_221 [ 4 ] ; real32_T P_222 ; real32_T P_223 ;
real32_T P_224 [ 4 ] ; real32_T P_225 ; real32_T P_226 ; real32_T P_227 ;
real32_T P_228 ; real32_T P_229 ; real32_T P_230 ; real32_T P_231 ; real32_T
P_232 ; real32_T P_233 ; real32_T P_234 ; real32_T P_235 ; real32_T P_236 ;
real32_T P_237 ; real32_T P_238 ; real32_T P_239 ; real32_T P_240 ; real32_T
P_241 ; real32_T P_242 ; real32_T P_243 ; real32_T P_244 ; real32_T P_245 ;
uint32_T P_246 ; uint32_T P_247 ; uint32_T P_248 ; uint32_T P_249 ; uint16_T
P_250 ; uint16_T P_251 ; boolean_T P_252 ; boolean_T P_253 ; boolean_T P_254
; boolean_T P_255 ; uint8_T P_256 ; uint8_T P_257 ; uint8_T P_258 ; uint8_T
P_259 ; uint8_T P_260 ; uint8_T P_261 ; dz0n2amz1v nyeucfzgjg ; b31jzqt0yw
lo2wwx0xpo ; dz0n2amz1v e2a4rdzruxj ; bviejcbtrp cc3wuemuhb3 ; } ; struct
plpkgxtjd5 { struct SimStruct_tag * _mdlRefSfcnS ; struct { real_T
mr_nonContSig0 [ 2 ] ; real_T mr_nonContSig1 [ 3 ] ; real_T mr_nonContSig2 [
3 ] ; real_T mr_nonContSig3 [ 3 ] ; real_T mr_nonContSig4 [ 1 ] ; real_T
mr_nonContSig5 [ 1 ] ; real32_T mr_nonContSig6 [ 1 ] ; real_T mr_nonContSig7
[ 3 ] ; real_T mr_nonContSig8 [ 1 ] ; real_T mr_nonContSig9 [ 1 ] ; real32_T
mr_nonContSig10 [ 1 ] ; real_T mr_nonContSig11 [ 3 ] ; real_T mr_nonContSig12
[ 1 ] ; real_T mr_nonContSig13 [ 1 ] ; real32_T mr_nonContSig14 [ 1 ] ;
real_T mr_nonContSig15 [ 3 ] ; real_T mr_nonContSig16 [ 1 ] ; real_T
mr_nonContSig17 [ 1 ] ; real32_T mr_nonContSig18 [ 1 ] ; EnvironmentBus
mr_nonContSig19 [ 1 ] ; EnvironmentBus mr_nonContSig20 [ 1 ] ; }
NonContDerivMemory ; ssNonContDerivSigInfo nonContDerivSignal [ 21 ] ; const
rtTimingBridge * timingBridge ; struct { rtwCAPI_ModelMappingInfo mmi ;
rtwCAPI_ModelMapLoggingInstanceInfo mmiLogInstanceInfo ; void * dataAddress [
22 ] ; int32_T * vardimsAddress [ 22 ] ; RTWLoggingFcnPtr loggingPtrs [ 22 ]
; sysRanDType * systemRan [ 60 ] ; int_T systemTid [ 60 ] ; } DataMapInfo ;
struct { int_T mdlref_GlobalTID [ 6 ] ; time_T tStart ; } Timing ; } ;
typedef struct { nrk2rvahtg rtb ; ly14ibumw1 rtdw ; hv4jthdiag rtm ; }
lacdxp2wo3g ; extern struct_OSJpyIZcrpXqReVWwh9iuG
rtP__Vehicle2f2uavPackageDeliveryDataDict_sldd_ ; extern
struct_hE1099BMemg5OfzqcWAA6G
rtP__initialConditions2f2uavPackageDeliveryDataDict_sldd_ ; extern real_T
rtP__uavIC_latLon2f2uavPackageDeliveryDataDict_sldd_ [ 2 ] ; extern real_T
rtP_mass_param ; extern real_T rtP_motor_delay_time ; extern real_T
rtP_startFlightTime ; extern void aejlhnfdgm ( SimStruct * _mdlRefSfcnS ,
ssNonContDerivSigFeedingOutports * * mr_nonContOutputArray , int_T
mdlref_TID0 , int_T mdlref_TID1 , int_T mdlref_TID2 , int_T mdlref_TID3 ,
int_T mdlref_TID4 , int_T mdlref_TID5 , hv4jthdiag * const jtlvsdau42 ,
nrk2rvahtg * localB , ly14ibumw1 * localDW , dbyqsu3sbk * localX , void *
sysRanPtr , int contextTid , rtwCAPI_ModelMappingInfo * rt_ParentMMI , const
char_T * rt_ChildPath , int_T rt_ChildMMIIdx , int_T rt_CSTATEIdx ) ; extern
void mr_MultirotorModel_MdlInfoRegFcn ( SimStruct * mdlRefSfcnS , char_T *
modelName , int_T * retVal ) ; extern mxArray * mr_MultirotorModel_GetDWork ( const lacdxp2wo3g * mdlrefDW ) ; extern void mr_MultirotorModel_SetDWork ( lacdxp2wo3g * mdlrefDW , const mxArray * ssDW ) ; extern void mr_MultirotorModel_RegisterSimStateChecksum ( SimStruct * S ) ; extern mxArray * mr_MultirotorModel_GetSimStateDisallowedBlocks ( ) ; extern const rtwCAPI_ModelMappingStaticInfo * MultirotorModel_GetCAPIStaticMap ( void ) ; extern void b3hn4m1dyc ( fcgolzjfxx * localDW ) ; extern void cet5pca4kn ( fcgolzjfxx * localDW ) ; extern void b1ucvg2jbg ( const real32_T nnq2lazvlo [ 4 ] , const real32_T gmffrwvmex [ 8 ] , real32_T arohmppg2e , puox5yk4dx * localB , fcgolzjfxx * localDW ) ; extern void l55wzvjjqc ( real32_T oesrxxnrlo , c5qh3bil5e * localB ) ; extern void bfu5pfw14l ( b3vr43zqnf * localB , nl3x2fvj2x * localDW , bviejcbtrp * localP ) ; extern void d2spgphbn3 ( nl3x2fvj2x * localDW , bviejcbtrp * localP ) ; extern void oju0232xer ( nl3x2fvj2x * localDW ) ; extern void llfhufynvg ( nl3x2fvj2x * localDW ) ; extern void d3dnfudvzk ( hv4jthdiag * const jtlvsdau42 , b3vr43zqnf * localB , nl3x2fvj2x * localDW , bviejcbtrp * localP ) ; extern void cc3wuemuhb ( hv4jthdiag * const jtlvsdau42 , real_T itl1ralcca , const innerLoopCmdsBus * p54m3jlo3s , real32_T ai30edxr0a , real32_T jddy2uyjml , real32_T kkyuwiyejt , real32_T ahqkkvqlkl , real32_T bmul0k3ina , real32_T ocms1yye0f , real32_T f3kzfzwy5x , real32_T lpx4smxhid , real32_T kwnbvp00km , real32_T bhiaryli4k , real32_T fe1y2usbeu , real32_T khizbtqxzp , b3vr43zqnf * localB , nl3x2fvj2x * localDW , bviejcbtrp * localP ) ; extern void cc3wuemuhbTID5 ( hv4jthdiag * const jtlvsdau42 , b3vr43zqnf * localB , nl3x2fvj2x * localDW , bviejcbtrp * localP ) ; extern void h5gwxi4otx ( hv4jthdiag * const jtlvsdau42 ) ; extern void m4iydjmjsp ( hv4jthdiag * const jtlvsdau42 ) ; extern void a4xxuu2i5k ( real_T i3k5wriocr , real_T dwavvda3fv , real_T * pxdzfjiywa ) ; extern void kei4tnmcyb ( hv4jthdiag * const jtlvsdau42 ) ; extern void myk05dcde1 ( hv4jthdiag * const jtlvsdau42 ) ; extern void e2a4rdzrux ( hv4jthdiag * const jtlvsdau42 , real_T * o05ccwe33k , dz0n2amz1v * localP ) ; extern void ckgvooous4 ( jiqv3fk12t * localB ) ; extern void k1la1e4o2r ( jiqv3fk12t * localB , egplgpzezy * localZCSV ) ; extern void ojzok3fjk5 ( hv4jthdiag * const jtlvsdau42 , const real_T hwwt1vltsc [ 3 ] , const real_T kqjxn3eqzs [ 3 ] , real_T hsjtwvwuvk , real32_T dccv1ehovc , const real_T mu0unnycfz [ 3 ] , jiqv3fk12t * localB , hcfrkq23ga * localDW , oqnzyv23fp * localP ) ; extern void fodvfnvwzh ( uavPathManagerBus opszijd2q5 [ 2 ] , nrk2rvahtg * localB , ly14ibumw1 * localDW , dbyqsu3sbk * localX ) ; extern void ovar5ql1uc ( nrk2rvahtg * localB , ly14ibumw1 * localDW , dbyqsu3sbk * localX ) ; extern void kc0svyewlp ( hv4jthdiag * const jtlvsdau42 , nrk2rvahtg * localB , ly14ibumw1 * localDW ) ; extern void fmhobljpby ( nrk2rvahtg * localB , pzcew1lt2d * localXdot ) ; extern void hplavxsbbo ( nrk2rvahtg * localB , guifzd0yex * localZCSV ) ; extern void kt1xdc3hp0 ( hv4jthdiag * const jtlvsdau42 , nrk2rvahtg * localB , ly14ibumw1 * localDW ) ; extern void hnayfzj5xb ( hv4jthdiag * const jtlvsdau42 , nrk2rvahtg * localB , ly14ibumw1 * localDW ) ; extern void MultirotorModel ( hv4jthdiag * const jtlvsdau42 , const uavPathManagerBus arhyjypbb1 [ 42 ] , uavStateBus * jpu0mg4a3o , uavPathManagerBus opszijd2q5 [ 2 ] , nrk2rvahtg * localB , ly14ibumw1 * localDW , dbyqsu3sbk * localX ) ; extern void MultirotorModelTID5 ( hv4jthdiag * const jtlvsdau42 , nrk2rvahtg * localB , ly14ibumw1 * localDW ) ; extern void aw1j1mqjpo ( hv4jthdiag * const jtlvsdau42 ) ; extern const uavPathManagerBus MultirotorModel_rtZuavPathManagerBus ; extern const innerLoopCmdsBus MultirotorModel_rtZinnerLoopCmdsBus ; extern const EnvironmentBus MultirotorModel_rtZEnvironmentBus ;
#endif
