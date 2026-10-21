v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 520 -360 560 -360 {lab=VDD}
N 650 -310 650 -260 {lab=VSS}
N 650 -260 690 -260 {lab=VSS}
N 690 -310 750 -310 {lab=VSS}
N 560 -310 620 -310 {lab=VDD}
N 560 -280 560 -260 {lab=VSS}
N 560 -360 620 -360 {lab=VDD}
N 690 -280 690 -260 {lab=VSS}
N 690 -260 750 -260 {lab=VSS}
N 750 -310 750 -260 {lab=VSS}
N 520 -360 520 -310 {lab=VDD}
N 620 -360 620 -310 {lab=VDD}
N 560 -360 560 -340 {lab=VDD}
N 560 -260 650 -260 {lab=VSS}
N 750 -260 780 -260 {lab=VSS}
N 690 -360 780 -360 {lab=VDD}
N 690 -360 690 -340 {lab=VDD}
N 620 -360 690 -360 {lab=VDD}
N 490 -310 520 -310 {lab=VDD}
C {devices/title.sym} 160 0 0 0 {author=jun1okamura}
C {devices/iopin.sym} 780 -260 0 0 {lab=VSS}
C {MPE.sym} 520 -310 0 0 {name=XM5
model=MPE
w=500u
l=2u
m=1
spiceprefix=X
as=0
ad=0
ps=0
pd=0
nrd=0
nrs=0}
C {MNE.sym} 650 -310 0 0 {name=XM6
model=MNE
w=500u
l=2u
m=1
spiceprefix=X
as=0
ad=0
ps=0
pd=0
nrd=0
nrs=0}
C {devices/iopin.sym} 780 -360 0 0 {lab=VDD}
C {devices/iopin.sym} 490 -310 0 1 {lab=VDD}
