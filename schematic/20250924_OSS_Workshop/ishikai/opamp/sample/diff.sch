v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 420 -210 420 -150 {
lab=out}
N 220 -210 220 -150 {
lab=#net1}
N 260 -120 380 -120 {
lab=#net1}
N 220 -90 220 -60 {
lab=vss}
N 220 -60 420 -60 {
lab=vss}
N 420 -90 420 -60 {
lab=vss}
N 220 -180 320 -180 {
lab=#net1}
N 320 -180 320 -120 {
lab=#net1}
N 220 -290 420 -290 {
lab=#net2}
N 420 -290 420 -270 {
lab=#net2}
N 320 -320 320 -290 {
lab=#net2}
N 320 -60 320 -30 {
lab=vss}
N 320 -400 320 -380 {
lab=vdd}
N 250 -350 280 -350 {
lab=vb}
N 420 -180 460 -180 {
lab=out}
N 220 -290 220 -270 {
lab=#net2}
N 320 -350 340 -350 {
lab=vdd}
N 340 -390 340 -350 {
lab=vdd}
N 320 -390 340 -390 {
lab=vdd}
N 210 -120 220 -120 {
lab=vss}
N 210 -120 210 -80 {
lab=vss}
N 210 -80 220 -80 {
lab=vss}
N 420 -120 430 -120 {
lab=vss}
N 430 -120 430 -80 {
lab=vss}
N 420 -80 430 -80 {
lab=vss}
N 220 -240 230 -240 {
lab=#net2}
N 230 -280 230 -240 {
lab=#net2}
N 220 -280 230 -280 {
lab=#net2}
N 410 -240 420 -240 {
lab=#net2}
N 410 -280 410 -240 {
lab=#net2}
N 410 -280 420 -280 {
lab=#net2}
N 150 -240 180 -240 {
lab=vinn}
N 460 -240 500 -240 {
lab=vinp}
N 320 -30 320 -20 {
lab=vss}
N 320 -450 320 -400 {
lab=vdd}
C {devices/ipin.sym} 150 -240 0 0 {name=p9 lab=vinn}
C {devices/ipin.sym} 500 -240 0 1 {name=p5 lab=vinp}
C {devices/ipin.sym} 250 -350 0 0 {name=p2 lab=vb}
C {devices/opin.sym} 460 -180 0 0 {name=p3 lab=out}
C {devices/iopin.sym} 320 -450 0 0 {name=p1 lab=vdd
}
C {devices/iopin.sym} 320 -20 0 0 {name=p4 lab=vss
}
C {IP62LIB/MP.sym} 280 -350 0 0 {name=XM5 model=PMOS w=180u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 180 -240 0 0 {name=XM1 model=PMOS w=360u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 460 -240 0 1 {name=XM2 model=PMOS w=360u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 260 -120 0 1 {name=XM3 model=NMOS w=30u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 380 -120 0 0 {name=XM4 model=NMOS w=30u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
