v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 240 -440 240 -350 {lab=Y}
N 170 -470 200 -470 {lab=A}
N 170 -470 170 -320 {lab=A}
N 170 -320 200 -320 {lab=A}
N 240 -210 240 -170 {lab=VSS}
N 240 -390 300 -390 {lab=Y}
N 130 -390 170 -390 {lab=A}
N 220 -590 240 -590 {lab=#net1}
N 240 -590 240 -500 {lab=#net1}
N 240 -470 290 -470 {lab=#net1}
N 240 -530 290 -530 {lab=#net1}
N 240 -320 290 -320 {lab=VSS}
N 290 -320 290 -260 {lab=VSS}
N 240 -260 290 -260 {lab=VSS}
N 240 -290 240 -270 {lab=VSS}
N 290 -530 290 -470 {lab=#net1}
N 240 -260 240 -210 {lab=VSS}
N 240 -270 240 -260 {lab=VSS}
N 220 -170 240 -170 {lab=VSS}
C {IP62LIB/MP.sym} 200 -470 0 0 {name=XM2 model=PMOS w=8u l=1u m=5 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/opin.sym} 300 -390 0 0 {name=p1 lab=Y}
C {devices/ipin.sym} 130 -390 0 0 {name=p3 lab=A}
C {IP62LIB/MN.sym} 200 -320 0 0 {name=XM1 model=NMOS w=3.4u l=1u m=5 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/iopin.sym} 220 -590 2 0 {name=p2 lab=VDD}
C {devices/iopin.sym} 220 -170 2 0 {name=p4 lab=VSS}
