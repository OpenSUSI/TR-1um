v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 180 -100 190 -100 {lab=#net1}
N 190 -140 190 -100 {lab=#net1}
N 180 -140 190 -140 {lab=#net1}
N 180 -70 230 -70 {lab=#net2}
N 230 -70 230 60 {lab=#net2}
N 180 60 230 60 {lab=#net2}
N 180 90 190 90 {lab=#net3}
N 190 90 190 130 {lab=#net3}
N 180 120 180 180 {lab=#net3}
N 180 130 190 130 {lab=#net3}
N 100 -100 140 -100 {lab=vin}
N 100 -100 100 90 {lab=vin}
N 100 90 140 90 {lab=vin}
N 230 -0 290 -0 {lab=#net2}
N 30 0 100 -0 {lab=vin}
N 180 -180 180 -130 {lab=#net1}
C {IP62LIB/MP.sym} 140 -100 0 0 {name=XM1 model=PMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 140 90 0 0 {name=XM2 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/iopin.sym} 180 180 0 0 {name=p8 lab=VSS}
C {devices/iopin.sym} 180 -180 0 1 {name=p7 lab=VDD}
C {devices/ipin.sym} 30 0 0 0 {name=p1 lab=A}
C {devices/opin.sym} 290 0 0 0 {name=p6 lab=Q}
