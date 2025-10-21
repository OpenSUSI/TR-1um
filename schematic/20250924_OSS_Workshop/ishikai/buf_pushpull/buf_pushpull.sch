v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -200 -210 -200 -140 {lab=#net1}
N -200 -80 -200 -30 {lab=#net2}
N -160 0 -50 0 {lab=#net3}
N -160 -110 -50 -110 {lab=#net1}
N -10 -80 -10 -30 {lab=out}
N -200 30 -200 100 {lab=#net3}
N -350 130 -240 130 {lab=vin}
N -200 -310 -200 -270 {lab=vdd}
N -200 -310 -10 -310 {lab=vdd}
N -10 -310 -10 -140 {lab=vdd}
N -10 30 -10 200 {lab=vss}
N -200 200 -10 200 {lab=vss}
N -200 160 -200 200 {lab=vss}
N -110 200 -110 240 {lab=vss}
N -100 -340 -100 -310 {lab=vdd}
N -200 130 -180 130 {lab=vss}
N -180 130 -180 200 {lab=vss}
N -10 -110 10 -110 {lab=vss}
N -200 -160 -120 -160 {lab=#net1}
N -120 -160 -120 -110 {lab=#net1}
N -120 0 -120 60 {lab=#net3}
N -200 60 -120 60 {lab=#net3}
N -10 0 30 0 {lab=vdd}
N 30 -310 30 0 {lab=vdd}
N -10 -310 30 -310 {lab=vdd}
N 10 -110 10 200 {lab=vss}
N -10 200 10 200 {lab=vss}
N -270 0 -200 0 {lab=vdd}
N -270 -310 -270 0 {lab=vdd}
N -270 -310 -200 -310 {lab=vdd}
N -250 -110 -200 -110 {lab=vss}
N -250 -110 -250 200 {lab=vss}
N -250 200 -200 200 {lab=vss}
N -10 -50 140 -50 {lab=out}
N -200 -240 -180 -240 {
lab=vdd}
N -180 -310 -180 -240 {
lab=vdd}
N -350 -240 -240 -240 {lab=vbias}
C {devices/opin.sym} 140 -50 0 0 {name=p1 lab=out}
C {devices/ipin.sym} -350 130 0 0 {name=p3 lab=vin}
C {devices/iopin.sym} -110 240 0 0 {name=p4 lab=vss}
C {devices/iopin.sym} -100 -340 0 1 {name=p5 lab=vdd}
C {devices/ipin.sym} -350 -240 0 0 {name=p2 lab=vbias}
C {IP62LIB/MP.sym} -240 -240 0 0 {name=XM1 model=PMOS w=90u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} -160 -110 0 1 {name=XM3 model=NMOS w=30u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} -50 -110 0 0 {name=XM2 model=NMOS w=300u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} -50 0 0 0 {name=XM4 model=PMOS w=900u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} -160 0 0 1 {name=XM5 model=PMOS w=90u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} -240 130 0 0 {name=XM6 model=NMOS w=30u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
