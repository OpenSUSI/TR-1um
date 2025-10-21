v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 0 -20 20 -20 {lab=A}
N 0 -20 -0 70 {lab=A}
N 0 70 20 70 {lab=A}
N 60 -120 60 -50 {lab=VDD}
N 60 -20 80 -20 {lab=VDD}
N 80 -70 80 -20 {lab=VDD}
N 60 -70 80 -70 {lab=VDD}
N 60 10 60 40 {lab=Q}
N 60 100 60 150 {lab=#net1}
N 60 70 80 70 {lab=#net1}
N 80 70 80 120 {lab=#net1}
N 60 120 80 120 {lab=#net1}
N 60 20 160 20 {lab=Q}
N -80 20 -0 20 {lab=A}
C {IP62LIB/MP.sym} 20 -20 0 0 {name=XM1 model=PMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 20 70 0 0 {name=XM2 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/ipin.sym} -80 20 0 0 {name=p1 lab=A
}
C {devices/opin.sym} 160 20 0 0 {name=p2 lab=Q}
C {devices/iopin.sym} 60 -120 0 0 {name=p3 lab=VDD}
C {devices/iopin.sym} 60 150 0 0 {name=p4 lab=VSS}
