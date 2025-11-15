# Chapter 2 : 02_Extract.lvs

## [02_Extract.lvs](../tech/lvs/02_Extract.lvs)

### MOS

KLayout has a command [**"extract_devices(mos4)"**](https://www.klayout.de/doc-qt5/manual/lvs_device_extractors.html#h2-146) to extract 4 terminal mos device.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# MOS extraction 5V CMOS
#
extract_devices(mos4("PMOS_mst" ), 
                            { "SD" => (AAMP - SGG),     # S/D region
                              "G"  => (AAMP & SGG),     # Channel region
                              "W"  => (NWMP),           # Backgate region
                              "tS" => (SDMP),           # Terminal: Source
                              "tD" => (SDMP),           # Terminal: Drain
                              "tG" => (SGG),            # Terminal: Gate
                              "tB" => (NWMP) })         # Terminal: Backgate
#
extract_devices(mos4("NMOS_mst" ), 
                            { "SD" => (AAMN - SGG),     # S/D region
                              "G"  => (AAMN & SGG),     # Channel region
                              "W"  => (BULK),           # Backgate region
                              "tS" => (SDMN),           # Terminal: Source
                              "tD" => (SDMN),           # Terminal: Drain
                              "tG" => (SGG),            # Terminal: Gate
                              "tB" => (BULK) })         # Terminal: Backgate
#
```

Then following spice file was extracted which are also reflect AD/AS/PD/PS information.

```
* device instance $1 r0 *1 3.3,23.3 PMOS_mst
M$1 1 2 3 3 PMOS_mst L=1U W=6.8U AS=14.62P AD=14.62P PS=18.8U PD=18.8U
* device instance $3 r0 *1 3.3,2.8 NMOS_mst
M$3 1 2 5 5 NMOS_mst L=1U W=3.4U AS=9.52P AD=9.52P PS=12.4U PD=12.4U
```

**IMHO:** The ngspice model provides .subckt definitions for both PMOS and NMOS; however, there are no additional devices beyond the MOSFETs themselves. The root-level models are PMOS_mst and NMOS_mst, and the LVS runset extracts them as intrinsic MOS devices rather than .subckt instances. This approach simplifies device recognition in LVS.

```
* // model PMOS ////////////////////////////////////////
.subckt PMOS d g s b
.param w=0 l=0 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0 m=1
M1 d g s b PMOS_mst w=w l=l as=as ad=ad ps=ps pd=pd nrd=nrd nrs=nrs m=m
.ends PMOS
```

## MOS (ESD)

ESD device are separetly extracted since those has differnt spice models, as follow.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# MOS(ESD) extraction
#
extract_devices(mos4("MPE_mst"),
                            { "SD" => (AAPE - SGG),     # S/D region
                              "G"  => (AAPE & SGG),     # Channel region 
                              "W"  => (NWMP),           # Backgate region
                              "tS" => (SDPE),           # Terminal: Source
                              "tD" => (SDPE),           # Terminal: Drain
                              "tG" => (SGG),            # Terminal: Gate
                              "tB" => (NWMP) })         # Terminal: Backgate
#
extract_devices(mos4("MNE_mst_mst"), 
                            { "SD" => (AANE - SGG),     # S/D region
                              "G"  => (AANE & SGG),     # Channel region
                              "W"  => (BULK),           # Backgate region
                              "tS" => (SDNE),           # Terminal: Source
                              "tD" => (SDNE),           # Terminal: Drain
                              "tG" => (SGG),            # Terminal: Gate
                              "tB" => (BULK) })         # Terminal: Backgate
#
```

### DIODE

The Diode model provides both DP and DN as root-level models, and the LVS runset extracts them as intrinsic devices. This approach simplifies device recognition in LVS.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# DIODE extraction
#
extract_devices(diode("DP"), 
                            { "P"  => (AADP),           # P region
                              "N"  => (NWMP),           # N region
                              "tA" => (AADP),           # Terminal: Anode
                              "tC" => (NWMP) })         # Terminal: Cathode
#                              
extract_devices(diode("DN"),                            # Floating Protection
                            { "P"  => (BULK),           # P region
                              "N"  => (AADN),           # N region
                              "tA" => (BULK),           # Terminal: Anode
                              "tC" => (AADN) })         # Terminal: Cathode
#
```

Then following spice file was extracted which are also reflect A and P information.

```
* device instance $4 r0 *1 16,23.4 DP
D$4 4 3 DP A=14.4P P=15.2U
* device instance $5 r0 *1 -5.8,2.7 DN
D$5 5 2 DN A=12.96P P=14.4U
```