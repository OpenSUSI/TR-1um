# Chapter 3 : 03_Extract.lvs

## [03_Extract.lvs](../tech/lvs/03_Extract.lvs)

### Capacitor (CSIO)

The command [**"extract_devices(capacitor/capacitor_with_bulk)"**](https://www.klayout.de/doc-qt5/manual/lvs_device_extractors.html#h2-72) to extract both two or three terminal capacitor device, as follow.

**Notice:** The root level model is m_CSIO in ngspice model file yet it is pure two terminal capacitor as C1, and there is two .subckt model which are  F_CSIO_mst and F_CSIO as three terminal model incuding C1 and botom capacitos bteween Nwell and CL diffusion as C2. There is no voltage dependency for C1 yet has prinominal equation for C2.

**IMHO:** Knowoing tnhe influence of parasitic capacitance impact between Nwell and CL difission, should use F_CSIO model for pricese circuit simulation, I agree. In case of LVS two terminal device is enough and to veryfy are of capacitor is more important than precise circuit simulation.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# Capacitance extraction ( F_CSIO: 3 terminal capacitor device is optional, either one to use )
#
extract_devices(capacitor("m_CSIO", 0.6e-15 ), 
                    { "P1" => (SGG),            # Top plate
                      "P2" => (AACC),           # Bottom plate
                      "tA" => (SGG),            # Terminal: A
                      "tB" => (NWCS) })         # Terminal: B
#
# extract_devices(capacitor_with_bulk("F_CSIO", 0.6e-15 ), 
#                    { "P1" => (SGG),            # Top plate
#                      "P2" => (AACC),           # Bottom plate
#                      "W"  => (NWCS),           # Bulk plate
#                      "tA" => (SGG),            # Terminal: A
#                      "tB" => (NWCS),           # Terminal: B
#                      "tW" => (BULK) })         # Terminal: BULK
#
```
Then following spice file was extracted which are also reflect C = Cs x Area information.

```
* device instance $6 r0 *1 -46,18 m_CSIO
C$6 2 5 4.8735e-13 m_CSIO
```

### Resistor (RR/RS)

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# Resistor extraction
#
extract_devices(resistor("F_RS", 1),
                    { "R"  => (SGB),             # Resistance Layer`
                      "C"  => (SGC),             # Contact Layer
                      "tA" => (SGC),             # Terminal: A
                      "tB" => (SGC) })           # Terminal: B
#
extract_devices(resistor_with_bulk("F_RR", 1),
                    { "R"  => (AARB),            # Resistance Layer`
                      "C"  => (AARC),            # Contact Layer
                      "W"  => (NWRR),            # Bulk plate
                      "tA" => (AARC),            # Terminal: A
                      "tB" => (AARC),            # Terminal: B
                      "tW" => (NWRR) })          # Terminal: BULK
#
```



