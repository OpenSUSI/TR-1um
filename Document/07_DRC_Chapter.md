# Chapter 7 : 07_Check.drc

## [07_Check.drc](../tech/drc/07_Check.drc)

In here, **SG** related rules are described. 

### Channel (W/L) and Endcap for MOS Transistor

_**NOTE:** Minimum W and L checks are described by the sep(projection) method, and Endcap measurement also utilizes the enclosed(projection) method. I am not confident that this projection method is appropriate to use. I would appreciate it if somebody let me know their opinions._

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  W min check
#
(SG & AAMP).sep(SDMP, 0.1, projection, projecting <  3.4 ).output("ERR07: W(MP)  <  3.4")   # PMOS
(SG & AAMN).sep(SDMN, 0.1, projection, projecting <  3.4 ).output("ERR07: W(MN)  <  3.4")   # NMOS
(SG & AAPE).sep(SDPE, 0.1, projection, projecting < 11.0 ).output("ERR07: W(MPE) < 11.0")   # PMOS(ESD)
(SG & AANE).sep(SDNE, 0.1, projection, projecting < 11.0 ).output("ERR07: W(MNE) < 11.0")   # NMOS(ESD)
#
#  L min check
#
(SG & AAMP).sep((SG - AAMP), 0.1, projection, projecting <  1.0 ).output("ERR07: L(MP)  < 1.0") # PMOS
(SG & AAMN).sep((SG - AAMN), 0.1, projection, projecting <  1.0 ).output("ERR07: L(MN)  < 1.0") # NMOS
(SG & AAPE).sep((SG - AAPE), 0.1, projection, projecting <  2.0 ).output("ERR07: L(MPE) < 2.0") # PMOS(ESD)
(SG & AANE).sep((SG - AANE), 0.1, projection, projecting <  2.0 ).output("ERR07: L(MNE) < 2.0") # NMOS(ESD)
#
#  Endcap
#
(SG & AAMP).drc( enclosed(SG, projection, without_touching_edges ) < 1.2).output("ERR07: Endcap(MP)  < 1.2") # PMOS
(SG & AAMN).drc( enclosed(SG, projection, without_touching_edges ) < 1.2).output("ERR07: Endcap(MN)  < 1.2") # NMOS
(SG & AAPE).drc( enclosed(SG, projection, without_touching_edges ) < 1.2).output("ERR07: Endcap(MPE) < 1.2") # PMOS(ESD)
(SG & AANE).drc( enclosed(SG, projection, without_touching_edges ) < 1.2).output("ERR07: Endcap(MNE) < 1.2") # NMOS(ESD)
```

