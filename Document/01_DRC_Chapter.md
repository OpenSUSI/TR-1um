# Chapter 1 : 00_Layers.drc and 01_Basics.drc

## [00_Layers.drc](../tech/drc/00_Layers.drc)

Loading layer by layer GDSII data while implementing **waiver** capability to ignore the DRC checking area, such as the Shield Ring. **ESD** is also a recognition area, especially for ESD device, which has special rules. I would respect the original "TR-1um MASK Layer name" as an implementation to avoid further confusion. 

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# Input layers
#
MASK  = input(63,63)               # DRC check waiver area
ESD   = input(63,62)               # IO/ESD area recognition
#
PSUB  = input(140, 0).not(MASK)    # Nwell/Pwell
NW    = input(36,  0).not(MASK)    # N-well mask
HVNW  = input(141, 0).not(MASK)    # HV N-well mask
L     = input(3,   0).not(MASK)    # Acitive = inverse LOCOS 
...
CONT  = input(11,  0).not(MASK)    # Contact
M1    = input(13,  0).not(MASK)    # Metal-1
TC    = input(19,  0).not(MASK)    # Via1
M2    = input(20,  0).not(MASK)    # Metal-2
PRO   = input(14,  0).not(MASK)    # PAD
#
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  Bounding box
#
BBOX  = extent
```
**BBOX** is boundary box of GDSII active area to generate inverse data from the original shape.

## [01_Basics.drc](../tech/drc/00_Basics.drc)

Loading layer by layer GDSII data while implementing **waiver** capability to ignore the DRC checking area, such as the Shield Ring. **ESD** is also a recognition area, especially for ESD device, which has special rules. I would respect the original "TR-1um MASK Layer name" as an implementation to avoid further confusion. 

```
# --------- --------- --------- --------- --------- --------- ---------
#  Check NO support Layers
#
(RHP ).output( "ERR01: CANNOT EXIST RHP " )
(HPBE).output( "ERR01: CANNOT EXIST HPBE" )
(HNBE).output( "ERR01: CANNOT EXIST HNBE" )
#(HPM ).output( "ERR01: CANNOT EXIST HPM " )
```
**RHP**, **HPBE**, **HNBE**, and **HPM** are all NOT supported in TR-1um and should not exist the GDSII data, besides **HPM** need to cover whole area because of inversed MASK. 

### Off grid check

TOKAI RIKA recommended using a **0.05um** grid in the [document](../openIP62/IP62/Technology/doc/OS00_リファレンスマニュアル_rev1.1.pdf), so we should check the Off-grid by DRC as follows.

```
# --------- --------- --------- --------- --------- --------- ---------
#  Check off Grid
#
(PSUB).ongrid( 0.050 ).output( "ERR01: OFFGRID 0.050" )
(NW  ).ongrid( 0.050 ).output( "ERR01: OFFGRID 0.050" )
(HVNW).ongrid( 0.050 ).output( "ERR01: OFFGRID 0.050" )
...
(M2  ).ongrid( 0.050 ).output( "ERR01: OFFGRID 0.050" )
(PRO ).ongrid( 0.050 ).output( "ERR01: OFFGRID 0.050" )
```

### Twisted Polygon

This is inter-section polygon mentioned on KLayout [discussion](https://www.klayout.de/forum/discussion/comment/9105#Comment_9105) and checked it with "odd_polygons" command as follows.

```
# --------- --------- --------- --------- --------- --------- ---------
#  Twisted Polygon
#
(PSUB).odd_polygons.output("ERR01: twisted polygon")
(NW  ).odd_polygons.output("ERR01: twisted polygon")
(HVNW).odd_polygons.output("ERR01: twisted polygon")
...
(M2  ).odd_polygons.output("ERR01: twisted polygon")
(PRO ).odd_polygons.output("ERR01: twisted polygon")
```

### Non-diagonal Polygon

TOKAI RIKA does NOT clearly state that only the diagonal angle is used for all polygon shapes in the [document](../openIP62/IP62/Technology/doc/OS00_リファレンスマニュアル_rev1.1.pdf). In general, a non-diagonal angle might cause unexpected problems during mask making process, so we checked it for all layers as follows. You might commeted out each in case of non-diagonal shape needed.

```
# --------- --------- --------- --------- --------- --------- ---------
#  Check Non-diagonal shape
#
(PSUB).drc(if_none( rectilinear, angle(absolute) == 45 )).output( "ERR01: NOT Diagonal" )
(NW  ).drc(if_none( rectilinear, angle(absolute) == 45 )).output( "ERR01: NOT Diagonal" )
(HVNW).drc(if_none( rectilinear, angle(absolute) == 45 )).output( "ERR01: NOT Diagonal" )
...
(M2  ).drc(if_none( rectilinear, angle(absolute) == 45 )).output( "ERR01: NOT Diagonal" )
(PRO ).drc(if_none( rectilinear, angle(absolute) == 45 )).output( "ERR01: NOT Diagonal" )
```

### Line and Space

Minimum Line and Space are listed in the [document](../openIP62/IP62/Technology/doc/OS00_リファレンスマニュアル_rev1.1.pdf) section 4, which are defined by lithography and processing equipment in general. 

```
# --------- --------- --------- --------- --------- --------- ---------
#  Line 
#
(PSUB).drc( width <  8.0 ).output( "ERR01: Width for PSUB <  8.0" )
(NW  ).drc( width <  8.0 ).output( "ERR01: Width for NW   <  8.0" )
(HVNW).drc( width <  8.0 ).output( "ERR01: Width for HVNW <  8.0" )
(L   ).drc( width <  1.4 ).output( "ERR01: Width for L    <  1.4" )
(NF  ).drc( width <  8.0 ).output( "ERR01: Width for NF   <  8.0" )
(PF  ).drc( width <  3.0 ).output( "ERR01: Width for PF   <  3.0" )
(CL  ).drc( width <  3.0 ).output( "ERR01: Width for CL   <  3.0" )
(PBE ).drc( width <  4.2 ).output( "ERR01: Width for PBE  <  4.2" )
(NBE ).drc( width <  4.2 ).output( "ERR01: Width for NBE  <  4.2" )
(SG  ).drc( width <  1.0 ).output( "ERR01: Width for SG   <  1.0" )
(PM  ).drc( width <  4.2 ).output( "ERR01: Width for PM   <  4.2" )
(NW  ).drc( width <  4.2 ).output( "ERR01: Width for NM   <  4.2" )
(R   ).drc( width <  4.0 ).output( "ERR01: Width for R    <  4.0" )
(PSD ).drc( width <  3.5 ).output( "ERR01: Width for PSD  <  3.5" )
(NSD ).drc( width <  2.6 ).output( "ERR01: Width for NSD  <  2.6" )
(CONT).drc( width <  1.0 ).output( "ERR01: Width for CONT <  1.0" )
(M1  ).drc( width <  1.8 ).output( "ERR01: Width for M1   <  1.8" )
(TC  ).drc( width <  1.4 ).output( "ERR01: Width for TC   <  1.4" )
(M2  ).drc( width <  3.0 ).output( "ERR01: Width for M2   <  3.0" )
(PRO ).drc( width < 10.0 ).output( "ERR01: Width for PRO  < 10.0" )
# --------- --------- --------- --------- --------- --------- ---------
#  Space
#
(PSUB).drc( space <  4.0 ).output( "ERR01: Space for PSUB <  4.0" )
(NW  ).drc( space <  4.0 ).output( "ERR01: Space for NW   <  4.0" )
(HVNW).drc( space <  4.0 ).output( "ERR01: Space for HVNW <  4.0" )
(L   ).drc( space <  1.4 ).output( "ERR01: Space for L    <  1.4" )
(NF  ).drc( space <  2.0 ).output( "ERR01: Space for NF   <  2.0" )
(PF  ).drc( space <  2.0 ).output( "ERR01: Space for PF   <  2.0" )
(CL  ).drc( space <  3.0 ).output( "ERR01: Space for CL   <  3.0" )
(PBE ).drc( space <  2.6 ).output( "ERR01: Space for PBE  <  2.6" )
(NBE ).drc( space <  2.6 ).output( "ERR01: Space for NBE  <  2.6" )
(SG  ).drc( space <  1.2 ).output( "ERR01: Space for SG   <  1.2" )
(PM  ).drc( space <  2.6 ).output( "ERR01: Space for PM   <  2.6" )
(NW  ).drc( space <  2.6 ).output( "ERR01: Space for NM   <  2.6" )
(R   ).drc( space <  2.6 ).output( "ERR01: Space for R    <  2.6" )
(PSD ).drc( space <  2.2 ).output( "ERR01: Space for PSD  <  2.2" )
(NSD ).drc( space <  2.6 ).output( "ERR01: Space for NSD  <  2.6" )
(CONT).drc( space <  1.0 ).output( "ERR01: Space for CONT <  1.0" )
(M1  ).drc( space <  1.4 ).output( "ERR01: Space for M1   <  1.4" )
(TC  ).drc( space <  1.5 ).output( "ERR01: Space for TC   <  1.5" )
(M2  ).drc( space <  2.0 ).output( "ERR01: Space for M2   <  2.0" )
(PRO ).drc( space < 20.0 ).output( "ERR01: Space for PRO  < 20.0" )
```
