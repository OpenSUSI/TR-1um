v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 50 -420 90 -420 {
lab=A}
N 50 -300 90 -300 {
lab=B}
N 130 -390 130 -330 {
lab=#net1}
N 130 -270 130 -170 {
lab=#net2}
N 130 -220 300 -220 {
lab=#net2}
N 300 -220 300 -170 {
lab=#net2}
N 300 -220 370 -220 {
lab=#net2}
N 370 -290 370 -220 {
lab=#net2}
N 370 -290 520 -290 {
lab=#net2}
N 560 -390 560 -320 {
lab=#net3}
N 560 -390 560 -350 {
lab=#net3}
N 440 -350 560 -350 {
lab=#net3}
N 440 -390 440 -350 {
lab=#net3}
N 560 -260 560 -170 {
lab=Y}
N 790 -190 790 -150 {
lab=#net4}
N 560 -220 660 -220 {
lab=Y}
N 660 -320 660 -220 {
lab=Y}
N 660 -320 900 -320 {
lab=Y}
N 790 -320 790 -250 {
lab=Y}
N 130 -520 130 -450 {
lab=VDD}
N 130 -520 440 -520 {
lab=VDD}
N 440 -520 440 -450 {
lab=VDD}
N 440 -520 440 -450 {
lab=VDD}
N 440 -520 560 -520 {
lab=VDD}
N 560 -520 560 -450 {
lab=VDD}
N 50 -520 130 -520 {
lab=VDD}
N 130 -110 130 -40 {
lab=GND}
N 50 -40 130 -40 {
lab=GND}
N 130 -40 300 -40 {
lab=GND}
N 300 -110 300 -40 {
lab=GND}
N 300 -40 560 -40 {
lab=GND}
N 560 -110 560 -40 {
lab=GND}
N 560 -40 790 -40 {
lab=GND}
N 790 -90 790 -40 {
lab=GND}
N 50 -420 90 -420 {
lab=A}
N 50 -140 90 -140 {
lab=A}
N 220 -140 260 -140 {
lab=B}
N 220 -140 260 -140 {
lab=B}
N 360 -420 400 -420 {
lab=B}
N 480 -420 520 -420 {
lab=A}
N 480 -140 520 -140 {
lab=#net2}
N 710 -220 750 -220 {
lab=A}
N 710 -120 750 -120 {
lab=B}
N 480 -290 480 -140 {
lab=#net2}
N 130 -420 180 -420 {
lab=VDD}
N 180 -470 180 -420 {
lab=VDD}
N 130 -470 180 -470 {
lab=VDD}
N 180 -420 180 -300 {
lab=VDD}
N 130 -300 180 -300 {
lab=VDD}
N 130 -140 180 -140 {
lab=GND}
N 180 -140 180 -70 {
lab=GND}
N 130 -70 180 -70 {
lab=GND}
N 300 -140 340 -140 {
lab=GND}
N 340 -140 350 -140 {
lab=GND}
N 350 -140 350 -70 {
lab=GND}
N 300 -70 350 -70 {
lab=GND}
N 440 -420 470 -420 {
lab=VDD}
N 470 -480 470 -420 {
lab=VDD}
N 440 -480 470 -480 {
lab=VDD}
N 560 -420 590 -420 {
lab=VDD}
N 590 -480 590 -420 {
lab=VDD}
N 560 -480 590 -480 {
lab=VDD}
N 560 -290 590 -290 {
lab=VDD}
N 590 -420 590 -290 {
lab=VDD}
N 560 -140 600 -140 {
lab=GND}
N 600 -140 600 -80 {
lab=GND}
N 600 -80 600 -70 {
lab=GND}
N 560 -70 600 -70 {
lab=GND}
N 790 -220 840 -220 {
lab=GND}
N 840 -220 840 -60 {
lab=GND}
N 790 -60 840 -60 {
lab=GND}
N 790 -120 840 -120 {
lab=GND}
C {lab_wire.sym} 80 -140 0 0 {name=p4 sig_type=std_logic lab=A}
C {lab_wire.sym} 500 -420 0 0 {name=p5 sig_type=std_logic lab=A}
C {lab_wire.sym} 730 -220 0 0 {name=p6 sig_type=std_logic lab=A}
C {lab_wire.sym} 240 -140 0 0 {name=p7 sig_type=std_logic lab=B
}
C {lab_wire.sym} 380 -420 0 0 {name=p8 sig_type=std_logic lab=B
}
C {lab_wire.sym} 730 -120 0 0 {name=p9 sig_type=std_logic lab=B
}
C {iopin.sym} 50 -520 2 0 {name=p10 lab=VDD}
C {iopin.sym} 50 -40 2 0 {name=p11 lab=GND}
C {ipin.sym} 50 -420 0 0 {name=p12 lab=A}
C {ipin.sym} 50 -300 0 0 {name=p13 lab=B}
C {opin.sym} 900 -320 0 0 {name=p14 lab=Y}
C {IP62LIB/MP.sym} 90 -420 0 0 {name=XM10 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 90 -300 0 0 {name=XM1 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 400 -420 0 0 {name=XM8 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 520 -420 0 0 {name=XM2 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 520 -290 0 0 {name=XM9 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 90 -140 0 0 {name=XM3 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 260 -140 0 0 {name=XM4 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 520 -140 0 0 {name=XM5 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 750 -120 0 0 {name=XM7 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 750 -220 0 0 {name=XM6 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
