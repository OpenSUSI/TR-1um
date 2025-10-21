v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 190 -220 230 -220 {
lab=Q}
N 230 -220 230 -120 {
lab=Q}
N 190 -120 230 -120 {
lab=Q}
N 120 -90 150 -90 {
lab=A}
N 120 -250 120 -90 {
lab=A}
N 120 -250 150 -250 {
lab=A}
N 50 -170 120 -170 {
lab=A}
N 230 -170 300 -170 {
lab=Q}
N 190 -340 190 -280 {
lab=VDD}
N 190 -60 190 -10 {
lab=VSS}
N 190 -90 200 -90 {
lab=VSS}
N 200 -90 200 -50 {
lab=VSS}
N 190 -50 200 -50 {
lab=VSS}
N 190 -290 200 -290 {
lab=VDD}
N 200 -290 200 -250 {
lab=VDD}
N 190 -250 200 -250 {
lab=VDD}
N 190 -360 190 -340 {lab=VDD}
C {devices/ipin.sym} 50 -170 0 0 {name=p1 lab=A}
C {devices/opin.sym} 300 -170 0 0 {name=p2 lab=Q}
C {devices/iopin.sym} 190 -340 0 1 {name=p3 lab=VDD}
C {devices/iopin.sym} 190 -10 0 0 {name=p4 lab=VSS}
C {IP62LIB/MP.sym} 150 -250 0 0 {name=XM1 model=PMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 150 -90 0 0 {name=XM2 model=NMOS w=3.4u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
