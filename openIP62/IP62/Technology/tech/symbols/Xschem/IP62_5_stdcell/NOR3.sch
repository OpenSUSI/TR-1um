v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 320 -370 320 -360 {
lab=VDD}
N 320 -370 380 -370 {
lab=VDD}
N 320 -300 320 -280 {
lab=#net1}
N 320 -220 320 -200 {
lab=#net2}
N 50 -70 60 -70 {
lab=B}
N 50 -330 50 -70 {
lab=B}
N 100 -40 100 -10 {
lab=GND}
N 100 -10 390 -10 {
lab=GND}
N 100 -70 120 -70 {
lab=GND}
N 120 -70 120 -30 {
lab=GND}
N 100 -30 120 -30 {
lab=GND}
N 210 -70 230 -70 {
lab=GND}
N 230 -70 230 -30 {
lab=GND}
N 210 -30 230 -30 {
lab=GND}
N 210 -40 210 -10 {
lab=GND}
N 210 -120 210 -100 {
lab=Y}
N 320 -140 320 -120 {
lab=Y}
N 320 -40 320 -10 {
lab=GND}
N 320 -30 340 -30 {
lab=GND}
N 100 -120 100 -110 {
lab=Y}
N 100 -120 320 -120 {
lab=Y}
N 320 -120 390 -120 {
lab=Y}
N 30 -250 280 -250 {
lab=A}
N 30 -170 280 -170 {
lab=C}
N 150 -70 170 -70 {
lab=C}
N 150 -170 150 -70 {
lab=C}
N 260 -250 260 -80 {
lab=A}
N 320 -250 360 -250 {
lab=VDD}
N 360 -370 360 -250 {
lab=VDD}
N 320 -330 360 -330 {
lab=VDD}
N 320 -170 360 -170 {
lab=VDD}
N 360 -250 360 -170 {
lab=VDD}
N 260 -80 260 -70 {
lab=A}
N 260 -70 280 -70 {
lab=A}
N 320 -120 320 -100 {
lab=Y}
N 340 -70 340 -30 {
lab=GND}
N 320 -70 340 -70 {
lab=GND}
N 100 -110 100 -100 {
lab=Y}
N 50 -330 280 -330 {
lab=B}
N 30 -210 50 -210 {
lab=B}
C {ipin.sym} 30 -250 0 0 {name=p1 lab=A}
C {ipin.sym} 30 -210 0 0 {name=p2 lab=B
}
C {opin.sym} 390 -120 0 0 {name=p3 lab=Y}
C {iopin.sym} 380 -370 0 0 {name=p4 lab=VDD}
C {iopin.sym} 390 -10 0 0 {name=p5 lab=GND
}
C {ipin.sym} 30 -170 0 0 {name=p6 lab=C
}
C {IP62LIB/MP.sym} 280 -330 0 0 {name=XM7 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 280 -250 0 0 {name=XM2 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 280 -170 0 0 {name=XM3 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 60 -70 0 0 {name=XM1 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 170 -70 0 0 {name=XM4 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 280 -70 0 0 {name=XM5 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
