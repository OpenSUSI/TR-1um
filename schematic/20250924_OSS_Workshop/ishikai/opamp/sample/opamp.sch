v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 70 -370 70 -180 {
lab=#net1}
N 350 -130 400 -130 {
lab=#net2}
N 360 -290 360 -130 {
lab=#net2}
N 420 -290 440 -290 {
lab=#net3}
N 500 -290 510 -290 {
lab=out}
N 510 -290 510 -130 {
lab=out}
N 470 -130 510 -130 {
lab=out}
N 390 -340 390 -330 {
lab=#net1}
N 70 -340 320 -340 {
lab=#net1}
N 70 -450 70 -430 {
lab=vdd}
N 70 -450 360 -450 {
lab=vdd}
N 430 -450 430 -160 {
lab=vdd}
N 290 -450 290 -190 {
lab=vdd}
N 70 -400 80 -400 {
lab=vdd}
N 80 -440 80 -400 {
lab=vdd}
N 70 -440 80 -440 {
lab=vdd}
N 70 -150 90 -150 {
lab=vss}
N 90 -150 90 -20 {
lab=vss}
N 70 -20 90 -20 {
lab=vss}
N 70 -40 70 -20 {
lab=vss}
N 70 -70 80 -70 {
lab=vss}
N 80 -70 80 -20 {
lab=vss}
N 70 -120 70 -100 {
lab=#net4}
N 20 -110 70 -110 {
lab=#net4}
N 20 -110 20 -70 {
lab=#net4}
N 20 -70 30 -70 {
lab=#net4}
N 20 -190 70 -190 {
lab=#net1}
N 20 -190 20 -150 {
lab=#net1}
N 20 -150 30 -150 {
lab=#net1}
N 90 -20 360 -20 {
lab=vss}
N 430 -100 430 -20 {
lab=vss}
N 290 -70 290 -20 {
lab=vss}
N 400 -220 400 -150 {
lab=ib}
N 20 -220 330 -220 {
lab=ib}
N 20 -400 20 -220 {
lab=ib}
N 20 -400 30 -400 {
lab=ib}
N 230 -220 230 -180 {
lab=ib}
N 360 -20 430 -20 {
lab=vss}
N 330 -220 400 -220 {
lab=ib}
N 320 -340 390 -340 {
lab=#net1}
N 360 -450 430 -450 {
lab=vdd}
N 210 -100 230 -100 {
lab=vinn}
N 210 -160 230 -160 {
lab=vinp}
N 0 -400 20 -400 {
lab=ib}
N 510 -130 530 -130 {
lab=out}
N 430 -20 450 -20 {
lab=vss}
N 430 -450 450 -450 {
lab=vdd}
N 390 -290 390 -20 {
lab=vss}
N -50 -400 0 -400 {
lab=ib}
N -90 -450 70 -450 {
lab=vdd}
N -90 -450 -90 -430 {
lab=vdd}
N -90 -370 -90 -310 {
lab=ib}
N -90 -340 -30 -340 {
lab=ib}
N -30 -400 -30 -340 {
lab=ib}
N -100 -400 -90 -400 {
lab=vdd}
N -100 -440 -100 -400 {
lab=vdd}
N -100 -440 -90 -440 {
lab=vdd}
N 470 -270 490 -270 {lab=vss}
N 490 -270 490 -70 {lab=vss}
N 430 -70 490 -70 {lab=vss}
C {diff.sym} 250 -130 0 0 {name=X1}
C {cs.sym} 420 -130 0 0 {name=X2}
C {devices/ipin.sym} 210 -160 0 0 {name=p1 lab=vinp
}
C {devices/ipin.sym} 210 -100 0 0 {name=p2 lab=vinn
}
C {devices/opin.sym} 530 -130 0 0 {name=p4 lab=out}
C {devices/iopin.sym} 450 -450 0 0 {name=p5 lab=vdd}
C {devices/iopin.sym} 450 -20 0 0 {name=p6 lab=vss}
C {devices/iopin.sym} -90 -310 1 0 {name=p3 lab=ib}
C {IP62LIB/MP.sym} 30 -400 0 0 {name=XM9 model=PMOS w=30u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 390 -330 1 0 {name=XM12 model=NMOS w=20u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} -50 -400 0 1 {name=XM1 model=PMOS w=30u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 30 -150 0 0 {name=XM10 model=NMOS w=10u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 30 -70 0 0 {name=XM11 model=NMOS w=10u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/CSIO.sym} 440 -290 3 0 {name=XC1
model=F_CSIO
c=8.856p
x=120u
y=120u
m=1}
