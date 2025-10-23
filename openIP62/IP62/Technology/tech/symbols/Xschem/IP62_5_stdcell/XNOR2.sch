v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 50 -420 90 -420 {
lab=B}
N 370 -290 520 -290 {
lab=#net1}
N 560 -390 560 -350 {
lab=Y}
N 790 -330 790 -290 {
lab=Y}
N 560 -260 560 -170 {
lab=#net2}
N 790 -190 790 -150 {
lab=#net2}
N 660 -290 900 -290 {
lab=Y}
N 130 -520 130 -450 {
lab=VDD}
N 130 -520 440 -520 {
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
N 300 -40 560 -40 {
lab=GND}
N 560 -110 560 -40 {
lab=GND}
N 560 -40 790 -40 {
lab=GND}
N 790 -90 790 -40 {
lab=GND}
N 210 -420 250 -420 {
lab=A}
N 50 -140 90 -140 {
lab=A}
N 50 -240 90 -240 {
lab=B}
N 710 -460 750 -460 {
lab=B}
N 710 -360 750 -360 {
lab=A}
N 710 -120 750 -120 {
lab=A}
N 480 -140 520 -140 {
lab=B}
N 130 -420 180 -420 {
lab=VDD}
N 180 -470 180 -420 {
lab=VDD}
N 130 -470 180 -470 {
lab=VDD}
N 130 -140 180 -140 {
lab=GND}
N 180 -140 180 -70 {
lab=GND}
N 130 -70 180 -70 {
lab=GND}
N 790 -360 820 -360 {
lab=VDD}
N 560 -420 590 -420 {
lab=VDD}
N 590 -480 590 -420 {
lab=VDD}
N 560 -480 590 -480 {
lab=VDD}
N 560 -140 600 -140 {
lab=GND}
N 600 -140 600 -80 {
lab=GND}
N 600 -80 600 -70 {
lab=GND}
N 560 -70 600 -70 {
lab=GND}
N 790 -60 840 -60 {
lab=GND}
N 790 -120 840 -120 {
lab=GND}
N 130 -210 130 -170 {
lab=#net3}
N 130 -390 130 -270 {
lab=#net1}
N 130 -290 370 -290 {
lab=#net1}
N 290 -390 290 -290 {
lab=#net1}
N 290 -520 290 -450 {
lab=VDD}
N 290 -420 330 -420 {
lab=VDD}
N 330 -470 330 -420 {
lab=VDD}
N 290 -470 330 -470 {
lab=VDD}
N 470 -420 470 -290 {
lab=#net1}
N 470 -420 520 -420 {
lab=#net1}
N 840 -120 840 -60 {
lab=GND}
N 560 -190 790 -190 {
lab=#net2}
N 560 -350 560 -320 {
lab=Y}
N 560 -520 790 -520 {
lab=VDD}
N 790 -520 790 -490 {
lab=VDD}
N 790 -430 790 -390 {
lab=#net4}
N 790 -460 820 -460 {
lab=VDD}
N 820 -460 820 -360 {
lab=VDD}
N 820 -510 820 -460 {
lab=VDD}
N 790 -510 820 -510 {
lab=VDD}
N 660 -330 660 -290 {
lab=Y}
N 560 -330 660 -330 {
lab=Y}
N 560 -290 600 -290 {
lab=GND}
N 600 -290 600 -140 {
lab=GND}
N 130 -240 180 -240 {
lab=GND}
N 180 -240 180 -140 {
lab=GND}
C {lab_wire.sym} 80 -420 0 0 {name=p2 sig_type=std_logic lab=B
}
C {lab_wire.sym} 240 -420 0 0 {name=p3 sig_type=std_logic lab=A}
C {lab_wire.sym} 730 -360 0 0 {name=p5 sig_type=std_logic lab=A}
C {lab_wire.sym} 730 -120 0 0 {name=p6 sig_type=std_logic lab=A}
C {lab_wire.sym} 730 -460 0 0 {name=p8 sig_type=std_logic lab=B
}
C {lab_wire.sym} 500 -140 0 0 {name=p9 sig_type=std_logic lab=B
}
C {iopin.sym} 50 -520 2 0 {name=p10 lab=VDD}
C {iopin.sym} 50 -40 2 0 {name=p11 lab=GND}
C {ipin.sym} 50 -140 0 0 {name=p12 lab=A}
C {ipin.sym} 50 -240 0 0 {name=p13 lab=B}
C {opin.sym} 900 -290 0 0 {name=p14 lab=Y}
C {IP62LIB/MP.sym} 90 -420 0 0 {name=XM10 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 250 -420 0 0 {name=XM1 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 520 -420 0 0 {name=XM2 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 750 -460 0 0 {name=XM3 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 750 -360 0 0 {name=XM4 model=PMOS w=10.2u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 90 -240 0 0 {name=XM11 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 90 -140 0 0 {name=XM5 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 520 -290 0 0 {name=XM6 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 520 -140 0 0 {name=XM7 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 750 -120 0 0 {name=XM8 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
