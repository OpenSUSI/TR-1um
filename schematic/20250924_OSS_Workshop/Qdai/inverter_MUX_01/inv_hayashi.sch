v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -700 -360 -700 -300 {lab=vin}
N -700 -360 -640 -360 {lab=vin}
N -700 -300 -700 -240 {lab=vin}
N -700 -240 -640 -240 {lab=vin}
N -600 -330 -550 -330 {lab=#net1}
N -600 -270 -550 -270 {lab=#net1}
N -550 -330 -550 -270 {lab=#net1}
N -550 -300 -490 -300 {lab=#net1}
N -720 -300 -700 -300 {lab=vin}
N -600 -210 -600 -140 {lab=#net2}
N -600 -210 -600 -140 {lab=#net2}
N -600 -190 -580 -190 {lab=#net2}
N -580 -240 -580 -190 {lab=#net2}
N -600 -240 -580 -240 {lab=#net2}
N -600 -360 -590 -360 {lab=#net3}
N -600 -430 -600 -390 {lab=#net3}
N -590 -410 -590 -360 {lab=#net3}
N -600 -410 -590 -410 {lab=#net3}
N -600 -430 -600 -390 {lab=#net3}
N -770 -300 -720 -300 {lab=vin}
C {IP62LIB/MN.sym} -640 -240 0 0 {name=XM2 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} -640 -360 0 0 {name=XM1 model=PMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/iopin.sym} -600 -430 0 1 {name=p7 lab=VDD}
C {devices/iopin.sym} -600 -140 0 0 {name=p8 lab=VSS}
C {devices/ipin.sym} -770 -300 0 0 {name=p1 lab=A}
C {devices/opin.sym} -490 -300 0 0 {name=p6 lab=Q}
