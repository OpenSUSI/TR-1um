v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 230 0 250 0 {
lab=GND}
N 250 -50 250 -10 {
lab=GND}
N 230 -50 250 -50 {
lab=GND}
N 140 0 210 0 {
lab=GND}
N 210 0 230 0 {
lab=GND}
N 230 -360 290 -360 {
lab=VDD}
N 250 0 310 0 {
lab=GND}
N 140 -50 160 -50 {
lab=GND}
N 160 -50 160 -20 {
lab=GND}
N 160 -20 160 0 {
lab=GND}
N 230 -360 230 -350 {
lab=VDD}
N 180 -50 190 -50 {
lab=#net1}
N 180 -150 180 -50 {
lab=#net1}
N 180 -150 190 -150 {
lab=#net1}
N 180 -200 180 -150 {
lab=#net1}
N 90 -320 190 -320 {
lab=B}
N 90 -320 90 -160 {
lab=B}
N 90 -160 100 -160 {
lab=B}
N 50 -240 190 -240 {
lab=A}
N 50 -240 50 -50 {
lab=A}
N 50 -50 100 -50 {
lab=A}
N 30 -320 90 -320 {
lab=B}
N 230 -290 230 -270 {
lab=#net2}
N 30 -240 50 -240 {
lab=A}
N 230 -120 230 -80 {
lab=Y}
N 230 -100 300 -100 {
lab=Y}
N 140 -200 180 -200 {
lab=#net1}
N 140 -100 180 -100 {
lab=#net1}
N 140 -20 140 -10 {
lab=GND}
N 140 -100 140 -80 {
lab=#net1}
N 140 -160 160 -160 {
lab=GND}
N 160 -160 160 -50 {
lab=GND}
N 140 -130 140 -120 {
lab=GND}
N 140 -120 160 -120 {
lab=GND}
N 230 -150 250 -150 {
lab=VDD}
N 250 -360 250 -150 {
lab=VDD}
N 230 -240 250 -240 {
lab=VDD}
N 230 -320 250 -320 {
lab=VDD}
N 230 -190 230 -180 {
lab=VDD}
N 230 -190 250 -190 {
lab=VDD}
N 180 -200 230 -200 {
lab=#net1}
N 230 -210 230 -200 {
lab=#net1}
N 140 -200 140 -190 {
lab=#net1}
N 140 -10 140 0 {
lab=GND}
N 230 -20 230 0 {
lab=GND}
N 250 -10 250 0 {
lab=GND}
C {ipin.sym} 30 -240 0 0 {name=p1 lab=A}
C {ipin.sym} 30 -320 0 0 {name=p2 lab=B
}
C {opin.sym} 300 -100 0 0 {name=p3 lab=Y}
C {iopin.sym} 290 -360 0 0 {name=p4 lab=VDD}
C {iopin.sym} 310 0 0 0 {name=p5 lab=GND}
C {IP62LIB/MP.sym} 190 -320 0 0 {name=XM7 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 190 -240 0 0 {name=XM2 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 190 -150 0 0 {name=XM4 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 100 -160 0 0 {name=XM1 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 100 -50 0 0 {name=XM3 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 190 -50 0 0 {name=XM5 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
