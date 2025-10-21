v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 40 -180 40 -100 {lab=VDD}
N -40 -70 -0 -70 {lab=A}
N -40 -70 -40 70 {lab=A}
N -40 70 -0 70 {lab=A}
N 40 -40 80 -40 {lab=Q}
N 80 -40 80 40 {lab=Q}
N 40 40 80 40 {lab=Q}
N 80 -0 160 -0 {lab=Q}
N 40 100 40 180 {lab=VSS}
N -110 -0 -40 0 {lab=A}
N 40 -70 60 -70 {lab=VDD}
N 60 -120 60 -70 {lab=VDD}
N 40 -120 60 -120 {lab=VDD}
N 40 70 60 70 {lab=VSS}
N 60 70 60 120 {lab=VSS}
N 40 120 60 120 {lab=VSS}
C {IP62LIB/MP.sym} 0 -70 0 0 {name=XM1 model=PMOS w=5u l=5u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 0 70 0 0 {name=XM2 model=NMOS w=5u l=5u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/iopin.sym} 40 -180 0 0 {name=p1 lab=VDD}
C {devices/iopin.sym} 40 180 0 0 {name=p2 lab=VSS}
C {devices/ipin.sym} -110 0 0 0 {name=p3 lab=A}
C {devices/opin.sym} 160 0 0 0 {name=p4 lab=Q}
