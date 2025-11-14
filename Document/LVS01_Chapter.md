# Chapter 1 : 01_Extract.lvs

## [01_Extract.lvs](../tech/lvs/01_Extract.lvs)

First step of LVS runset is to specify unique layers to recognize each of device terminals, as follow;

### RR device

KLayout needs two layers for resistance device recognition which are Contact and Body regions, in case of RR those can simply recognize by PSD/NSD combination.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# RR Resistance
#
AARC = AARR & NSD - PSD          # RR Contact
AARB = AARR & NSD & PSD          # RR Body
#
```

### RS device

In case of RS situation bit different, I need to introduce **"RS"** layer to recognize Contact and Body regions.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# Saliside Gate Resistance
#
SGR = SG.interacting(RS)         # SG for RS
SGC = SGR - RS                   # RS Contact
SGB = SGR & RS                   # RS Body
#
SGG = SG.not_interacting(RS)     # SG for except RS
#
```

### MOS Source and Drain

MOS Souce and Drain regions can recognize as follow.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# Electical connection layers
#
SDMP = (AAMP - SGG)      # MP S/D
SDMN = (AAMN - SGG)      # MN S/D
SDPE = (AAPE - SGG)      # MPE S/D
SDNE = (AANE - SGG)      # MNE S/D
#
```

### BULK 

This is optional, if you want to clear BULK represetnt VSS in your schematic.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# Global node
#
connect_global(BULK, "VSS")
#
```
