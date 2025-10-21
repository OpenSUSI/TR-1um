v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 0 -40 -0 40 {lab=Q}
N 0 0 60 -0 {lab=Q}
N -60 -70 -40 -70 {lab=A}
N -60 -70 -60 70 {lab=A}
N -50 70 -40 70 {lab=A}
N -60 70 -50 70 {lab=A}
N -120 -0 -60 0 {lab=A}
N 0 100 0 130 {lab=VSS}
N -0 -130 0 -100 {lab=VDD}
N -0 -150 0 -130 {lab=VDD}
N 0 130 0 150 {lab=VSS}
N -0 -70 20 -70 {lab=VDD}
N 20 -120 20 -70 {lab=VDD}
N 0 -120 20 -120 {lab=VDD}
N 0 70 20 70 {lab=VSS}
N 20 70 20 120 {lab=VSS}
N 0 120 20 120 {lab=VSS}
C {devices/iopin.sym} 0 -150 2 0 {name=p1 lab=VDD}
C {devices/iopin.sym} 0 150 2 0 {name=p2 lab=VSS}
C {devices/ipin.sym} -120 0 0 0 {name=p3 lab=A}
C {devices/opin.sym} 60 0 0 0 {name=p4 lab=Q}
C {IP62LIB/MP.sym} -40 -70 0 0 {name=XM1 model=PMOS w=45u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} -40 70 0 0 {name=XM2 model=NMOS w=15u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
