v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {MPEDI_3_08_00} -120 -280 0 0 1 1 {}
N 0 -200 0 -160 {
lab=S}
N -130 -200 0 -200 {
lab=S}
N 0 160 -0 200 {
lab=D}
N -130 200 -0 200 {
lab=D}
N -0 -80 0 -40 {
lab=#net1}
N 0 40 0 80 {
lab=#net2}
C {iopin.sym} -130 -200 0 1 {name=p1 lab=S}
C {iopin.sym} -130 200 0 1 {name=p2 lab=D}
C {IP62_2_ESD/MPEDI_08_00.sym} -40 130 0 0 {name=x1}
C {IP62_2_ESD/MPEDI_08_00.sym} -40 10 0 0 {name=x2}
C {IP62_2_ESD/MPEDI_08_00.sym} -40 -110 0 0 {name=x3}
