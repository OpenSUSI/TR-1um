v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 100 -50 220 -50 {
lab=vss}
N 160 -50 160 -30 {
lab=vss}
N 160 -460 160 -440 {
lab=vdd}
N 90 -180 100 -180 {
lab=vss}
N 90 -180 90 -140 {
lab=vss}
N 220 -230 230 -230 {
lab=#net1}
N 230 -230 230 -190 {
lab=#net1}
N 220 -190 230 -190 {
lab=#net1}
N 100 -360 100 -340 {
lab=#net2}
N 220 -70 220 -50 {
lab=vss}
N 100 -440 100 -420 {
lab=vdd}
N 100 -440 220 -440 {
lab=vdd}
N 220 -440 220 -420 {
lab=vdd}
N 90 -390 100 -390 {
lab=vdd}
N 90 -430 90 -390 {
lab=vdd}
N 90 -430 100 -430 {
lab=vdd}
N 220 -390 230 -390 {
lab=vdd}
N 230 -430 230 -390 {
lab=vdd}
N 220 -430 230 -430 {
lab=vdd}
N 140 -390 180 -390 {
lab=ib}
N 220 -360 220 -340 {
lab=ib}
N 170 -350 220 -350 {
lab=ib}
N 170 -390 170 -350 {
lab=ib}
N 100 -150 100 -50 {
lab=vss}
N 90 -140 100 -140 {
lab=vss}
N 220 -200 220 -130 {
lab=#net1}
N 100 -230 180 -230 {
lab=#net2}
N 140 -180 220 -180 {
lab=#net1}
N 220 -280 220 -260 {
lab=ib}
N 100 -280 100 -210 {
lab=#net2}
N 100 -340 100 -280 {
lab=#net2}
N 220 -340 220 -280 {
lab=ib}
N 220 -300 250 -300 {
lab=ib}
C {primitives/HR_poly.sym} 220 -100 0 0 {name=R2 model=R_poly W=1 L=1000}
C {primitives/pfet.sym} 200 -390 0 0 {name=M4 
model=pmos
W=100u
L=2u
m=1
}
C {primitives/pfet.sym} 120 -390 0 1 {name=M3 
model=pmos
W=100u
L=2u
m=1
}
C {primitives/nfet.sym} 200 -230 0 0 {name=M2 
model=nmos
W=20u
L=2u
m=1
}
C {primitives/nfet.sym} 120 -180 0 1 {name=M1 
model=nmos
W=20u
L=2u
m=1
}
C {devices/iopin.sym} 160 -460 0 0 {name=p1 lab=vdd
}
C {devices/iopin.sym} 160 -30 0 0 {name=p4 lab=vss
}
C {devices/iopin.sym} 250 -300 2 1 {name=p3 lab=ib}
