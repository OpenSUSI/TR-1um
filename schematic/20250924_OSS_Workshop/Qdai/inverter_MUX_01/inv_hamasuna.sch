v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 220 -70 220 -30 {lab=VDD}
N 220 30 270 30 {lab=Q}
N 270 30 270 110 {lab=Q}
N 220 110 270 110 {lab=Q}
N 270 70 320 70 {lab=Q}
N 150 -0 180 -0 {lab=A}
N 150 -0 150 140 {lab=A}
N 150 140 180 140 {lab=A}
N 80 70 150 70 {lab=A}
N 220 -0 280 -0 {lab=VDD}
N 280 -50 280 -0 {lab=VDD}
N 220 -50 280 -50 {lab=VDD}
N 220 170 220 230 {lab=VSS}
N 220 140 290 140 {lab=VSS}
N 290 140 290 200 {lab=VSS}
N 220 200 290 200 {lab=VSS}
C {IP62LIB/MP.sym} 180 0 0 0 {name=XM1 model=PMOS w=6.8u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 180 140 0 0 {name=XM2 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/iopin.sym} 220 -70 2 0 {name=p1 lab=VDD}
C {devices/iopin.sym} 220 230 0 0 {name=p2 lab=VSS}
C {devices/ipin.sym} 80 70 0 0 {name=p3 lab=A}
C {devices/opin.sym} 320 70 0 0 {name=p4 lab=Q}
