# Chapter 2 : 02_Device.drc

## [02_Device.drc](../tech/drc/02_Device.drc)

Device recognition based on a logical combination of mask layers is the most crucial definition for DRC and LVS, which reflects the actual process flow and integration. With that knowledge of process flow and device structure is a fundamental requirement.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  WELLs
#
NWCS = (PSUB & NW).interacting(CL) 	    # Nwell for CSIO 
NWMP = (PSUB & NW).not_interacting(CL)	# Nwell for PMOS 
NWRR = (PSUB & HVNW)	                # HVNW  for RR
PWMN = (BBOX - PSUB)                    # PWEL  for NMOS
```

**Well** is fundamentally a back-gate terminal of the MOS device, so it is the first step in distinguishing the device structure. Furthermore, combination with **CL** layer is used to distinguish a MOS transistor and a MOS capacitor. **HVNW** is primarily used for high-voltage devices but also as a diffusion register, so it simply defines **RR** device. See [document](../openIP62/IP62/Technology/doc/OS00_リファレンスマニュアル_rev1.1.pdf) section 2.

```
# ----- ------ ----- 
#  Implant Layer Combination Table (Y:DATA N:Blank)
# ----------+------+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
# Device    | WELL | NF  | PF  | NBE | PBE | PM  | NM  | PSD | NSD |  R  | CL  |
# ----------+------+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
# PMOS      | NWMP |  Y  |  Y  |  N  |  Y  |  N  |  Y  |  N  |  Y  |  N  |  N  |
# NMOS      | PWMN |  N  |  N  |  Y  |  N  |  Y  |  N  |  Y  |  N  |  N  |  N  |
# NMOS(ESD) | PWMN |  N  |  N  |  Y  |  N  |  Y  |  Y  |  Y  |  N  |  N  |  N  |
# DP        | NWMP |  Y  |  Y  |  N  |  N  |  Y  |  Y  |  N  |  Y  |  N  |  N  |
# DN        | PWMN |  N  |  N  |  N  |  N  |  Y  |  Y  |  Y  |  N  |  N  |  N  |
# BG-NW     | NWMP |  Y  |  Y  |  N  |  N  |  Y  |  Y  |  Y  |  N  |  N  |  N  |
# BG-PSUB   | PWMN |  N  |  N  |  N  |  N  |  Y  |  Y  |  N  |  Y  |  N  |  N  |
# RR        | NWRR |  Y  |  N  |  N  |  N  |  Y  |  Y  |     |     |  Y  |  N  |
# BG-HVNW   | NWGR |  Y  |  N  |  N  |  N  |  Y  |  Y  |  Y  |  N  |  N  |  N  |
# CSIO      | NWCS |  Y  |  N  |  N  |  N  |  Y  |  Y  |  Y  |  Y  |  N  |  Y  |
# BG-CSIO   | NWCS |  Y  |  N  |  N  |  N  |  Y  |  Y  |  Y  |  N  |  N  |  N  |
# PESD      | NWMP |  Y  |  Y  |  N  |  Y  |  N  |  Y  |  N  |  Y  |  N  |  N  |
# NESD      | PWMN |  N  |  N  |  Y  |  N  |  Y  |  N  |  Y  |  N  |  N  |  N  |
# ----------+------+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
```

There are 11 ion-implantation masks to integrate all devices that support the **TR-1um** PDK as described above. Each combination is defined for each device, so the logical equation of 11 masks distinguishes those. 

```
# ----------+------+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
#  EXTRACT L covered by ESD layer (for recognition) 
#
LX = L.interacting(ESD)         # L for ESD
LL = L.not_interacting(ESD)     # L for except ESD
#
```

The ESD device is the only one that is difficult to distinguish by its combination, so the **ESD** layer must explicitly cover the ESD device. Then LX for ESD can extracted.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  Active Area for Device recognition
#
AAMP = (LL.interacting(SG)   ).and(NWMP & NF & PF - NBE & PBE - PM & NM - PSD & NSD - R - CL) # PMOS
AAMN = (LL.interacting(SG)   ).and(PWMN - NF - PF & NBE - PBE & PM - NM & PSD - NSD - R - CL) # NMOS
AAPE = (LX.interacting(SG)   ).and(NWMP & NF & PF - NBE & PBE - PM & NM - PSD & NSD - R - CL) # PMOS
AANE = (LX.interacting(SG)   ).and(PWMN - NF - PF & NBE - PBE & PM & NM & PSD - NSD - R - CL) # NMOS (ESD)
AADP = (L.not_interacting(SG)).and(NWMP & NF & PF - NBE - PBE & PM & NM - PSD & NSD - R - CL) # DP
AADN = (L.not_interacting(SG)).and(PWMN - NF - PF - NBE - PBE & PM & NM & PSD - NSD - R - CL) # DN
AAGP = (L.not_interacting(SG)).and(NWMP & NF & PF - NBE - PBE & PM & NM & PSD - NSD - R - CL) # BG-Nwell
AAGN = (L.not_interacting(SG)).and(PWMN - NF - PF - NBE - PBE & PM & NM - PSD & NSD - R - CL) # BG-Pwell
AARR = (L.not_interacting(SG)).and(NWRR & NF - PF - NBE - PBE & PM & NM             & R - CL) # RR
AAGR = (L.not_interacting(SG)).and(NWRR & NF - PF - NBE - PBE & PM & NM - PSD & NSD - R - CL) # BG-RR
AACC = (L.interacting(SG)    ).and(NWCS & NF - PF - NBE - PBE & PM & NM & PSD & NSD - R & CL) # CSIO
AAGC = (L.not_interacting(SG)).and(NWCS & NF - PF - NBE - PBE & PM & NM & PSD - NSD - R - CL) # BG-CSIO
#
```

Here is a logical equation table for 11 ion-implantation layers, defining the active areas for each device. All derivative layers are used for the DRC checks command hereafter.

```
(L - (AAMP + AAMN + AAPE + AANE + AADP + AADN + AAGP + AAGN + AARR + AAGR + AACC + AAGC)).output("ERR02: Uncertain AA") # Uncertain AA
```

The final line is a simple DRC check for the presence of an **unexpected active area**.






