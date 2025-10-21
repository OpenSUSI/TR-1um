v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 10 -10 10 -0 {lab=A}
N 10 0 10 10 {lab=A}
N 10 10 10 20 {lab=A}
N 10 20 10 30 {lab=A}
N 10 30 10 40 {lab=A}
N 10 40 10 50 {lab=A}
N 10 50 10 60 {lab=A}
N 10 60 10 70 {lab=A}
N 50 20 50 40 {lab=Q}
N 50 -90 50 -40 {lab=VDD}
N 50 100 50 140 {lab=VSS}
N -40 30 10 30 {lab=A}
N 50 30 130 30 {lab=Q}
N 50 -20 50 -10 {lab=VDD}
N 50 -40 50 -10 {lab=VDD}
N 50 70 50 100 {lab=VSS}
C {IP62LIB/MP.sym} 10 -10 0 0 {name=XM1 model=PMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 10 70 0 0 {name=XM2 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/ipin.sym} -40 30 0 0 {name=p2 lab=A}
C {devices/iopin.sym} 50 -90 2 1 {name=p1 lab=VDD}
C {devices/iopin.sym} 50 140 0 0 {name=p3 lab=VSS}
C {devices/opin.sym} 130 30 0 0 {name=p4 lab=Q}
