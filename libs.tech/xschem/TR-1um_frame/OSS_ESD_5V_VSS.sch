v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 480 -360 480 -340 {lab=PAD}
N 440 -440 440 -410 {lab=VDD}
N 440 -460 480 -460 {lab=VDD}
N 440 -310 440 -280 {lab=PAD}
N 440 -260 480 -260 {lab=PAD}
N 480 -360 560 -360 {lab=PAD}
N 480 -310 540 -310 {lab=PAD}
N 480 -410 540 -410 {lab=VDD}
N 480 -380 480 -360 {lab=PAD}
N 480 -460 540 -460 {lab=VDD}
N 540 -440 540 -410 {lab=VDD}
N 480 -280 480 -260 {lab=PAD}
N 480 -260 540 -260 {lab=PAD}
N 540 -310 540 -260 {lab=PAD}
N 440 -280 440 -260 {lab=PAD}
N 440 -460 440 -440 {lab=VDD}
N 540 -460 540 -440 {lab=VDD}
N 480 -460 480 -440 {lab=VDD}
N 540 -360 540 -310 {lab=PAD}
C {devices/title.sym} 160 0 0 0 {author=jun1okamura}
C {devices/iopin.sym} 560 -360 0 0 {lab=VSS}
C {MPE.sym} 440 -410 0 0 {name=XM1
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
C {MNE.sym} 440 -310 0 0 {name=XM2
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
C {devices/iopin.sym} 540 -460 0 0 {lab=VDD}
