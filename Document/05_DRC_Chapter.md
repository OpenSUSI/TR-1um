# Chapter 5 : 05_Check.drc

## [05_Check.drc](../tech/drc/05_Check.drc)

In here, **CONT** related allowance checks are described. CONT allowance to **L** is perhaps direct, and to **SG** is indirect. The **CONT**-to-**M1** allowance is possibly direct, yet the minimum enclosure distance remains the same 0.8um due to the LOCOS process, I guess. 

### Fatal combination check

There is no **SG/L** and no **M1** for **CONT**.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  Contact Crossed to L/SG/M1
# 
(L ).edges.inside_part(CONT).output("ERR05: CONT crossed L")
(SG).edges.inside_part(CONT).output("ERR05: CONT crossed SG")
(M1).edges.inside_part(CONT).output("ERR05: CONT crossed M1")
#
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  Contact NOT outside of L/SG/M1
# 
(CONT - (L + SG + M1)).output("ERR05: CONT outside of L/SG/M1")
#
```

### M1 - CONT - SG structure

Minimum enclosure **CONT** to **SG/M1** is 0.8um.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  Contact on SG/M1
#
(CONT).drc( enclosed(SG)   < 0.8 ).output("ERR05: CONT enclosed SG < 0.8")
(CONT).drc( enclosed(M1)   < 0.8 ).output("ERR05: CONT enclosed M1 < 0.8")
#
```

### CONT on MOS transistors

**CONT** size to MOS transistors are fixed to 1.0um and minimum separation is 1.0um, and minimum enclosure **CONT** to **L** is 0.8um. **CONT** on MOS transistors to **SG** minimum separation is 1.0um. 

```
# ===== ====== ===== ====== ===== ====== ===== ====== =====
# Transistor related
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#
# CONT on AAMP/AAMN/AAGP/AAGN area == 1.0
#
(CONT & AAMP).drc( width != 1.0 ).output("ERR05: CONT on L(MP) != 1.0")
(CONT & AAMN).drc( width != 1.0 ).output("ERR05: CONT on L(MN) != 1.0")
(CONT & AAGP).drc( width != 1.0 ).output("ERR05: CONT on L(GP) != 1.0")
(CONT & AAGN).drc( width != 1.0 ).output("ERR05: CONT on L(GN) != 1.0")
#
# CONT to AAMP/AAMN/AAGP/AAGN enclosure < 0.8
#
(CONT).drc( enclosed(AAMP) < 0.8 ).output("ERR05: CONT enclosed L(MP) < 0.8")
(CONT).drc( enclosed(AAMN) < 0.8 ).output("ERR05: CONT enclosed L(MN) < 0.8")
(CONT).drc( enclosed(AAGP) < 0.8 ).output("ERR05: CONT enclosed L(GP) < 0.8")
(CONT).drc( enclosed(AAGN) < 0.8 ).output("ERR05: CONT enclosed L(GN) < 0.8")
#
#  Contact to Contact space on AAMP/AAMN/AAGP/AAGN 
# 
(CONT & AAMP).drc( space <  1.0 ).output("ERR05: CONT on L(MP) space <  1.0")
(CONT & AAMN).drc( space <  1.0 ).output("ERR05: CONT on L(MN) space <  1.0")
(CONT & AAGP).drc( space <  1.0 ).output("ERR05: CONT on L(GP) space <  1.0")
(CONT & AAGN).drc( space <  1.0 ).output("ERR05: CONT on L(GN) space <  1.0")
#
#  Contact on AAMP/AAMN/AAGP/AAGN to SG separation < 1.0
# 
(CONT & AAMP).drc( sep(SG) <  1.0 ).output("ERR05: CONT to SG(MP) < 1.0")
(CONT & AAMN).drc( sep(SG) <  1.0 ).output("ERR05: CONT to SG(MN) < 1.0")
(CONT & AAGP).drc( sep(SG) <  1.0 ).output("ERR05: CONT to SG(GP) < 1.0")
(CONT & AAGN).drc( sep(SG) <  1.0 ).output("ERR05: CONT to SG(GN) < 1.0")
#
```

### CONT on ESD transistors

