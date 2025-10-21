v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -90 -170 -30 -170 {lab=A}
N -90 -170 -90 -100 {lab=A}
N -90 -100 -90 -10 {lab=A}
N -90 -10 -30 -10 {lab=A}
N 10 -240 10 -200 {lab=VDD}
N 10 -220 40 -220 {lab=VDD}
N 40 -220 40 -170 {lab=VDD}
N 10 -170 40 -170 {lab=VDD}
N 10 -140 90 -140 {lab=Q}
N 10 -40 90 -40 {lab=Q}
N 90 -140 90 -40 {lab=Q}
N 10 -10 40 -10 {lab=VSS}
N 40 -10 40 50 {lab=VSS}
N 10 50 40 50 {lab=VSS}
N 10 20 10 60 {lab=VSS}
N 10 -250 10 -240 {lab=VDD}
N 10 60 10 80 {lab=VSS}
N -170 -90 -90 -90 {lab=A}
N 90 -80 140 -80 {lab=Q}
C {MP.sym} -30 -170 0 0 {name=XM1 model=PMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {MN.sym} -30 -10 0 0 {name=XM2 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/iopin.sym} 10 80 0 0 {name=p3 lab=VSS
}
C {devices/iopin.sym} 10 -250 0 0 {name=p4 lab=VDD
}
C {devices/opin.sym} 140 -80 0 0 {name=p2 lab=Q}
C {devices/ipin.sym} -170 -90 0 0 {name=p1 lab=A}
