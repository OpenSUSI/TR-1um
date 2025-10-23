v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 300 -330 300 -290 {
lab=Y}
N 100 -330 100 -310 {
lab=Y}
N 100 -310 300 -310 {
lab=Y}
N 200 -330 200 -310 {
lab=Y}
N 300 -230 300 -190 {
lab=#net1}
N 300 -130 300 -90 {
lab=#net2}
N 250 -360 260 -360 {
lab=C}
N 250 -360 250 -260 {
lab=C}
N 250 -260 260 -260 {
lab=C}
N 150 -360 160 -360 {
lab=B}
N 150 -360 150 -160 {
lab=B}
N 150 -160 260 -160 {
lab=B}
N 50 -360 60 -360 {
lab=A}
N 50 -360 50 -60 {
lab=A}
N 50 -60 260 -60 {
lab=A}
N 100 -410 100 -390 {
lab=VDD}
N 100 -410 370 -410 {
lab=VDD}
N 100 -360 120 -360 {
lab=VDD}
N 120 -410 120 -360 {
lab=VDD}
N 200 -410 200 -390 {
lab=VDD}
N 200 -360 220 -360 {
lab=VDD}
N 220 -410 220 -360 {
lab=VDD}
N 300 -410 300 -390 {
lab=VDD}
N 300 -360 320 -360 {
lab=VDD}
N 320 -410 320 -360 {
lab=VDD}
N 300 -30 300 -10 {
lab=GND}
N 300 -10 390 -10 {
lab=GND}
N 330 -260 330 -10 {
lab=GND}
N 300 -260 330 -260 {
lab=GND}
N 300 -160 330 -160 {
lab=GND}
N 300 -60 330 -60 {
lab=GND}
N 300 -310 360 -310 {
lab=Y}
N 30 -290 150 -290 {
lab=B}
N 30 -310 50 -310 {
lab=A}
N 30 -270 250 -270 {
lab=C}
C {ipin.sym} 30 -290 0 0 {name=p1 lab=B}
C {ipin.sym} 30 -310 0 0 {name=p2 lab=A}
C {opin.sym} 360 -310 0 0 {name=p3 lab=Y}
C {iopin.sym} 390 -10 0 0 {name=p4 lab=GND
}
C {iopin.sym} 370 -410 0 0 {name=p5 lab=VDD
}
C {ipin.sym} 30 -270 0 0 {name=p6 lab=C}
C {IP62LIB/MP.sym} 60 -360 0 0 {name=XM1 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 160 -360 0 0 {name=XM4 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 260 -360 0 0 {name=XM6 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 260 -260 0 0 {name=XM7 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 260 -160 0 0 {name=XM2 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 260 -60 0 0 {name=XM3 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
