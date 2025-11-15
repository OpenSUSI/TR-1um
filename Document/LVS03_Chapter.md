# Chapter 3 : 03_Extract.lvs

## [03_Extract.lvs](../tech/lvs/03_Extract.lvs)

### Capacitor (CSIO)

The command [**"extract_devices(capacitor/capacitor_with_bulk)"**](https://www.klayout.de/doc-qt5/manual/lvs_device_extractors.html#h2-72) to extract both two or three terminal capacitor device, as follow.

**Notice:** The root level model is m_CSIO in ngspice model file yet it is pure two terminal capacitor as C1, and there is two .subckt model which are  F_CSIO_mst and F_CSIO as three terminal model incuding C1 and botom capacitos bteween Nwell and CL diffusion as C2. There is no voltage dependency for C1 yet has prinominal equation for C2.

```
* //macro F_CSIO/////////////////////////////////
.model m_CSIO C tnom=27

* ----- ----- ----- ----- ----- ----- ----- ----- ----- 
.subckt F_CSIO_mst plus minus sub
.param c=0 y=0 x=0 m=1 magCSIO=1

C1 plus minus m_CSIO c=c*magCSIO  m=m
C2 minus sub  							
+ c = '0.56*(((x+18.8+((2.03e-8*(0.61+v(minus,sub)))**0.5)*1e+4)*			
+     (y+18.8+((2.03e-8*(0.61+v(minus,sub)))**0.5)*1e+4))*(1.053e-20)/		
+     (2.03e-8*(0.61+v(minus,sub)))**0.5+(2.0*(x+18.8+((1.03e-8*(0.71+		
+     v(minus,sub)))**0.5)*1e+4)*(10+0.5*((1.03e-8*(0.71+v(minus,sub)))**0.5)*	
+     1e+4)+2.0*(y+18.8+((1.03e-8*(0.71+v(minus,sub)))**0.5)*1e+4)*		
+     (10+0.5*((1.03e-8*(0.71+v(minus,sub)))**0.5)*1e+4))*(1.053e-20)/		
+     (1.03e-8*(0.71+v(minus,sub)))**0.5)'    m=m

.ends F_CSIO_mst

* ----- ----- ----- ----- ----- ----- ----- ----- ----- 
.subckt F_CSIO plus minus sub
.param c=0 y=0 x=0 m=1
                           
X1 plus minus sub F_CSIO_mst c=c m=m  x=x*1e+6  y=y*1e+6  
.ends F_CSIO
```

**IMHO:** Given the influence of parasitic capacitance between the N-well and P-substrate junction, it is advisable to use the F_CSIO model for accurate circuit-level simulation. This model captures the junction capacitance effects more precisely, which is critical for analog or mixed-signal performance analysis. However, for LVS purposes, a simplified two-terminal device representation is sufficient. In this context, verifying the physical area of the gate capacitor is more fundamental than achieving simulation accuracy, since LVS focuses on structural and topological consistency rather than analog behavior.

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