**CONT** size to MOS transistors are fixed to 3.0um and minimum separation is 1.6um, and minimum enclosure **CONT** to **L** is 4.0um. NOTE: The document mentioned **CONT** to **L** enclosure has a two-dimensional definition as TATE 2.5um vs YOKO 4.0um. I have no logical idea why it has been separated, nor how to distinguish it using the DRC command, so the worst value is described below.

```
# ===== ====== ===== ====== ===== ====== ===== ====== =====
#  Contact size & enclosed special for MPE/MNE (ESD/IO) 
#
(CONT & AAPE).drc( width != 3.0 ).output("ERR05: CONT on MP(ESD) != 3.0")
(CONT & AANE).drc( width != 3.0 ).output("ERR05: CONT on MN(ESD) != 3.0")
#
(CONT & AAPE).drc( space <  1.6 ).output("ERR05: CONT space on MP(ESD) <  1.6")
(CONT & AANE).drc( space <  1.6 ).output("ERR05: CONT space on MN(ESD) <  1.6")
#
(CONT).drc( enclosed(AAPE) < 4.0 ).output("ERR05: CONT enclosed MP(ESD) < 4.0") # IGNORE ERMPE31 TATE < 2.5
(CONT).drc( enclosed(AANE) < 4.0 ).output("ERR05: CONT enclosed MN(ESD) < 4.0") # IGNORE ERMNE32 TATE < 2.5
#
```

### CONT on Diode 

**CONT** size to Diode are fixed to 1.2um and minimum separation is 1.2um. It should logically be 1.0um, the same as on a MOS Transistor, but it probably also takes care of contact resistance and/or DFM-related yield enhancement.

```
# ===== ====== ===== ====== ===== ====== ===== ====== =====
#  Diode related 
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  Contact size & enclosed special for DP/DN 
#
(CONT & AADP).drc( width != 1.2 ).output("ERR05: CONT to L(DP) != 1.2")
(CONT & AADN).drc( width != 1.2 ).output("ERR05: CONT to L(DN) != 1.2")
#
(CONT).drc( enclosed(AADP) < 1.2 ).output("ERR05: CONT enclosed L(DP) < 1.2")
(CONT).drc( enclosed(AADN) < 1.2 ).output("ERR05: CONT enclosed L(DN) < 1.2")
#
```

### CONT on RR

**CONT** size to RR is flexible, since it allows variable-size rectangles; the shape named **CONTL** may help minimize contact resistance. Because of the flexibility, DRC rules are complicated as follows, **CONTL** minimum space is 1.6um and allows 1.0um x 1.6um rectangle contact hole as a minimum shape. 

_**NOTE:** there is maximum limit for contact length is 97.5um (ER1302) but I do not believe it is not recommeded to 1.0um x 97.5um. It should be limited by certain reasonable maximum length._

Minimum enclosure **CONTL** to **L** and **M1** is 1.2um. **CONT/CONTL** mimimum separaton to **TC** are 1.0/1.4um separately.

```
# ===== ====== ===== ====== ===== ====== ===== ====== =====
#  Resistor related 
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#
CONTL = CONT.drc( area > 1.5 )  
#
(CONTL).drc( space <  1.6 ).output("ERR05: CONT-L to CONT-L <  1.6")                         # CONTL space
(CONTL).drc( width(projection, projecting > 1.0 ) < 1.6 ).output("ERR07: CONTL(L) <  1.6")   # CONTL(Long) < 1.6
# (CONTL).drc( width(projection, projecting > 1.0 ) < 97.5).output("ERR07: CONTL(L) < 97.5")   # CONTL(Long) > 97.5
#
#  Contact-L enclosure to L/SG/M1
#
(CONTL & SG).output("ERR05: DONOT allow CONT-L on SG")
(CONTL).drc( enclosed(L)   < 1.2 ).output("ERR05: CONT-L enclosed L  < 1.2")
(CONTL).drc( enclosed(M1)  < 1.2 ).output("ERR05: CONT-L enclosed M1 < 1.2")
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  Contact/Contact-L separation to TC
#
(CONT ).drc( sep(TC)    < 1.0 ).output("ERR08: CONT   sep to TC < 1.0")
(CONTL).drc( sep(TC)    < 1.4 ).output("ERR07: CONT-L sep to TC < 1.4")
#
CONTL.forget  # release tempolary memory
```


