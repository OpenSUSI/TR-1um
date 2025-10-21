v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 50 -220 60 -220 {lab=VDD}
N 40 -220 50 -220 {lab=VDD}
N 40 -220 40 -210 {lab=VDD}
N 40 -210 40 -200 {lab=VDD}
N 40 -200 40 -190 {lab=VDD}
N 40 -190 40 -180 {lab=VDD}
N 40 -180 40 -170 {lab=VDD}
N -70 -90 -30 -90 {lab=A}
N -30 -140 -30 -90 {lab=A}
N -30 -140 -0 -140 {lab=A}
N -30 -40 -0 -40 {lab=A}
N -30 -90 -30 -40 {lab=A}
N 40 -110 80 -110 {lab=Q}
N 80 -110 80 -90 {lab=Q}
N 80 -90 160 -90 {lab=Q}
N 40 -70 80 -70 {lab=Q}
N 80 -90 80 -70 {lab=Q}
N 40 -140 60 -140 {lab=VDD}
N 60 -180 60 -140 {lab=VDD}
N 40 -180 60 -180 {lab=VDD}
N 40 -10 40 70 {lab=VSS}
N 40 -40 60 -40 {lab=VSS}
N 60 -40 60 0 {lab=VSS}
N 40 -0 60 -0 {lab=VSS}
N 40 70 50 70 {lab=VSS}
N 50 70 60 70 {lab=VSS}
C {IP62LIB/MP.sym} 0 -140 0 0 {name=XM1 model=PMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 0 -40 0 0 {name=XM2 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/iopin.sym} 60 -220 0 0 {name=p2 lab=VDD}
C {devices/ipin.sym} -70 -90 0 0 {name=p3 lab=A}
C {devices/iopin.sym} 60 70 0 0 {name=p4 lab=VSS}
C {devices/opin.sym} 160 -90 0 0 {name=p5 lab=Q}
