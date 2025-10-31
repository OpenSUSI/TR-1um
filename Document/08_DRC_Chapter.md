# Chapter 8 : 08_Check.drc

## [08_Check.drc](../tech/drc/08_Check.drc)

In here, **M1/TC/M2** related rules, so called BEOL, are described. 

### Fatal combination check

There is no **SG/CONT/M1/M2** crossing **TC** and TC without **M1/M2**.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  TC Crossed to SG/CONT/M1/M2
# 
(SG  ).edges.inside_part(TC).output("ERR08: TC crossed SG")
(CONT).edges.inside_part(TC).output("ERR08: TC crossed CONT")
(M1  ).edges.inside_part(TC).output("ERR08: TC crossed M1")
(M2  ).edges.inside_part(TC).output("ERR08: TC crossed M2")
#
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  Via NOT outside of M1/M2 
# 
(TC - (M1 & M2)).output("ERR08: TC outside of M1/M2")
#
```

### TC size 

**TC** size is fixed to 1.4um except under **PRO** (means PAD).

_**NOTE:** IMHO: maximum **TC** under **PAD** should be checked because of avoid over etching M1, yet does not mentioned in the [document](../openIP62/IP62/Technology/doc/OS00_リファレンスマニュアル_rev1.1.pdf)._

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  TC width != 1.4 (Except PAD)
#
(TC - PRO).drc( width != 1.4 ).output("ERR08: TC width != 1.4")
(TC & PRO).drc( width <  1.4 ).output("ERR08: TC(PAD) width < ???")
#
```

### TC to SG/CONT separation and TC to M1/M2 enclosure

**TC** to **SG/CONT** separations are 1.2um and 1.0um, may be because avoiding non-homogeneous M1 surface near **SG** and **CONT** which is emphasized by the reflow process.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  TC Enclosure to SG/CONT/M1/M2
#
## (TC).drc( sep(CONT)    < 1.4 ).output("ERR08: TC enclosed CONT_L < 1.4")
#
(TC).drc( sep(SG)      < 1.2 ).output("ERR08: TC enclosed SG   < 1.2")
(TC).drc( sep(CONT)    < 1.0 ).output("ERR08: TC enclosed CONT < 1.0")
(TC).drc( enclosed(M1) < 1.0 ).output("ERR08: TC enclosed M1   < 1.0")
(TC).drc( enclosed(M2) < 1.0 ).output("ERR08: TC enclosed M2   < 1.0")
#
```

### Large M1 slit insertion

Over 10um wide **M1** should have a slit space. **M1W** defined here and checked with space(projection) method.

_**NOTE:** There is no M2 slit insertion rule in the [document](../openIP62/IP62/Technology/doc/OS00_リファレンスマニュアル_rev1.1.pdf), but it must be ruled._

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#
#  Wide(>10.0) M1 space in case projecting >= 10.0um
#
M1W = M1.drc( width(projection) >= 10.0 ).polygons
M1W.drc( space(projection, projecting >= 10.0 ) <  2.0 ).output( "ERR08: M1(Wide) space < 2.0" )
M1W.forget  # release memory
#
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#
#  Wide(>10.0) M2 space in case projecting >= 10.0um
#
M2W = M2.drc( width(projection) >= 10.0 ).polygons
M2W.drc( space(projection, projecting >= 10.0 ) <  2.0 ).output( "ERR08: M2(Wide) space < 2.0" )
M2W.forget  # release memory
#
```