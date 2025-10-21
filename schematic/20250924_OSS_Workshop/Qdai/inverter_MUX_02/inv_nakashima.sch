v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 30 -90 30 -40 {lab=VDD}
N -20 -10 -10 -10 {lab=A}
N -20 -10 -20 100 {lab=A}
N -20 100 -0 100 {lab=A}
N 30 -10 50 -10 {lab=VDD}
N 50 -50 50 -10 {lab=VDD}
N 30 -50 50 -50 {lab=VDD}
N -60 50 -20 50 {lab=A}
N 30 20 80 20 {lab=Q}
N 80 20 80 70 {lab=Q}
N 40 70 80 70 {lab=Q}
N 80 50 150 50 {lab=Q}
N 40 130 40 200 {lab=VSS}
N 40 130 40 140 {lab=VSS}
N 40 140 70 140 {lab=VSS}
N 70 100 70 140 {lab=VSS}
N 40 100 70 100 {lab=VSS}
C {IP62LIB/MP.sym} -10 -10 0 0 {name=XM1 model=PMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 0 100 0 0 {name=XM2 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/iopin.sym} 40 200 0 0 {name=p1 lab=VSS}
C {devices/iopin.sym} 30 -90 0 0 {name=p2 lab=VDD}
C {devices/ipin.sym} -60 50 0 0 {name=p3 lab=A}
C {devices/opin.sym} 150 50 0 0 {name=p4 lab=Q}
