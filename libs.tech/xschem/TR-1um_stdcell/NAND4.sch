v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 100 -310 100 -290 {
lab=Y}
N 200 -290 400 -290 {
lab=Y}
N 200 -310 200 -290 {
lab=Y}
N 400 -170 400 -130 {
lab=#net1}
N 350 -340 360 -340 {
lab=B}
N 350 -200 360 -200 {
lab=B}
N 150 -340 160 -340 {
lab=C}
N 50 -340 60 -340 {
lab=A}
N 100 -390 100 -370 {
lab=VDD}
N 200 -390 470 -390 {
lab=VDD}
N 100 -340 120 -340 {
lab=VDD}
N 120 -390 120 -340 {
lab=VDD}
N 200 -390 200 -370 {
lab=VDD}
N 200 -340 220 -340 {
lab=VDD}
N 220 -390 220 -340 {
lab=VDD}
N 400 -390 400 -370 {
lab=VDD}
N 400 -340 420 -340 {
lab=VDD}
N 420 -390 420 -340 {
lab=VDD}
N 400 -70 400 -50 {
lab=GND}
N 400 -50 490 -50 {
lab=GND}
N 400 -200 430 -200 {
lab=GND}
N 400 -100 430 -100 {
lab=GND}
N 400 -290 460 -290 {
lab=Y}
N 300 -390 300 -370 {
lab=VDD}
N 300 -340 320 -340 {
lab=VDD}
N 320 -390 320 -340 {
lab=VDD}
N 250 -340 260 -340 {
lab=D}
N 250 -340 250 -240 {
lab=D}
N 250 -160 260 -160 {
lab=D}
N 430 -200 430 -50 {
lab=GND}
N 400 -240 400 -230 {
lab=#net2}
N 400 -240 440 -240 {
lab=#net2}
N 440 -240 450 -240 {
lab=#net2}
N 450 -240 450 -20 {
lab=#net2}
N 450 -20 450 0 {
lab=#net2}
N 300 0 450 0 {
lab=#net2}
N 300 -20 300 0 {
lab=#net2}
N 300 -130 300 -80 {
lab=#net3}
N 400 -310 400 -290 {
lab=Y}
N 300 -310 300 -290 {
lab=Y}
N 100 -290 200 -290 {
lab=Y}
N 150 -50 260 -50 {
lab=C}
N 150 -340 150 -150 {
lab=C}
N 50 -100 360 -100 {
lab=A}
N 100 -390 200 -390 {
lab=VDD}
N 30 -260 350 -260 {
lab=B}
N 30 -230 150 -230 {
lab=C}
N 30 -290 50 -290 {
lab=A}
N 30 -200 250 -200 {
lab=D}
N 350 -340 350 -200 {
lab=B}
N 250 -240 250 -160 {
lab=D}
N 150 -150 150 -80 {
lab=C}
N 150 -80 150 -50 {
lab=C}
N 50 -340 50 -100 {
lab=A}
N 300 -290 300 -190 {
lab=Y}
N 300 -160 330 -160 {
lab=GND}
N 330 -160 330 -50 {
lab=GND}
N 330 -50 400 -50 {
lab=GND}
N 300 -50 330 -50 {
lab=GND}
C {devices/ipin.sym} 30 -260 0 0 {name=p1 lab=B}
C {devices/ipin.sym} 30 -290 0 0 {name=p2 lab=A}
C {devices/opin.sym} 460 -290 0 0 {name=p3 lab=Y}
C {devices/iopin.sym} 490 -50 0 0 {name=p4 lab=GND
}
C {devices/iopin.sym} 470 -390 0 0 {name=p5 lab=VDD
}
C {devices/ipin.sym} 30 -200 0 0 {name=p6 lab=D}
C {devices/ipin.sym} 30 -230 0 0 {name=p7 lab=C}
C {MP.sym} 60 -340 0 0 {name=M4 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0 spiceprefix=X}
C {MP.sym} 160 -340 0 0 {name=M6 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0 spiceprefix=X}
C {MP.sym} 260 -340 0 0 {name=M7 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0 spiceprefix=X}
C {MP.sym} 360 -340 0 0 {name=M8 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0 spiceprefix=X}
C {MN.sym} 260 -160 0 0 {name=M1 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0 spiceprefix=X}
C {MN.sym} 360 -200 0 0 {name=M2 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0 spiceprefix=X}
C {MN.sym} 260 -50 0 0 {name=M3 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0 spiceprefix=X}
C {MN.sym} 360 -100 0 0 {name=M5 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0 spiceprefix=X}
