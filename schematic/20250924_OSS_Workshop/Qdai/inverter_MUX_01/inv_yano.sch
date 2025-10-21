v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 60 -150 60 -130 {lab=VDD}
N 60 -130 60 -110 {lab=VDD}
N 60 -110 60 -100 {lab=VDD}
N 60 -100 60 -90 {lab=VDD}
N 60 -90 60 -80 {lab=VDD}
N 60 -20 120 -20 {lab=Q}
N 120 -20 120 70 {lab=Q}
N 60 70 120 70 {lab=Q}
N 120 30 150 30 {lab=Q}
N 60 130 60 210 {lab=VSS}
N -100 30 -20 30 {lab=#net1}
N -20 -50 20 -50 {lab=#net1}
N -20 -50 -20 100 {lab=#net1}
N -20 100 20 100 {lab=#net1}
N 60 100 90 100 {lab=VSS}
N 90 100 90 150 {lab=VSS}
N 60 150 90 150 {lab=VSS}
N 60 -50 90 -50 {lab=VDD}
N 90 -100 90 -50 {lab=VDD}
N 60 -100 90 -100 {lab=VDD}
C {IP62LIB/MP.sym} 20 -50 0 0 {name=XM1 model=PMOS w=6.5u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 20 100 0 0 {name=XM2 model=NMOS w=10u l=10u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/iopin.sym} 60 -150 0 0 {name=p1 lab=VDD}
C {devices/iopin.sym} 60 210 0 0 {name=p2 lab=VSS}
C {devices/opin.sym} 150 30 0 0 {name=p4 lab=Q}
C {devices/ipin.sym} -100 30 0 0 {name=p3 lab=A}
