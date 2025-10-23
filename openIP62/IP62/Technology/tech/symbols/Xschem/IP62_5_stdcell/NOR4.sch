v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 410 -440 410 -430 {
lab=VDD}
N 410 -440 470 -440 {
lab=VDD}
N 410 -370 410 -350 {
lab=#net1}
N 410 -290 410 -270 {
lab=#net2}
N 160 -60 170 -60 {
lab=B}
N 160 -400 160 -60 {
lab=B}
N 210 -30 210 0 {
lab=GND}
N 210 0 480 0 {
lab=GND}
N 210 -60 230 -60 {
lab=GND}
N 230 -60 230 -20 {
lab=GND}
N 210 -20 230 -20 {
lab=GND}
N 310 -60 330 -60 {
lab=GND}
N 330 -60 330 -20 {
lab=GND}
N 310 -20 330 -20 {
lab=GND}
N 310 -30 310 0 {
lab=GND}
N 310 -110 310 -90 {
lab=Y}
N 410 -30 410 0 {
lab=GND}
N 410 -20 430 -20 {
lab=GND}
N 210 -110 210 -100 {
lab=Y}
N 210 -110 410 -110 {
lab=Y}
N 410 -110 480 -110 {
lab=Y}
N 30 -320 370 -320 {
lab=A}
N 30 -240 370 -240 {
lab=C}
N 260 -60 270 -60 {
lab=C}
N 260 -240 260 -60 {
lab=C}
N 360 -320 360 -70 {
lab=A}
N 410 -320 450 -320 {
lab=VDD}
N 450 -440 450 -320 {
lab=VDD}
N 410 -400 450 -400 {
lab=VDD}
N 410 -240 450 -240 {
lab=VDD}
N 450 -320 450 -240 {
lab=VDD}
N 360 -70 360 -60 {
lab=A}
N 360 -60 370 -60 {
lab=A}
N 410 -110 410 -90 {
lab=Y}
N 430 -60 430 -20 {
lab=GND}
N 410 -60 430 -60 {
lab=GND}
N 210 -100 210 -90 {
lab=Y}
N 410 -210 410 -190 {
lab=#net3}
N 410 -130 410 -110 {
lab=Y}
N 30 -160 370 -160 {
lab=D}
N 110 -110 110 -90 {
lab=Y}
N 110 -110 210 -110 {
lab=Y}
N 60 -60 70 -60 {
lab=D}
N 60 -160 60 -60 {
lab=D}
N 110 -30 110 0 {
lab=GND}
N 110 0 210 0 {
lab=GND}
N 160 -400 370 -400 {
lab=B}
N 30 -280 160 -280 {
lab=B}
N 450 -240 450 -160 {
lab=VDD}
N 410 -160 450 -160 {
lab=VDD}
N 110 -60 130 -60 {
lab=GND}
N 130 -60 130 -0 {
lab=GND}
C {ipin.sym} 30 -320 0 0 {name=p1 lab=A}
C {ipin.sym} 30 -280 0 0 {name=p2 lab=B
}
C {opin.sym} 480 -110 0 0 {name=p3 lab=Y}
C {iopin.sym} 470 -440 0 0 {name=p4 lab=VDD}
C {iopin.sym} 480 0 0 0 {name=p5 lab=GND
}
C {ipin.sym} 30 -240 0 0 {name=p6 lab=C
}
C {ipin.sym} 30 -160 0 0 {name=p7 lab=D}
C {IP62LIB/MP.sym} 370 -400 0 0 {name=XM8 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 370 -320 0 0 {name=XM2 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 370 -240 0 0 {name=XM3 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 370 -160 0 0 {name=XM6 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 70 -60 0 0 {name=XM9 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 170 -60 0 0 {name=XM1 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 270 -60 0 0 {name=XM4 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 370 -60 0 0 {name=XM5 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
