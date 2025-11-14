# Chapter 6 : 06_Check.drc

## [06_Check.drc](../tech/drc/06_Check.drc)

In here, **SG** related rules are described. 

### Electrical connection 

Regarding the antenna check, at first, the electrical connection is defined as follows.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  Electrical connection definition
# 
SDMP = (AAMP - SG)          # MP S/D
SDMN = (AAMN - SG)          # MN S/D
SDPE = (AAPE - SG)          # MPE S/D
SDNE = (AANE - SG)          # MNE S/D
#
connect(SDMP, CONT)         # MP S/D
connect(SDMN, CONT)         # MN S/D
connect(SDPE, CONT)         # MPE S/D
connect(SDNE, CONT)         # MNE S/D
connect(AAGP, CONT)         # BG-PMOS
connect(AAGN, CONT)         # BG-NMOS
connect(AADP, CONT)         # DP
connect(AADN, CONT)         # DN
#
connect(SG,   CONT)         # SG-CONT
connect(CONT, M1)           # CONT-M1
connect(M1,   TC)           # M1-TC
connect(TC,   M2)           # TC-M2
#
```

### SG to L/CONT Separation

Minimum separation of **SG** to **L** is 0.4um in general, yet in **RR** it is 1.0um, perhaps because of **SG** on **RR** behaving as a Field Transistor Gate tied to GND to ensure electrical separation between **RR** vs next **RR**. Also, the minimum separation between **SG** and **CONT** on the MOS Transistor is 1.0 μm.

```
# ===== ====== ===== ====== ===== ====== ===== ====== =====
#  SG to L Separation
# 
(SG ).drc( sep(L)    < 0.4 ).output("ERR06: SG to L     <  0.4")
(SG ).drc( sep(AARR) < 1.0 ).output("ERR06: SG to L(RR) <  1.0")
#
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  SG to CONT Separation
# 
(CONT & AAMP).drc( sep( SG , projection ) < 1.0 ).output("ERR06: SG to CONT(MP) < 1.0") # 
(CONT & AAMN).drc( sep( SG , projection ) < 1.0 ).output("ERR06: SG to CONT(MN) < 1.0") # 
#
```

### SG for ESD device

In general, the ESD device, a diode-connected MOS transistor, is unsymmetrical for S/D to ensure sufficient parallel Drain resistance and a large L shape to protect against surge current. Therefore, we need to distinguish between Drain and Source in some way; here, we tried to use electrical connections, but it is also applicable to use a _recognition_ layer.

Due to the diode-connected MOS transistor being connected to GND or VDD for ESD protection, the Source can be identified through its electrical connection to the PSUB or VDD via AAGP or AAGN.

**SG** width for ESD device is 2.0um, and mimimum sepration **CONT** to **SG** are 3.0um for Source and 7.0um for Drain. All generated layers are released after the check.

```
# ===== ====== ===== ====== ===== ====== ===== ====== =====
#  SG FOR ESD DEVICE
#
(SG & ESD).drc( width < 2.0 ).output("ERR06: SG for ESD < 2.0") # 
#(SG & ESD).drc( space < ??? ).output("ERR06: SG for ESD < ???") # NO document ??? 
#
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  Distinguished Source and Drain contact for MPE/MNE (ESD/IO) 
#
PS_CONT = (AAPE & antenna_check(AAGP, CONT, 0.0))
PD_CONT = ((AAPE & CONT) - PS_CONT)
NS_CONT = (AANE & antenna_check(AAGN, CONT, 0.0))
ND_CONT = ((AANE & CONT) - NS_CONT)
#
#  SG to CONT(MPE/MNE) Separation
#
PS_CONT.drc( sep( SG, projection ) < 3.0 ).output("ERR06: SG to CONT(MPE-S) <  3.0")
PD_CONT.drc( sep( SG, projection ) < 7.0 ).output("ERR06: SG to CONT(MPE-D) <  7.0")
#
NS_CONT.drc( sep( SG, projection ) < 3.0 ).output("ERR06: SG to CONT(MNE-S) <  3.0")
ND_CONT.drc( sep( SG, projection ) < 7.0 ).output("ERR06: SG to CONT(MNE-D) <  7.0")
#
#PS_CONT.drc(area > 0).output("PS_CONT")    # DEBUG
#PD_CONT.drc(area > 0).output("PD_CONT")    # DEBUG
#NS_CONT.drc(area > 0).output("NS_CONT")    # DEBUG
#ND_CONT.drc(area > 0).output("ND_CONT")    # DEBUG
#
PS_CONT.forget  # release memory
PD_CONT.forget  # release memory
NS_CONT.forget  # release memory
ND_CONT.forget  # release memory
#
```
###  Floating SG (anntena check)

Floating **SG** detection was made by searching for electrically isolated **SG** by not tying it down to any Source/Drain or Anode/Cathode. 

_**NOTE:** Because it is not easy to clean up any of the floating **SG** before building up the complete circuit structure, it is better to say WARNING rather than ERROR, IMHO._

```
# ===== ====== ===== ====== ===== ====== ===== ====== =====
#  Floating SG detection (WARNING)
#
SG_MP = antenna_check(SDMP, SG, 0.0)
SG_MN = antenna_check(SDMN, SG, 0.0)
SG_PE = antenna_check(SDPE, SG, 0.0)
SG_NE = antenna_check(SDNE, SG, 0.0)
SG_GP = antenna_check(AAGP, SG, 0.0)
SG_GN = antenna_check(AAGN, SG, 0.0)
#
(SG - ( SG_MP + SG_MN + SG_PE + SG_NE + SG_GP + SG_GN )).output("WAR06: Floating SG Detected")
#
SG_MP.forget  # release memory
SG_MN.forget  # release memory
SG_PE.forget  # release memory
SG_NE.forget  # release memory
SG_GP.forget  # release memory
SG_GN.forget  # release memory
```
