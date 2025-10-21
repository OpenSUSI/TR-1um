v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 30 -150 30 -130 {
lab=GND}
N 30 -230 30 -210 {
lab=#net1}
N 170 -190 170 -180 {
lab=in}
N 170 -190 250 -190 {
lab=in}
N 170 -120 170 -110 {
lab=GND}
N 170 -110 290 -110 {
lab=GND}
N 90 -210 240 -210 {
lab=#net2}
N 250 -190 270 -190 {
lab=in}
N 90 -110 140 -110 {
lab=GND}
N 90 -150 90 -110 {
lab=GND}
N 30 -130 30 -90 {
lab=GND}
N 30 -110 90 -110 {
lab=GND}
N 300 -230 300 -220 {
lab=#net1}
N 30 -230 270 -230 {
lab=#net1}
N 300 -160 300 -110 {
lab=GND}
N 290 -110 300 -110 {
lab=GND}
N 340 -190 370 -190 {
lab=out}
N 370 -190 370 -180 {
lab=out}
N 370 -120 370 -110 {
lab=GND}
N 300 -110 370 -110 {
lab=GND}
N 240 -210 270 -210 {
lab=#net2}
N 270 -230 300 -230 {
lab=#net1}
N 140 -110 170 -110 {
lab=GND}
C {devices/gnd.sym} 30 -90 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} 30 -180 0 0 {name=Vdd value=5.0}
C {devices/vsource.sym} 90 -180 0 0 {name=Vb value=3.5}
C {devices/code_shown.sym} -280 -200 0 0 {name=control only_toplevel=false value=".option savecurrent
.control
op
show m
save all
tran 0.01u 1u
plot v(in) V(out)
.endc"}
C {cs.sym} 290 -190 0 0 {name=X1}
C {devices/lab_pin.sym} 370 -190 0 1 {name=p1 sig_type=std_logic lab=out}
C {devices/capa.sym} 370 -150 0 0 {name=C1
m=1
value=100p
footprint=1206
device="ceramic capacitor"}
C {devices/code_shown.sym} -280 -30 0 0 {name=measure only_toplevel=false value=".measure tran tr trig V(out) val=1.0 rise=1 targ V(out) val=4.0 rise=1"}
C {devices/vsource.sym} 170 -150 0 0 {name=Vin value="pwl 0 5.0 1n 5.0 1.1n 0"}
C {devices/lab_pin.sym} 170 -190 0 0 {name=p2 sig_type=std_logic lab=in}
C {devices/code.sym} -290 -350 0 0 {name=TR10_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".include $::LIB/../ip62_models"
spice_ignore=false}
