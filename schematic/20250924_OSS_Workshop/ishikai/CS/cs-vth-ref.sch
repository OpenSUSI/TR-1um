v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 100 -50 220 -50 {
lab=VSS}
N 160 -50 160 -30 {
lab=VSS}
N 160 -460 160 -440 {
lab=VDD}
N 90 -180 100 -180 {
lab=VSS}
N 90 -180 90 -140 {
lab=VSS}
N 220 -230 230 -230 {
lab=VSS}
N 100 -360 100 -340 {
lab=#net1}
N 220 -70 220 -50 {
lab=VSS}
N 100 -440 100 -420 {
lab=VDD}
N 100 -440 220 -440 {
lab=VDD}
N 220 -440 220 -420 {
lab=VDD}
N 90 -390 100 -390 {
lab=VDD}
N 90 -430 90 -390 {
lab=VDD}
N 90 -430 100 -430 {
lab=VDD}
N 220 -390 230 -390 {
lab=VDD}
N 230 -430 230 -390 {
lab=VDD}
N 220 -430 230 -430 {
lab=VDD}
N 140 -390 180 -390 {
lab=vb}
N 220 -360 220 -340 {
lab=vb}
N 170 -350 220 -350 {
lab=vb}
N 170 -390 170 -350 {
lab=vb}
N 100 -150 100 -50 {
lab=VSS}
N 90 -140 100 -140 {
lab=VSS}
N 220 -200 220 -130 {
lab=vout}
N 100 -230 180 -230 {
lab=#net1}
N 140 -180 220 -180 {
lab=vout}
N 220 -280 220 -260 {
lab=vb}
N 100 -280 100 -210 {
lab=#net1}
N 220 -50 230 -50 {
lab=VSS}
N 230 -230 260 -230 {lab=VSS}
N 260 -230 260 -50 {lab=VSS}
N 230 -50 260 -50 {lab=VSS}
N 220 -130 330 -130 {lab=vout}
N 330 -300 330 -130 {lab=vout}
N 330 -300 450 -300 {lab=vout}
N 450 -300 450 -290 {lab=vout}
N 450 -230 450 -190 {lab=#net2}
N 450 -130 450 -100 {lab=#net3}
N 580 -230 580 -190 {lab=#net4}
N 580 -130 580 -100 {lab=#net5}
N 710 -230 710 -190 {lab=#net6}
N 710 -130 710 -100 {lab=#net7}
N 450 -40 450 -20 {lab=#net8}
N 450 -20 510 -20 {lab=#net8}
N 510 -300 510 -20 {lab=#net8}
N 510 -300 580 -300 {lab=#net8}
N 580 -300 580 -290 {lab=#net8}
N 580 -40 580 -20 {lab=#net9}
N 580 -20 640 -20 {lab=#net9}
N 640 -300 640 -20 {lab=#net9}
N 640 -300 710 -300 {lab=#net9}
N 710 -300 710 -290 {lab=#net9}
N 710 -40 710 -10 {lab=VSS}
N 330 -10 710 -10 {lab=VSS}
N 330 -70 330 -10 {lab=VSS}
N 220 -70 330 -70 {lab=VSS}
N 220 -350 880 -350 {lab=vb}
N 880 -390 880 -350 {lab=vb}
N 220 -440 920 -440 {lab=VDD}
N 920 -440 920 -420 {lab=VDD}
N 920 -390 940 -390 {lab=VDD}
N 940 -430 940 -390 {lab=VDD}
N 920 -430 940 -430 {lab=VDD}
N 920 -360 920 -200 {lab=#net10}
N 710 -10 1040 -10 {lab=VSS}
N 1040 -140 1040 -10 {lab=VSS}
N 920 -140 920 -10 {lab=VSS}
N 960 -170 1000 -170 {lab=#net10}
N 900 -170 920 -170 {lab=VSS}
N 900 -170 900 -120 {lab=VSS}
N 900 -120 920 -120 {lab=VSS}
N 1040 -170 1060 -170 {lab=VSS}
N 1060 -170 1060 -120 {lab=VSS}
N 1040 -120 1060 -120 {lab=VSS}
N 920 -240 980 -240 {lab=#net10}
N 980 -240 980 -170 {lab=#net10}
N 1040 -300 1040 -200 {lab=ib}
N 100 -340 100 -280 {lab=#net1}
N 220 -340 220 -280 {lab=vb}
N 170 -180 170 -150 {lab=vout}
C {IP62LIB/MN.sym} 140 -180 0 1 {name=XM1 model=NMOS w=50u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 180 -230 0 0 {name=XM2 model=NMOS w=50u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 140 -390 0 1 {name=XM3 model=PMOS w=150u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 180 -390 0 0 {name=XM4 model=PMOS w=150u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/RS.sym} 450 -290 0 0 {name=R2
w=4e-6
R=3000
l=100e-6
model=F_RS
spiceprefix=X
tc1=0
tc2=0}
C {IP62LIB/RS.sym} 450 -190 0 0 {name=R1
w=4e-6
R=3000
l=100e-6
model=F_RS
spiceprefix=X
tc1=0
tc2=0}
C {IP62LIB/RS.sym} 450 -100 0 0 {name=R3
w=4e-6
R=3000
l=100e-6
model=F_RS
spiceprefix=X
tc1=0
tc2=0}
C {IP62LIB/RS.sym} 580 -290 0 0 {name=R4
w=4e-6
R=3000
l=100e-6
model=F_RS
spiceprefix=X
tc1=0
tc2=0}
C {IP62LIB/RS.sym} 580 -190 0 0 {name=R5
w=4e-6
R=3000
l=100e-6
model=F_RS
spiceprefix=X
tc1=0
tc2=0}
C {IP62LIB/RS.sym} 580 -100 0 0 {name=R6
w=4e-6
R=3000
l=100e-6
model=F_RS
spiceprefix=X
tc1=0
tc2=0}
C {IP62LIB/RS.sym} 710 -290 0 0 {name=R7
w=4e-6
R=3000
l=100e-6
model=F_RS
spiceprefix=X
tc1=0
tc2=0}
C {IP62LIB/RS.sym} 710 -190 0 0 {name=R8
w=4e-6
R=3000
l=100e-6
model=F_RS
spiceprefix=X
tc1=0
tc2=0}
C {IP62LIB/RS.sym} 710 -100 0 0 {name=R9
w=4e-6
R=3000
l=100e-6
model=F_RS
spiceprefix=X
tc1=0
tc2=0}
C {IP62LIB/MP.sym} 880 -390 0 0 {name=XM5 model=PMOS w=30u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 960 -170 0 1 {name=XM6 model=NMOS w=10u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 1000 -170 0 0 {name=XM7 model=NMOS w=10u l=1u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/iopin.sym} 160 -30 0 0 {name=p1 lab=VSS}
C {devices/iopin.sym} 160 -460 0 0 {name=p2 lab=VDD}
C {devices/opin.sym} 1040 -300 0 0 {name=p3 lab=ib}
C {devices/opin.sym} 170 -350 0 1 {name=p4 lab=vb}
C {devices/opin.sym} 170 -150 0 1 {name=p5 lab=vout}
