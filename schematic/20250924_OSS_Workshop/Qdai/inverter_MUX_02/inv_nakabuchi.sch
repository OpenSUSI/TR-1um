v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 40 120 50 120 {lab=VSS}
N 40 50 40 120 {lab=VSS}
N 40 -60 40 -10 {lab=Q}
N 40 20 90 20 {lab=VSS}
N 90 20 90 90 {lab=VSS}
N 40 90 90 90 {lab=VSS}
N 0 -90 0 20 {lab=A}
N -70 -40 -0 -40 {lab=A}
N 40 -90 110 -90 {lab=VDD}
N 110 -140 110 -90 {lab=VDD}
N 40 -140 110 -140 {lab=VDD}
N 40 -140 40 -120 {lab=VDD}
N 40 -140 40 -120 {lab=VDD}
N 40 -180 50 -180 {lab=VDD}
N 40 -180 40 -140 {lab=VDD}
N 40 -40 150 -40 {lab=Q}
C {IP62LIB/MP.sym} 0 -90 0 0 {name=XM1 model=PMOS w=7u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 0 20 0 0 {name=XM2 model=NMOS w=7u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/iopin.sym} 50 -180 0 0 {name=p1 lab=VDD}
C {devices/opin.sym} 150 -40 0 0 {name=p3 lab=Q}
C {devices/iopin.sym} 50 120 0 0 {name=p4 lab=VSS}
C {devices/ipin.sym} -70 -40 0 0 {name=p7 lab=A}
