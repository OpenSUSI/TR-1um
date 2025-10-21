v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 190 -60 190 -10 {
lab=GND}
N -40 -150 -40 -120 {
lab=vin}
N -40 -60 -40 -20 {
lab=GND}
N -120 -60 -120 -20 {
lab=GND}
N -120 -150 -120 -120 {
lab=VDD}
N 190 -240 190 -120 {
lab=vout}
N 230 -270 260 -270 {
lab=vin}
N 260 -270 260 -90 {
lab=vin}
N 230 -90 260 -90 {
lab=vin}
N 190 -400 190 -300 {
lab=VDD}
N 170 -270 190 -270 {
lab=VDD}
N 170 -330 170 -270 {
lab=VDD}
N 170 -330 190 -330 {
lab=VDD}
N 170 -90 190 -90 {
lab=GND}
N 170 -90 170 -40 {
lab=GND}
N 170 -40 190 -40 {
lab=GND}
N 100 -170 190 -170 {
lab=vout}
N 60 -10 190 -10 {
lab=GND}
N 40 -170 60 -170 {
lab=GND}
N 40 -170 40 -110 {
lab=GND}
N 40 -110 60 -110 {
lab=GND}
N 260 -170 380 -170 {
lab=vin}
N 120 -380 190 -380 {
lab=VDD}
N 60 -380 60 -370 {
lab=VDD}
N 60 -380 120 -380 {
lab=VDD}
N 60 -140 60 -110 {
lab=GND}
N 60 -110 60 -90 {
lab=GND}
N 60 -30 60 -10 {
lab=GND}
N 60 -310 60 -200 {
lab=#net1}
N 60 -90 60 -30 {
lab=GND}
C {devices/vdd.sym} 190 -400 0 0 {name=l1}
C {devices/gnd.sym} 190 -10 0 0 {name=l2}
C {devices/vsource.sym} -120 -90 0 0 {name=Vdd value=5.0 savecurrent=false}
C {devices/vdd.sym} -120 -150 0 0 {name=l3}
C {devices/gnd.sym} -120 -20 0 0 {name=l4}
C {devices/vsource.sym} -40 -90 0 0 {name=vin value=5.0 savecurrent=false}
C {devices/lab_pin.sym} 380 -170 0 1 {name=p1 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} -40 -150 1 0 {name=p3 sig_type=std_logic lab=vin}
C {devices/gnd.sym} -40 -20 0 0 {name=l5}
C {devices/code_shown.sym} -460 -300 0 0 {name=spice only_toplevel=false value=".option savecurrent
.control
save all

* DC analysis (I/O curve)
dc vin 0 5.0 0.01
plot vin vout
.endc"}
C {devices/code_shown.sym} -460 -20 0 0 {name=measure only_toplevel=false value=".measure dc Vinv when v(vout)=0.78"}
C {devices/isource.sym} 60 -340 0 0 {name=I0 value=50u}
C {devices/lab_pin.sym} 140 -170 1 0 {name=p2 sig_type=std_logic lab=vout}
C {devices/code.sym} -470 -450 0 0 {name=TR10_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".include $::LIB/../ip62_models"
spice_ignore=false}
C {IP62LIB/MP.sym} 230 -270 0 1 {name=XM1 model=PMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 230 -90 0 1 {name=XM2 model=NMOS w=1000u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 100 -170 0 1 {name=XM3 model=NMOS w=50u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
