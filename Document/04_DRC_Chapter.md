# Chapter 4 : 04_Check.drc

## [04_Check.drc](../tech/drc/04_Check.drc)

In here, **L(AA)** related allowance checks are described. L(AA) allowances are based on device structures, so they should be individual numbers for each generated AA layer.

### L(AA) to PSUB
```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#  Each device's AA to PSUB distance
#
AAMP.drc(enclosed(PSUB) <  7.0).output("ERR04: L(MP) to PSUB <  7.0")
AAMN.drc(sep(PSUB)      < 10.0).output("ERR04: L(MN) to PSUB < 10.0")
AADP.drc(enclosed(PSUB) <  7.0).output("ERR04: L(DP) to PSUB <  7.0")
AADN.drc(sep(PSUB)      < 10.0).output("ERR04: L(DN) to PSUB < 10.0")
AAGP.drc(enclosed(PSUB) <  5.0).output("ERR04: L(GP) to PSUB <  5.0")
AAGN.drc(sep(PSUB)      <  5.0).output("ERR04: L(GN) to PSUB <  5.0")
AARR.drc(enclosed(PSUB) < 10.0).output("ERR04: L(RR) to PSUB < 10.0")
AAGR.drc(enclosed(PSUB) < 10.0).output("ERR04: L(GR) to PSUB < 10.0")
# AACC.drc(enclosed(PSUB) <  N/A).output("ERR04: L(CC) to PSUB <  N/A") 
AAGC.drc(enclosed(PSUB) <  3.0).output("ERR04: L(GC) to PSUB <  3.0")
#
#  FOR ESD area
#
AAPE.drc(enclosed(PSUB) < 10.0).output("ERR04: L(MPE) to PSUB < 10.0")
AANE.drc(enclosed(PSUB) < 10.0).output("ERR04: L(MNE) to PSUB < 10.0")
```

See [document](../openIP62/IP62/Technology/doc/OS00_リファレンスマニュアル_rev1.1.pdf) section 6. One additional DRC check is **L** must NOT cross **PSUB** as below.

```
#
PSUB.edges.inside_part(L).output("ERR04: L crossed PSUB")
#
```

### L(AA) to L(AA)



```
# ----- ------ ----- 
#  Each device's AA to other AA
#
AAMP.drc(sep(AADP) <  2.8).output("ERR04: L(MP) to L(DP) <  2.8")
AAMP.drc(sep(AAGP) <  2.8).output("ERR04: L(MP) to L(GP) <  2.8")
AADP.drc(sep(AAGP) <  2.8).output("ERR04: L(DP) to L(GP) <  2.8")
#
AAMN.drc(sep(AADN) <  2.8).output("ERR04: L(MN) to L(DN) <  2.8")
AAMN.drc(sep(AAGN) <  2.8).output("ERR04: L(MN) to L(GN) <  2.8")
AADN.drc(sep(AAGN) <  2.8).output("ERR04: L(DN) to L(GN) <  2.8")
#
AARR.drc(sep(AARR) <  4.0).output("ERR04: L(RR) to L(RR) <  4.0")
AARR.drc(sep(AAGR) <  4.0).output("ERR04: L(RR) to L(GR) <  4.0")
#
AACC.drc(sep(AAGC) <  2.8).output("ERR04: L(CC) to L(GC) <  2.8")
#
#  FOR ESD area
#
AAPE.drc(sep(AAGP) <  10.0).output("ERR04: L(MPE) to L(GP) < 10.0")
AANE.drc(sep(AAGN) <  10.0).output("ERR04: L(MNE) to L(GN) < 10.0")
#
```

### L(AA) corner trim ( elcetic filed relief? )

The document requested that the **L** corner be trimmed diagonally to relieve the electrical field for both ESD and RR, see [document](../openIP62/IP62/Technology/doc/OS00_リファレンスマニュアル_rev1.1.pdf) section 6. Probably because **RR** can handle high voltages without the option process as well. Regarding the DRC check for trim, it is a little tricky: first, count the edges to ensure the octagonal shape, then subtract each trim area to determine whether it meets the spec.

```
# ===== ====== ===== ====== ===== ====== ===== ====== =====
# Corner trim for ESD
#
AAPE.drc( primary.edges.count != 8 ).output("ERR04: L(MPE) shape NOT Octagon")              # L should be Octagon shape
AANE.drc( primary.edges.count != 8 ).output("ERR04: L(MNE) shape NOT Octagon")              # L should be Octagon shape
#
(AAPE.extents - AAPE).drc( area < 0.98 ).output("ERR04: L(MPE) trimed corner size < 0.98")  # trimed area < 1.4^2/2.0
(AANE.extents - AANE).drc( area < 0.98 ).output("ERR04: L(MNE) trimed corner size < 0.98")  # trimed area < 1.4^2/2.0
#
# ----- ------ ----- 
# Corner trim for RR
#
AARR.drc( primary.edges.count != 8 ).output("ERR04: L(RR) shape NOT Octagon")               # L should be Octagon shape
#
(AARR.extents - AARR).drc( area < 0.5 ).output("ERR04: L(RR) trimed corner size < 0.5")     # trimed area < 1.0^2/2.0
#
```

