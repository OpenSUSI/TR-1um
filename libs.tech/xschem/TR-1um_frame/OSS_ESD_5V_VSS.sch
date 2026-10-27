v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 500 -340 540 -340 {lab=VDD}
N 630 -290 630 -240 {lab=VSS}
N 630 -240 670 -240 {lab=VSS}
N 670 -290 730 -290 {lab=VSS}
N 540 -290 600 -290 {lab=VDD}
N 540 -260 540 -240 {lab=VSS}
N 540 -340 600 -340 {lab=VDD}
N 670 -260 670 -240 {lab=VSS}
N 670 -240 730 -240 {lab=VSS}
N 730 -290 730 -240 {lab=VSS}
N 500 -340 500 -290 {lab=VDD}
N 600 -340 600 -290 {lab=VDD}
N 540 -340 540 -320 {lab=VDD}
N 540 -240 630 -240 {lab=VSS}
N 730 -240 760 -240 {lab=VSS}
N 670 -340 760 -340 {lab=VDD}
N 670 -340 670 -320 {lab=VDD}
N 600 -340 670 -340 {lab=VDD}
N 470 -290 470 -240 {lab=VSS}
N 470 -240 540 -240 {lab=VSS}
C {devices/title.sym} 160 0 0 0 {author=jun1okamura}
C {devices/iopin.sym} 760 -240 0 0 {lab=VSS}
C {MPE.sym} 500 -290 0 0 {name=XM3
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
C {MNE.sym} 630 -290 0 0 {name=XM4
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
C {devices/iopin.sym} 760 -340 0 0 {lab=VDD}
C {devices/iopin.sym} 470 -290 0 1 {lab=VSS}
