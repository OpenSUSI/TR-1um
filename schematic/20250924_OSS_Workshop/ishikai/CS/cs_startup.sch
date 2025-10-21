v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 190 -60 190 -10 {
lab=VSS}
N 190 -240 190 -120 {
lab=#net1}
N 230 -270 260 -270 {
lab=vin}
N 260 -270 260 -90 {
lab=vin}
N 230 -90 260 -90 {
lab=vin}
N 190 -400 190 -300 {
lab=VDD}
N 170 -270 190 -270 {
lab=VDD}
N 170 -330 170 -270 {
lab=VDD}
N 170 -330 190 -330 {
lab=VDD}
N 170 -90 190 -90 {
lab=VSS}
N 170 -90 170 -40 {
lab=VSS}
N 170 -40 190 -40 {
lab=VSS}
N 100 -170 190 -170 {
lab=#net1}
N 60 -10 190 -10 {
lab=VSS}
N 40 -170 60 -170 {
lab=VSS}
N 40 -170 40 -110 {
lab=VSS}
N 40 -110 60 -110 {
lab=VSS}
N 260 -170 380 -170 {
lab=vin}
N 60 -140 60 -110 {
lab=VSS}
N 60 -110 60 -90 {
lab=VSS}
N 60 -30 60 -10 {
lab=VSS}
N 60 -310 60 -200 {
lab=vb}
N 60 -90 60 -30 {
lab=VSS}
N 130 -10 130 20 {lab=VSS}
C {IP62LIB/MP.sym} 230 -270 0 1 {name=XM1 model=PMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 230 -90 0 1 {name=XM2 model=NMOS w=1000u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 100 -170 0 1 {name=XM3 model=NMOS w=50u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/iopin.sym} 190 -400 0 0 {name=p1 lab=VDD}
C {devices/iopin.sym} 130 20 0 0 {name=p3 lab=VSS}
C {devices/ipin.sym} 380 -170 0 1 {name=p4 lab=vin}
C {devices/ipin.sym} 60 -310 0 0 {name=p2 lab=vb}
