v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 40 -70 40 -30 {lab=VDD}
N 40 30 120 30 {lab=Q}
N 120 30 120 100 {lab=Q}
N 120 100 120 150 {lab=Q}
N 40 150 120 150 {lab=Q}
N 40 0 70 -0 {lab=VDD}
N 70 -40 70 -0 {lab=VDD}
N 40 -40 70 -40 {lab=VDD}
N 120 100 160 100 {lab=Q}
N 40 210 40 280 {lab=VSS}
N 40 180 80 180 {lab=VSS}
N 80 180 80 230 {lab=VSS}
N 40 230 80 230 {lab=VSS}
N -50 180 -0 180 {lab=A}
N -50 0 -50 180 {lab=A}
N -50 0 -0 0 {lab=A}
N -100 90 -50 90 {lab=A}
C {IP62LIB/MP.sym} 0 0 0 0 {name=XM1 model=PMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 0 180 0 0 {name=XM2 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/iopin.sym} 40 -70 0 0 {name=p1 lab=VDD}
C {devices/opin.sym} 160 100 0 0 {name=p3 lab=Q}
C {devices/iopin.sym} 40 280 0 0 {name=p4 lab=VSS}
C {devices/ipin.sym} -100 90 0 0 {name=p5 lab=A}
