v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 260 -250 270 -250 {
lab=#net1}
N 260 -130 270 -130 {
lab=#net1}
N 310 -130 330 -130 {
lab=GND}
N 330 -130 330 -80 {
lab=GND}
N 310 -80 330 -80 {
lab=GND}
N 310 -250 330 -250 {
lab=VDD}
N 330 -320 330 -250 {
lab=VDD}
N 310 -300 310 -280 {
lab=VDD}
N 310 -300 330 -300 {
lab=VDD}
N 160 -250 170 -250 {
lab=A}
N 160 -130 170 -130 {
lab=A}
N 310 -100 310 -40 {
lab=GND}
N 210 -320 210 -280 {
lab=VDD}
N 210 -250 230 -250 {
lab=VDD}
N 230 -300 230 -250 {
lab=VDD}
N 210 -300 230 -300 {
lab=VDD}
N 210 -100 210 -80 {
lab=#net2}
N 210 -20 210 0 {
lab=GND}
N 310 -40 310 0 {
lab=GND}
N 110 -220 110 -200 {
lab=#net1}
N 110 -200 210 -200 {
lab=#net1}
N 110 -320 110 -280 {
lab=VDD}
N 110 -320 210 -320 {
lab=VDD}
N 60 -250 70 -250 {
lab=B}
N 210 -180 260 -180 {
lab=#net1}
N 310 -180 360 -180 {
lab=Y}
N 210 0 360 0 {
lab=GND}
N 210 -320 360 -320 {
lab=VDD}
N 40 -180 160 -180 {
lab=A}
N 40 -50 170 -50 {
lab=B}
N 260 -250 260 -130 {
lab=#net1}
N 310 -220 310 -160 {
lab=Y}
N 210 -220 210 -160 {
lab=#net1}
N 160 -250 160 -130 {
lab=A}
N 60 -250 60 -50 {
lab=B}
N 210 -130 240 -130 {
lab=GND}
N 240 -130 240 -0 {
lab=GND}
N 210 -50 240 -50 {
lab=GND}
N 110 -250 130 -250 {
lab=VDD}
N 130 -320 130 -250 {
lab=VDD}
C {opin.sym} 360 -180 0 0 {name=p1 lab=Y}
C {ipin.sym} 40 -180 0 0 {name=p2 lab=A}
C {ipin.sym} 40 -50 0 0 {name=p3 lab=B}
C {iopin.sym} 360 -320 0 0 {name=p4 lab=VDD}
C {iopin.sym} 360 0 0 0 {name=p5 lab=GND}
C {IP62LIB/MP.sym} 70 -250 0 0 {name=XM7 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 170 -250 0 0 {name=XM1 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 270 -250 0 0 {name=XM2 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 270 -130 0 0 {name=XM3 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 170 -130 0 0 {name=XM4 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 170 -50 0 0 {name=XM5 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
