v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 140 -280 140 -250 {lab=VDD}
N 140 -190 140 -150 {lab=Q}
N 140 -150 140 -130 {lab=Q}
N 70 -220 100 -220 {lab=A}
N 70 -220 70 -100 {lab=A}
N 70 -100 100 -100 {lab=A}
N 50 -160 70 -160 {lab=A}
N 140 -160 210 -160 {lab=Q}
N 140 -70 140 -20 {lab=VSS}
N 140 -300 140 -280 {lab=VDD}
N 140 -100 150 -100 {lab=VSS}
N 140 -220 160 -220 {lab=VDD}
N 160 -260 160 -220 {lab=VDD}
N 140 -260 160 -260 {lab=VDD}
N 150 -100 160 -100 {lab=VSS}
N 160 -100 160 -60 {lab=VSS}
N 140 -60 160 -60 {lab=VSS}
C {IP62LIB/MP.sym} 100 -220 0 0 {name=XM1 model=PMOS w=15u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 100 -100 0 0 {name=XM2 model=NMOS w=5.6u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/iopin.sym} 140 -300 0 0 {name=p1 lab=VDD
}
C {devices/iopin.sym} 140 -20 0 0 {name=p2 lab=VSS
}
C {devices/opin.sym} 210 -160 0 0 {name=p3 lab=Q}
C {devices/ipin.sym} 50 -160 0 0 {name=p4 lab=A}
