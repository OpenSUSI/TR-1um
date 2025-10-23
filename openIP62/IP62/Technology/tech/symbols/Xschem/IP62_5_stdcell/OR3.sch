v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 210 -470 460 -470 {
lab=VDD}
N 210 -470 210 -460 {
lab=VDD}
N 90 -430 170 -430 {
lab=B}
N 90 -430 90 -270 {
lab=B}
N 50 -350 170 -350 {
lab=A}
N 210 -400 210 -380 {
lab=#net1}
N 30 -350 50 -350 {
lab=A}
N 290 -470 290 -290 {
lab=VDD}
N 210 -350 290 -350 {
lab=VDD}
N 210 -430 290 -430 {
lab=VDD}
N 210 -320 210 -310 {
lab=#net2}
N 210 -310 210 -300 {
lab=#net2}
N 210 -270 290 -270 {
lab=VDD}
N 290 -290 290 -270 {
lab=VDD}
N 210 -240 210 -220 {
lab=#net3}
N 160 -270 170 -270 {
lab=C}
N 160 -270 160 -190 {
lab=C}
N 160 -190 170 -190 {
lab=C}
N 30 -230 160 -230 {
lab=C}
N 400 -240 400 -220 {
lab=Y}
N 350 -270 360 -270 {
lab=#net3}
N 350 -270 350 -190 {
lab=#net3}
N 350 -190 360 -190 {
lab=#net3}
N 390 -270 420 -270 {
lab=VDD}
N 420 -320 420 -270 {
lab=VDD}
N 400 -320 420 -320 {
lab=VDD}
N 210 -230 260 -230 {
lab=#net3}
N 210 -160 210 0 {
lab=GND}
N 210 0 500 0 {
lab=GND}
N 400 -230 460 -230 {
lab=Y}
N 400 -470 400 -300 {
lab=VDD}
N 400 -160 400 0 {
lab=GND}
N 260 -230 310 -230 {
lab=#net3}
N 210 -190 230 -190 {
lab=GND}
N 230 -190 230 -150 {
lab=GND}
N 210 -150 230 -150 {
lab=GND}
N 310 -230 350 -230 {
lab=#net3}
N 400 -190 420 -190 {
lab=GND}
N 420 -190 420 -150 {
lab=GND}
N 400 -150 420 -150 {
lab=GND}
N 130 -350 130 -330 {
lab=A}
N 130 -330 130 -120 {
lab=A}
N 90 -270 90 -50 {
lab=B}
N 180 0 210 0 {
lab=GND}
N 180 -130 290 -130 {
lab=#net3}
N 290 -230 290 -130 {
lab=#net3}
N 290 -20 290 0 {
lab=GND}
N 90 -50 250 -50 {
lab=B}
N 290 -130 290 -80 {
lab=#net3}
N 130 -120 130 -100 {
lab=A}
N 130 -100 140 -100 {
lab=A}
N 180 -70 180 0 {
lab=GND}
N 180 -100 210 -100 {
lab=GND}
N 30 -300 90 -300 {
lab=B}
N 290 -50 310 -50 {
lab=GND}
N 310 -50 310 0 {
lab=GND}
C {ipin.sym} 30 -350 0 0 {name=p1 lab=A}
C {ipin.sym} 30 -300 0 0 {name=p2 lab=B
}
C {opin.sym} 460 -230 0 0 {name=p3 lab=Y}
C {iopin.sym} 460 -470 0 0 {name=p4 lab=VDD}
C {iopin.sym} 500 0 0 0 {name=p5 lab=GND}
C {ipin.sym} 30 -230 0 0 {name=p6 lab=C}
C {IP62LIB/MP.sym} 170 -430 0 0 {name=XM8 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 170 -350 0 0 {name=XM2 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 170 -270 0 0 {name=XM3 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 360 -270 0 0 {name=XM7 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 360 -190 0 0 {name=XM9 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 170 -190 0 0 {name=XM1 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 140 -100 0 0 {name=XM4 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 250 -50 0 0 {name=XM5 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
