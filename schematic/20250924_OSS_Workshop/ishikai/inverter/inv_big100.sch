v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 40 -160 40 -110 {lab=VDD}
N 40 -80 60 -80 {lab=VDD}
N 60 -120 60 -80 {lab=VDD}
N 40 -120 60 -120 {lab=VDD}
N -0 -80 -0 80 {lab=A}
N -100 -0 -0 0 {lab=A}
N 40 -50 40 50 {lab=Q}
N 40 0 200 -0 {lab=Q}
N 40 110 40 160 {lab=VSS}
N 40 80 60 80 {lab=VSS}
N 60 80 60 120 {lab=VSS}
N 40 120 60 120 {lab=VSS}
C {IP62LIB/MP.sym} 0 -80 0 0 {name=XM1 model=PMOS w=1020u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 0 80 0 0 {name=XM2 model=NMOS w=340u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/ipin.sym} -100 0 0 0 {name=p1 lab=A}
C {devices/iopin.sym} 40 -160 0 0 {name=p2 lab=VDD}
C {devices/iopin.sym} 40 160 0 0 {name=p3 lab=VSS}
C {devices/opin.sym} 200 0 0 0 {name=p4 lab=Q}
