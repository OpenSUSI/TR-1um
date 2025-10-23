v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 140 -260 150 -260 {
lab=B}
N 140 -260 140 -140 {
lab=B}
N 140 -140 150 -140 {
lab=B}
N 190 -230 190 -170 {
lab=Y}
N 190 -190 230 -190 {
lab=Y}
N 190 -110 190 -90 {
lab=#net1}
N 50 -260 60 -260 {
lab=A}
N 50 -260 50 -60 {
lab=A}
N 100 -300 100 -290 {
lab=VDD}
N 190 -300 190 -290 {
lab=VDD}
N 190 -30 190 -20 {
lab=GND}
N 190 -20 230 -20 {
lab=GND}
N 100 -260 120 -260 {
lab=VDD}
N 120 -300 120 -260 {
lab=VDD}
N 190 -260 210 -260 {
lab=VDD}
N 210 -300 210 -260 {
lab=VDD}
N 190 -140 210 -140 {
lab=GND}
N 210 -140 210 -20 {
lab=GND}
N 190 -60 200 -60 {
lab=GND}
N 200 -60 210 -60 {
lab=GND}
N 50 -260 60 -260 {
lab=A}
N 100 -210 190 -210 {
lab=Y}
N 50 -60 150 -60 {
lab=A}
N 100 -230 100 -210 {
lab=Y}
N 30 -160 140 -160 {
lab=B}
N 30 -190 50 -190 {
lab=A}
N 100 -300 230 -300 {
lab=VDD}
C {ipin.sym} 30 -160 0 0 {name=p1 lab=B}
C {ipin.sym} 30 -190 0 0 {name=p2 lab=A}
C {opin.sym} 230 -190 0 0 {name=p3 lab=Y}
C {iopin.sym} 230 -20 0 0 {name=p4 lab=GND
}
C {iopin.sym} 230 -300 0 0 {name=p5 lab=VDD
}
C {IP62LIB/MP.sym} 60 -260 0 0 {name=XM7 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 150 -260 0 0 {name=XM1 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 150 -140 0 0 {name=XM2 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 150 -60 0 0 {name=XM3 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
