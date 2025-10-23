v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 430 -210 450 -210 {
lab=VDD}
N 430 -160 450 -160 {
lab=VDD}
N 330 -160 350 -160 {
lab=VDD}
N 430 -60 450 -60 {
lab=GND}
N 450 -60 450 -10 {
lab=GND}
N 430 -10 450 -10 {
lab=GND}
N 330 -60 350 -60 {
lab=GND}
N 350 -60 350 -10 {
lab=GND}
N 330 -10 350 -10 {
lab=GND}
N 380 -60 390 -60 {
lab=#net1}
N 280 -60 290 -60 {
lab=#net2}
N 260 -110 280 -110 {
lab=#net2}
N 330 -130 330 -90 {
lab=#net1}
N 280 -160 290 -160 {
lab=#net2}
N 280 -160 280 -60 {
lab=#net2}
N 330 -210 350 -210 {
lab=VDD}
N 330 -30 330 0 {
lab=GND}
N 430 -30 430 0 {
lab=GND}
N 380 -160 390 -160 {
lab=#net1}
N 380 -160 380 -60 {
lab=#net1}
N 450 -210 450 -160 {
lab=VDD}
N 350 -210 350 -160 {
lab=VDD}
N 330 -220 330 -190 {
lab=VDD}
N 430 -220 430 -190 {
lab=VDD}
N 430 -110 480 -110 {
lab=Y}
N 330 -110 380 -110 {
lab=#net1}
N 330 -220 480 -220 {
lab=VDD}
N 430 -130 430 -90 {
lab=Y}
N 330 0 480 0 {
lab=GND}
N 210 -130 210 -90 {
lab=#net2}
N 210 -110 260 -110 {
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
lab=#net3}
N 160 -160 160 -60 {
lab=#net3}
N 160 -60 170 -60 {
lab=#net3}
N 110 -110 160 -110 {
lab=#net3}
N 110 -130 110 -90 {
lab=#net3}
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
C {ipin.sym} 30 -110 0 0 {name=p1 lab=A}
C {opin.sym} 480 -110 0 0 {name=p2 lab=Y}
C {iopin.sym} 480 -220 0 0 {name=p3 lab=VDD}
C {iopin.sym} 480 0 0 0 {name=p5 lab=GND}
C {IP62LIB/MP.sym} 70 -160 0 0 {name=XM9 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 390 -160 0 0 {name=XM2 model=PMOS w=10.2u l=1u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 70 -60 0 0 {name=XM8 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 390 -60 0 0 {name=XM1 model=NMOS w=3.4u l=1u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 170 -160 0 0 {name=XM4 model=PMOS w=10.2u l=2u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 290 -160 0 0 {name=XM6 model=PMOS w=10.2u l=2u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 170 -60 0 0 {name=XM7 model=NMOS w=3.4u l=2u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 290 -60 0 0 {name=XM3 model=NMOS w=3.4u l=2u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
