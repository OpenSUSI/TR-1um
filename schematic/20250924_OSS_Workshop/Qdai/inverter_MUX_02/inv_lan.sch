v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -40 -100 -40 -80 {lab=VDD}
N -40 120 -40 170 {lab=xxx}
N -40 70 0 70 {lab=xxx}
N 0 70 0 120 {lab=xxx}
N -40 120 0 120 {lab=xxx}
N -200 10 -120 10 {lab=A}
N -120 -50 -120 10 {lab=A}
N -120 -50 -80 -50 {lab=A}
N -120 70 -80 70 {lab=A}
N -120 10 -120 70 {lab=A}
N -40 -20 0 -20 {lab=Q}
N 0 -20 0 10 {lab=Q}
N 0 10 140 10 {lab=Q}
N -40 40 0 40 {lab=Q}
N 0 10 0 40 {lab=Q}
N -40 -50 -10 -50 {lab=VDD}
N -10 -100 -10 -50 {lab=VDD}
N -40 -100 -10 -100 {lab=VDD}
N -40 100 -40 120 {lab=xxx}
N -40 -120 -40 -100 {lab=VDD}
C {IP62LIB/MP.sym} -80 -50 0 0 {name=XM1 model=PMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} -80 70 0 0 {name=XM2 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/ipin.sym} -200 10 0 0 {name=p3 lab=A}
C {devices/opin.sym} 140 10 0 0 {name=p2 lab=Q
}
C {devices/iopin.sym} -40 -120 0 0 {name=p1 lab=VDD}
C {devices/iopin.sym} -40 170 0 0 {name=p4 lab=VSS}
