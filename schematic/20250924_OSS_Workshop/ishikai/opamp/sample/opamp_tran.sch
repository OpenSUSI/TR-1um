v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 260 -280 370 -280 {
lab=in}
N 260 -280 260 -270 {
lab=in}
N 120 -370 430 -370 {
lab=#net1}
N 120 -320 120 -280 {
lab=#net1}
N 120 -80 430 -80 {
lab=GND}
N 120 -220 120 -120 {
lab=GND}
N 120 -80 120 -60 {
lab=GND}
N 120 -370 120 -320 {
lab=#net1}
N 490 -260 530 -260 {
lab=out}
N 530 -260 530 -240 {
lab=out}
N 530 -180 530 -130 {
lab=GND}
N 430 -200 430 -120 {
lab=GND}
N 430 -370 430 -320 {
lab=#net1}
N 430 -80 530 -80 {
lab=GND}
N 180 -170 180 -120 {
lab=GND}
N 180 -300 370 -300 {
lab=#net2}
N 180 -300 180 -230 {
lab=#net2}
N 310 -170 330 -170 {
lab=#net3}
N 260 -210 310 -210 {
lab=#net3}
N 310 -240 310 -210 {
lab=#net3}
N 310 -240 370 -240 {
lab=#net3}
N 310 -90 310 -80 {
lab=GND}
N 510 -260 510 -190 {
lab=out}
N 310 -210 310 -170 {
lab=#net3}
N 310 -170 310 -150 {
lab=#net3}
N 390 -170 510 -170 {
lab=out}
N 510 -190 510 -170 {
lab=out}
N 530 -130 530 -80 {
lab=GND}
N 430 -120 430 -80 {
lab=GND}
N 180 -120 180 -80 {
lab=GND}
N 120 -120 120 -80 {
lab=GND}
C {devices/code_shown.sym} -190 -200 0 0 {name=control only_toplevel=false value=".option savecurrent
.control
op
show m
save all
tran 1n 10000n
plot v(in) V(out)
.endc"}
C {devices/code_shown.sym} -180 -30 0 0 {name=measure only_toplevel=false value=".measure tran tr trig V(out) val=1 rise=1 targ V(out) val=4 rise=1"}
C {devices/code.sym} -200 -350 0 0 {name=TR10_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".include $::LIB/../ip62_models"
spice_ignore=false}
C {devices/vsource.sym} 120 -250 0 0 {name=Vdd value=5.0}
C {devices/gnd.sym} 120 -60 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 530 -260 0 1 {name=p1 sig_type=std_logic lab=out}
C {devices/capa.sym} 530 -210 0 0 {name=C1
m=1
value=100p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 260 -280 0 0 {name=p2 sig_type=std_logic lab=in}
C {opamp.sym} 390 -260 0 0 {name=X1}
C {devices/isource.sym} 180 -200 0 0 {name=I0 value=10e-6}
C {devices/res.sym} 360 -170 1 0 {name=R1
value=100Meg
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 310 -120 0 0 {name=C2
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/vsource.sym} 260 -240 0 0 {name=Vinp value="pwl 0 0 1n 0 1.1n 5.0"}
