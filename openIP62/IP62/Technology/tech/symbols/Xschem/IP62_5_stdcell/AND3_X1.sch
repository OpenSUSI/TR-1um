v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 170 -380 270 -380 {
lab=VDD}
N 280 0 430 0 {
lab=GND}
N 270 -380 420 -380 {
lab=VDD}
N 390 -360 410 -360 {
lab=VDD}
N 410 -360 410 -310 {
lab=VDD}
N 390 -310 410 -310 {
lab=VDD}
N 390 -280 390 -240 {
lab=Y}
N 390 -130 410 -130 {
lab=GND}
N 410 -130 410 -80 {
lab=GND}
N 390 -80 410 -80 {
lab=GND}
N 340 -310 350 -310 {
lab=#net1}
N 340 -310 340 -210 {
lab=#net1}
N 270 -310 290 -310 {
lab=VDD}
N 310 -360 310 -310 {
lab=VDD}
N 270 -360 290 -360 {
lab=VDD}
N 270 -280 270 -240 {
lab=#net1}
N 270 -260 340 -260 {
lab=#net1}
N 270 -180 290 -180 {
lab=VDD}
N 270 -210 290 -210 {
lab=VDD}
N 130 -380 130 -340 {
lab=VDD}
N 130 -310 150 -310 {
lab=VDD}
N 150 -360 150 -310 {
lab=VDD}
N 130 -360 150 -360 {
lab=VDD}
N 170 -260 270 -260 {
lab=#net1}
N 130 -280 130 -260 {
lab=#net1}
N 170 0 280 0 {
lab=GND}
N 200 -310 230 -310 {
lab=B}
N 200 -50 230 -50 {
lab=B}
N 190 -10 270 -10 {
lab=#net2}
N 130 -100 150 -100 {
lab=GND}
N 150 -100 150 -50 {
lab=GND}
N 130 -50 150 -50 {
lab=GND}
N 70 -100 90 -100 {
lab=C}
N 270 -100 270 -80 {
lab=#net3}
N 270 -380 270 -340 {
lab=VDD}
N 390 -380 390 -340 {
lab=VDD}
N 310 -310 310 -180 {
lab=VDD}
N 270 -160 340 -160 {
lab=#net1}
N 340 -210 340 -160 {
lab=#net1}
N 200 -310 200 -50 {
lab=B}
N 170 -10 190 -10 {
lab=#net2}
N 290 -180 310 -180 {
lab=VDD}
N 290 -210 310 -210 {
lab=VDD}
N 290 -310 310 -310 {
lab=VDD}
N 290 -360 310 -360 {
lab=VDD}
N 220 -210 230 -210 {
lab=A}
N 220 -210 220 -130 {
lab=A}
N 220 -130 230 -130 {
lab=A}
N 270 -50 310 -50 {
lab=GND}
N 270 -130 310 -130 {
lab=GND}
N 310 -130 310 -100 {
lab=GND}
N 70 -310 70 -100 {
lab=C}
N 130 0 170 0 {
lab=GND}
N 130 -140 130 -130 {
lab=#net2}
N 130 -140 170 -140 {
lab=#net2}
N 340 -130 350 -130 {
lab=#net1}
N 340 -160 340 -130 {
lab=#net1}
N 390 -240 390 -160 {
lab=Y}
N 130 -380 170 -380 {
lab=VDD}
N 130 -260 170 -260 {
lab=#net1}
N 420 -380 430 -380 {
lab=VDD}
N 390 -220 430 -220 {
lab=Y}
N 30 -170 200 -170 {
lab=B}
N 270 -20 270 -10 {
lab=#net2}
N 170 -140 170 -10 {
lab=#net2}
N 130 -70 130 0 {
lab=GND}
N 310 -100 310 0 {
lab=GND}
N 390 -100 390 0 {
lab=GND}
N 30 -200 220 -200 {
lab=A}
N 70 -310 90 -310 {
lab=C}
N 30 -140 70 -140 {
lab=C}
C {opin.sym} 430 -220 0 0 {name=p1 lab=Y}
C {ipin.sym} 30 -200 0 0 {name=p2 lab=A}
C {ipin.sym} 30 -170 0 0 {name=p3 lab=B}
C {iopin.sym} 430 -380 0 0 {name=p4 lab=VDD}
C {iopin.sym} 430 0 0 0 {name=p5 lab=GND}
C {ipin.sym} 30 -140 0 0 {name=p6 lab=C}
C {IP62LIB/MP.sym} 90 -310 0 0 {name=XM4 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 230 -310 0 0 {name=XM2 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 350 -310 0 0 {name=XM3 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 230 -210 0 0 {name=XM1 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 350 -130 0 0 {name=XM8 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 230 -130 0 0 {name=XM5 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 230 -50 0 0 {name=XM6 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 90 -100 0 0 {name=XM7 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
