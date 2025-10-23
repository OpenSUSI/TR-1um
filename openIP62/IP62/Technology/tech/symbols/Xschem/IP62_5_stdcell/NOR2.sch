v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 350 -450 350 -410 {
lab=VDD}
N 350 -380 400 -380 {
lab=VDD}
N 400 -430 400 -380 {
lab=VDD}
N 350 -430 400 -430 {
lab=VDD}
N 350 -350 350 -290 {
lab=#net1}
N 350 -260 400 -260 {
lab=VDD}
N 400 -330 400 -260 {
lab=VDD}
N 350 -230 350 -90 {
lab=Y}
N 30 -380 310 -380 {
lab=A}
N 350 0 400 0 {
lab=GND}
N 400 -60 400 0 {
lab=GND}
N 350 -60 400 -60 {
lab=GND}
N 30 -260 310 -260 {
lab=B}
N 80 -60 140 -60 {
lab=A}
N 80 -380 80 -60 {
lab=A}
N 180 -60 230 -60 {
lab=GND}
N 230 -60 230 0 {
lab=GND}
N 180 0 230 0 {
lab=GND}
N 180 -30 180 0 {
lab=GND}
N 230 0 350 0 {
lab=GND}
N 180 -120 180 -90 {
lab=Y}
N 180 -120 350 -120 {
lab=Y}
N 350 -120 430 -120 {
lab=Y}
N 260 -60 310 -60 {
lab=B}
N 260 -260 260 -60 {
lab=B}
N 400 -380 400 -330 {
lab=VDD}
N 350 -450 410 -450 {
lab=VDD}
N 350 -30 350 0 {
lab=GND}
N 400 0 430 0 {
lab=GND}
C {ipin.sym} 30 -380 0 0 {name=p1 lab=A}
C {ipin.sym} 30 -260 0 0 {name=p2 lab=B
}
C {opin.sym} 430 -120 0 0 {name=p3 lab=Y}
C {iopin.sym} 410 -450 0 0 {name=p4 lab=VDD}
C {iopin.sym} 430 0 0 0 {name=p5 lab=GND}
C {IP62LIB/MP.sym} 310 -380 0 0 {name=XM7 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 310 -260 0 0 {name=XM1 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 140 -60 0 0 {name=XM2 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 310 -60 0 0 {name=XM3 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
