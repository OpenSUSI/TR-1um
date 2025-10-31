# Chapter 9 : 09_Check.drc

## [09_Check.drc](../tech/drc/09_Check.drc)

### IO and PRO related

In here, **PRO** related rules, means IO area, are described. 

### Fatal combination check

There is no **M1/M2** crossing **PAD** and **PAD** without **M1/M2**.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  PAD Crossed to M1/M2
# 
(M1 ).edges.inside_part(PRO).output("ERR09: PRO crossed M1")
(M2 ).edges.inside_part(PRO).output("ERR09: PRO crossed M2")
#
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  PRO NOT outside of M1/M2 
# 
(PRO).drc( outside(M1 + M2) ).output("ERR09: PRO outside of M1/M2")
#
```
### PRO and TC(PRO) to M1/M2 enclosure

**PRO** to **M1/M2** enclosure are both 5um and **TC(PRO)** to **M1/M2** enclosure are both 5um.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  PRO Enclosure to M1/M2
#
(PRO).drc( enclosed(M1) <  5.0 ).output("ERR09: PRO enclosed M1 < 5.0")
(PRO).drc( enclosed(M2) <  5.0 ).output("ERR09: PRO enclosed M2 < 5.0")
#
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  TC(PRO) to M1/M2 enclosure
#
(TC & PRO).drc( enclosed(M1) <  14.0 ).output("ERR09: TC(PRO) enclosed M1 < 14.0")
(TC & PRO).drc( enclosed(M2) <  14.0 ).output("ERR09: TC(PRO) enclosed M2 < 14.0")
#
```

### PRO Line and Space

**PRO** Line and Space are 70.0u and 64.0um.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  PAD L/S 
#
(PRO).drc( width <  70.0 ).output("ERR09: PRO width < 70.0")
(PRO).drc( space <  64.0 ).output("ERR09: PRO space < 64.0")
#
```
_**NOTE:** IMHO: In the [document](../openIP62/IP62/Technology/doc/OS00_リファレンスマニュアル_rev1.1.pdf) section4, PRO L/S metioned 10/20um as mimimum. Table I-5-1 ER1809/10 should be recommendation value for Bonding or Probing._

### PAD M1/M2 to adjacent M1/M2

Minimum distance **M1/M2** for PAD to adjacent **M1/M2** are both 14um.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  PAD M1/M2 to M1/M2
#
(M1.interacting(PRO)).drc( sep(M1) < 14.0).output("ERR09: M1(PRO) separation M1 < 14.0")
(M2.interacting(PRO)).drc( sep(M2) < 14.0).output("ERR09: M2(PRO) separation M2 < 14.0")
#
```
_**NOTE:** Feeding M1/M2 rule which desctibed in the [document](../openIP62/IP62/Technology/doc/OS00_リファレンスマニュアル_rev1.1.pdf) Table I-5-1 ER1803/04 are NOT implemented yet. I do not know how to implemented it, so feedback are always welcome._

