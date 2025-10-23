v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 410 -210 430 -210 {
lab=VDD}
N 410 -160 430 -160 {
lab=VDD}
N 310 -160 330 -160 {
lab=VDD}
N 410 -60 430 -60 {
lab=GND}
N 430 -60 430 -10 {
lab=GND}
N 410 -10 430 -10 {
lab=GND}
N 310 -60 330 -60 {
lab=GND}
N 330 -60 330 -10 {
lab=GND}
N 310 -10 330 -10 {
lab=GND}
N 360 -60 370 -60 {
lab=#net1}
N 260 -60 270 -60 {
lab=#net2}
N 310 -130 310 -90 {
lab=#net1}
N 260 -160 270 -160 {
lab=#net2}
N 260 -160 260 -60 {
lab=#net2}
N 310 -210 330 -210 {
lab=VDD}
N 310 -30 310 0 {
lab=GND}
N 410 -30 410 0 {
lab=GND}
N 360 -160 370 -160 {
lab=#net1}
N 360 -160 360 -60 {
lab=#net1}
N 430 -210 430 -160 {
lab=VDD}
N 330 -210 330 -160 {
lab=VDD}
N 310 -220 310 -190 {
lab=VDD}
N 410 -220 410 -190 {
lab=VDD}
N 410 -110 460 -110 {
lab=#net3}
N 410 -130 410 -90 {
lab=#net3}
N 210 -130 210 -90 {
lab=#net2}
N 210 -220 330 -220 {
lab=VDD}
N 210 -220 210 -190 {
lab=VDD}
N 210 -160 230 -160 {
lab=VDD}
N 230 -210 230 -160 {
lab=VDD}
N 210 -210 230 -210 {
lab=VDD}
N 210 0 330 0 {
lab=GND}
N 210 -30 210 0 {
lab=GND}
N 210 -60 230 -60 {
lab=GND}
N 230 -60 230 -10 {
lab=GND}
N 210 -10 230 -10 {
lab=GND}
N 160 -160 170 -160 {
lab=#net4}
N 160 -160 160 -60 {
lab=#net4}
N 160 -60 170 -60 {
lab=#net4}
N 110 -110 160 -110 {
lab=#net4}
N 110 -130 110 -90 {
lab=#net4}
N 110 -220 210 -220 {
lab=VDD}
N 110 -220 110 -190 {
lab=VDD}
N 110 -160 130 -160 {
lab=VDD}
N 130 -210 130 -160 {
lab=VDD}
N 110 -210 130 -210 {
lab=VDD}
N 110 0 210 0 {
lab=GND}
N 110 -30 110 0 {
lab=GND}
N 110 -60 130 -60 {
lab=GND}
N 130 -60 130 -10 {
lab=GND}
N 110 -10 130 -10 {
lab=GND}
N 60 -160 70 -160 {
lab=A}
N 60 -160 60 -60 {
lab=A}
N 60 -60 70 -60 {
lab=A}
N 30 -110 60 -110 {
lab=A}
N 460 -60 470 -60 {
lab=#net3}
N 460 -160 470 -160 {
lab=#net3}
N 460 -160 460 -60 {
lab=#net3}
N 510 -210 530 -210 {
lab=VDD}
N 510 -160 530 -160 {
lab=VDD}
N 510 -60 530 -60 {
lab=GND}
N 530 -60 530 -10 {
lab=GND}
N 510 -10 530 -10 {
lab=GND}
N 510 -30 510 0 {
lab=GND}
N 530 -210 530 -160 {
lab=VDD}
N 510 -220 510 -190 {
lab=VDD}
N 510 -130 510 -90 {
lab=#net5}
N 510 -110 560 -110 {
lab=#net5}
N 560 -60 570 -60 {
lab=#net5}
N 560 -160 570 -160 {
lab=#net5}
N 560 -160 560 -60 {
lab=#net5}
N 610 -210 630 -210 {
lab=VDD}
N 610 -160 630 -160 {
lab=VDD}
N 610 -60 630 -60 {
lab=GND}
N 630 -60 630 -10 {
lab=GND}
N 610 -10 630 -10 {
lab=GND}
N 610 -30 610 0 {
lab=GND}
N 630 -210 630 -160 {
lab=VDD}
N 610 -220 610 -190 {
lab=VDD}
N 610 -130 610 -90 {
lab=Y}
N 460 -220 670 -220 {
lab=VDD}
N 460 0 680 0 {
lab=GND}
N 610 -110 660 -110 {
lab=Y}
N 210 -110 260 -110 {
lab=#net2}
N 310 -110 360 -110 {
lab=#net1}
N 330 -220 450 -220 {
lab=VDD}
N 450 -220 460 -220 {
lab=VDD}
N 330 0 460 0 {
lab=GND}
C {ipin.sym} 30 -110 0 0 {name=p1 lab=A}
C {opin.sym} 660 -110 0 0 {name=p2 lab=Y}
C {iopin.sym} 670 -220 0 0 {name=p3 lab=VDD}
C {iopin.sym} 680 0 0 0 {name=p5 lab=GND}
C {IP62LIB/MP.sym} 570 -160 0 0 {name=XM13 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 70 -160 0 0 {name=XM2 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 170 -160 0 0 {name=XM4 model=PMOS w=10.2u l=4u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 470 -160 0 0 {name=XM6 model=PMOS w=10.2u l=4u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 270 -160 0 0 {name=XM8 model=PMOS w=10.2u l=8u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 370 -160 0 0 {name=XM10 model=PMOS w=10.2u l=6u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 70 -60 0 0 {name=XM12 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 570 -60 0 0 {name=XM5 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 170 -60 0 0 {name=XM1 model=NMOS w=3.4u l=4u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 470 -60 0 0 {name=XM3 model=NMOS w=3.4u l=4u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 270 -60 0 0 {name=XM7 model=NMOS w=3.4u l=8u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 370 -60 0 0 {name=XM9 model=NMOS w=3.4u l=6u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
