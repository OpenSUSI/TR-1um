v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 200 -210 220 -210 {
lab=VDD}
N 200 -160 220 -160 {
lab=VDD}
N 100 -160 120 -160 {
lab=VDD}
N 200 -60 220 -60 {
lab=GND}
N 220 -60 220 -10 {
lab=GND}
N 200 -10 220 -10 {
lab=GND}
N 100 -60 120 -60 {
lab=GND}
N 120 -60 120 -10 {
lab=GND}
N 100 -10 120 -10 {
lab=GND}
N 150 -60 160 -60 {
lab=#net1}
N 50 -60 60 -60 {
lab=A}
N 30 -110 50 -110 {
lab=A}
N 100 -130 100 -90 {
lab=#net1}
N 50 -160 60 -160 {
lab=A}
N 50 -160 50 -60 {
lab=A}
N 100 -210 120 -210 {
lab=VDD}
N 100 -30 100 0 {
lab=GND}
N 200 -30 200 0 {
lab=GND}
N 150 -160 160 -160 {
lab=#net1}
N 150 -160 150 -60 {
lab=#net1}
N 220 -210 220 -160 {
lab=VDD}
N 120 -210 120 -160 {
lab=VDD}
N 100 -220 100 -190 {
lab=VDD}
N 200 -220 200 -190 {
lab=VDD}
N 200 -110 250 -110 {
lab=Y}
N 100 -110 150 -110 {
lab=#net1}
N 100 -220 250 -220 {
lab=VDD}
N 200 -130 200 -90 {
lab=Y}
N 100 0 250 0 {
lab=GND}
C {ipin.sym} 30 -110 0 0 {name=p1 lab=A}
C {opin.sym} 250 -110 0 0 {name=p2 lab=Y}
C {iopin.sym} 250 -220 0 0 {name=p3 lab=VDD}
C {iopin.sym} 250 0 0 0 {name=p5 lab=GND}
C {IP62LIB/MP.sym} 60 -160 0 0 {name=XM7 model=PMOS w=10.2u l=1u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 160 -160 0 0 {name=XM1 model=PMOS w=10.2u l=1u m=10 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 60 -60 0 0 {name=XM3 model=NMOS w=3.4u l=1u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 160 -60 0 0 {name=XM2 model=NMOS w=3.4u l=1u m=10 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
