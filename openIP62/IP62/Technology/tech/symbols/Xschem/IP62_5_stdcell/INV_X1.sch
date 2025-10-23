v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 100 -180 100 -140 {
lab=Y}
N 100 -160 140 -160 {
lab=Y}
N 50 -210 60 -210 {
lab=A}
N 50 -210 50 -110 {
lab=A}
N 50 -110 60 -110 {
lab=A}
N 100 -260 120 -260 {
lab=VDD}
N 120 -250 120 -210 {
lab=VDD}
N 100 -210 120 -210 {
lab=VDD}
N 100 -110 120 -110 {
lab=GND}
N 120 -110 120 -70 {
lab=GND}
N 100 -60 120 -60 {
lab=GND}
N 30 -160 50 -160 {
lab=A}
N 100 -80 100 -50 {
lab=GND}
N 100 -270 100 -240 {
lab=VDD}
N 120 -260 120 -250 {
lab=VDD}
N 120 -70 120 -60 {
lab=GND}
C {ipin.sym} 30 -160 0 0 {name=p1 lab=A}
C {opin.sym} 140 -160 0 0 {name=p2 lab=Y}
C {iopin.sym} 100 -50 1 0 {name=p3 lab=GND}
C {iopin.sym} 100 -270 3 0 {name=p4 lab=VDD}
C {IP62LIB/MP.sym} 60 -210 0 0 {name=XM7 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 60 -110 0 0 {name=XM2 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
