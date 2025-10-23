v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 400 -420 620 -420 {
lab=VDD}
N 400 -420 400 -410 {
lab=VDD}
N 400 -350 400 -330 {
lab=#net1}
N 460 -420 460 -240 {
lab=VDD}
N 400 -300 460 -300 {
lab=VDD}
N 400 -380 460 -380 {
lab=VDD}
N 400 -270 400 -260 {
lab=#net2}
N 400 -260 400 -250 {
lab=#net2}
N 400 -220 460 -220 {
lab=VDD}
N 460 -240 460 -220 {
lab=VDD}
N 350 -220 360 -220 {
lab=C}
N 560 -150 560 -130 {
lab=Y}
N 580 -220 580 -180 {
lab=VDD}
N 560 -220 580 -220 {
lab=VDD}
N 190 0 620 0 {
lab=GND}
N 560 -140 620 -140 {
lab=Y}
N 560 -100 580 -100 {
lab=GND}
N 580 -100 580 -60 {
lab=GND}
N 560 -60 580 -60 {
lab=GND}
N 160 0 190 0 {
lab=GND}
N 560 -180 580 -180 {
lab=VDD}
N 510 -180 520 -180 {
lab=#net3}
N 510 -180 510 -100 {
lab=#net3}
N 510 -100 520 -100 {
lab=#net3}
N 470 -140 470 -120 {
lab=#net3}
N 470 -60 470 -10 {
lab=GND}
N 470 -10 470 0 {
lab=GND}
N 470 -90 490 -90 {
lab=GND}
N 490 -90 490 -30 {
lab=GND}
N 470 -30 490 -30 {
lab=GND}
N 380 -140 380 -120 {
lab=#net3}
N 290 -140 290 -120 {
lab=#net3}
N 290 -60 290 0 {
lab=GND}
N 290 -90 300 -90 {
lab=GND}
N 300 -90 310 -90 {
lab=GND}
N 310 -90 310 -40 {
lab=GND}
N 290 -40 310 -40 {
lab=GND}
N 200 -140 200 -120 {
lab=#net3}
N 200 -60 200 0 {
lab=GND}
N 200 -90 220 -90 {
lab=GND}
N 220 -90 220 -40 {
lab=GND}
N 200 -40 220 -40 {
lab=GND}
N 30 -220 350 -220 {
lab=C}
N 110 -60 110 0 {
lab=GND}
N 110 0 160 0 {
lab=GND}
N 110 -90 130 -90 {
lab=GND}
N 130 -90 130 -40 {
lab=GND}
N 110 -40 130 -40 {
lab=GND}
N 110 -140 110 -120 {
lab=#net3}
N 110 -140 510 -140 {
lab=#net3}
N 60 -90 70 -90 {
lab=A}
N 380 -60 380 -50 {
lab=#net4}
N 380 -50 400 -50 {
lab=#net4}
N 30 -160 420 -160 {
lab=D}
N 150 -380 150 -90 {
lab=B}
N 150 -90 160 -90 {
lab=B}
N 330 -90 340 -90 {
lab=D}
N 330 -160 330 -90 {
lab=D}
N 240 -90 250 -90 {
lab=C}
N 240 -220 240 -90 {
lab=C}
N 560 -70 560 0 {
lab=GND}
N 560 -420 560 -210 {
lab=VDD}
N 420 -160 420 -90 {
lab=D}
N 420 -90 430 -90 {
lab=D}
N 150 -380 360 -380 {
lab=B}
N 30 -250 150 -250 {
lab=B}
N 60 -300 360 -300 {
lab=A}
N 60 -300 60 -90 {
lab=A}
N 30 -300 60 -300 {
lab=A}
N 410 -170 410 -90 {
lab=VDD}
N 410 -170 460 -170 {
lab=VDD}
N 460 -220 460 -170 {
lab=VDD}
N 380 -90 410 -90 {
lab=VDD}
N 400 -190 400 -50 {
lab=#net4}
C {ipin.sym} 30 -250 0 0 {name=p1 lab=B}
C {ipin.sym} 30 -300 0 0 {name=p2 lab=A}
C {opin.sym} 620 -140 0 0 {name=p3 lab=Y}
C {iopin.sym} 620 -420 0 0 {name=p4 lab=VDD}
C {iopin.sym} 620 0 0 0 {name=p5 lab=GND}
C {ipin.sym} 30 -220 0 0 {name=p6 lab=C}
C {ipin.sym} 30 -160 0 0 {name=p7 lab=D}
C {IP62LIB/MP.sym} 360 -380 0 0 {name=XM10 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 360 -300 0 0 {name=XM2 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 360 -220 0 0 {name=XM3 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 520 -180 0 0 {name=XM7 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 340 -90 0 0 {name=XM9 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 70 -90 0 0 {name=XM11 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 160 -90 0 0 {name=XM1 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 250 -90 0 0 {name=XM4 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 430 -90 0 0 {name=XM5 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 520 -100 0 0 {name=XM6 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
