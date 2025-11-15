# Chapter 3 : 03_Extract.lvs

## [03_Extract.lvs](../tech/lvs/03_Extract.lvs)

### Capacitor (CSIO)

The command [**"extract_devices(capacitor/capacitor_with_bulk)"**](https://www.klayout.de/doc-qt5/manual/lvs_device_extractors.html#h2-72) to extract both two or three terminal capacitor device, as follow.

_**NOTE:** The root level model is m_CSIO in ngspice model file yet it is pure two terminal capacitor as C1, and there is two .subckt model which are  F_CSIO_mst and F_CSIO as three terminal model incuding C1 and botom capacitos bteween Nwell and CL diffusion as C2. There is no voltage dependency for C1 yet has prinominal equation for C2._

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

**RR** spice model is quatitized by w and only 4.0/6.0/12.0/20.0/2.8um are supported, yet DRC does not check those.

```
*//// RR  ////////////////////////////////////////////////////////////////////////

.subckt F_RR PLUS MINUS SUB
.param w=1u r=1 l=1u tc1=0 tc2=0 tnom=27
.if (w == 4u)

r0 PLUS MINUS
+ r = '(1+0.00105*(temper-tnom)+2.4*10**(-6)*(temper-tnom)**2)*v(PLUS,MINUS)/		
+     (v(PLUS,MINUS)/((((834.54*magRR)*((l*10**6)-9.2)/(4-1.09)+(13.3*(9.2/	
+       (4-1.09)+3.38/(4-1.8))+2.79))+(-21*3.95+615.2)))*				
+     (1+(0.000949*log(4)-0.00559)*(v(SUB)-(v(MINUS)+v(PLUS))/2)+			
+     (-3.2478*10**(-6)*log(4)+5.28*10**(-5))*((v(SUB)-(v(MINUS)+v(PLUS))/2)*(v(SUB)-(v(MINUS)+v(PLUS))/2))+	
+     (-7.97*10**(-7)*log(4)+3.05*10**(-6))*((v(SUB)-(v(MINUS)+v(PLUS))/2)*(v(SUB)-(v(MINUS)+v(PLUS))/2)*(v(SUB)-(v(MINUS)+v(PLUS))/2))+	
+     (-3*10**(-9)*log(4)+1.2394*10**(-8))*((v(SUB)-(v(MINUS)+v(PLUS))/2)*(v(SUB)-(v(MINUS)+v(PLUS))/2)*(v(SUB)-(v(MINUS)+v(PLUS))/2)*(v(SUB)-(v(MINUS)+v(PLUS))/2)))/	
+     (1+(-0.09)*abs(v(PLUS,MINUS))/(l*10**6)+0.19*(abs(v(PLUS,MINUS))/		
+     (l*10**6))**2+(-0.02)*(abs(v(PLUS,MINUS))/(l*10**6))**3)))'

c_d0 PLUS SUB  c='(7.06*(10**-4)*l*(10**6)+6.89*(10**-3))*10**(-12)'
c_d1 MINUS SUB c=0

.elseif (w == 6u)
....

.ends F_RR
```
_**NOTE:** The root level model F_RR is tree terminal .subckt model and it include polynominal equation to precisely reflect voltage dependency and prasitic capacitance of PLUS/MINUS terminals. In case of LVS, L and W matching are needed._

The [**"extract_devices(resistor/resistor_with_bulk)"**](https://www.klayout.de/doc-qt5/manual/lvs_device_extractors.html#h2-19) command in KLayout LVS allows extraction of both two-terminal and three-terminal resistor devices. However, this command does not support checking for L/W (length/width) matching or constraints during extraction, making it unsuitable for use cases where dimensional accuracy of the resistor is critical for verification.

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
