v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 40 -615 40 -180 {lab=VDD}
N 400 -625 400 -180 {lab=VDD}
N 385 -615 385 -125 {lab=VSS}
N -25 -570 -0 -570 {lab=P1}
N -25 -510 0 -510 {lab=P2}
N -25 -450 0 -450 {lab=P3}
N -25 -390 0 -390 {lab=P4}
N -25 -330 0 -330 {lab=P5}
N -25 -270 0 -270 {lab=P6}
N -25 -210 0 -210 {lab=P7}
N -25 -150 0 -150 {lab=VSS}
N 40 -630 40 -615 {lab=VDD}
N 40 -630 400 -630 {lab=VDD}
N 400 -630 400 -625 {lab=VDD}
N 55 -615 385 -615 {lab=VSS}
N 55 -615 55 -120 {lab=VSS}
N 440 -570 465 -570 {lab=VDD}
N 440 -510 465 -510 {lab=P15}
N 440 -450 465 -450 {lab=P14}
N 440 -390 465 -390 {lab=P13}
N 440 -330 465 -330 {lab=P12}
N 440 -270 465 -270 {lab=P11}
N 440 -210 465 -210 {lab=P10}
N 440 -150 465 -150 {lab=P9}
N 385 -125 385 -120 {lab=VSS}
N 120 -550 140 -550 {lab=OUT1}
N 120 -590 140 -590 {lab=HIZ1}
N 120 -490 140 -490 {lab=OUT2}
N 120 -530 140 -530 {lab=HIZ2}
N 120 -430 140 -430 {lab=OUT3}
N 120 -470 140 -470 {lab=HIZ3}
N 120 -370 140 -370 {lab=OUT4}
N 120 -410 140 -410 {lab=HIZ4}
N 120 -310 140 -310 {lab=OUT5}
N 120 -350 140 -350 {lab=HIZ5}
N 120 -250 140 -250 {lab=OUT6}
N 120 -290 140 -290 {lab=HIZ6}
N 120 -190 140 -190 {lab=OUT7}
N 120 -230 140 -230 {lab=HIZ7}
N 300 -490 320 -490 {lab=OUT15}
N 300 -530 320 -530 {lab=HIZ15}
N 300 -430 320 -430 {lab=OUT14}
N 300 -470 320 -470 {lab=HIZ14}
N 300 -370 320 -370 {lab=OUT13}
N 300 -410 320 -410 {lab=HIZ13}
N 300 -310 320 -310 {lab=OUT12}
N 300 -350 320 -350 {lab=HIZ12}
N 300 -250 320 -250 {lab=OUT11}
N 300 -290 320 -290 {lab=HIZ11}
N 300 -190 320 -190 {lab=OUT10}
N 300 -230 320 -230 {lab=HIZ10}
N 300 -130 320 -130 {lab=OUT9}
N 300 -170 320 -170 {lab=HIZ9}
C {devices/title.sym} -5 0 0 0 {name=l1 author=jun1okamura}
C {OSS_ESD_5V_DIO.sym} 40 -570 0 0 {name=x1}
C {OSS_ESD_5V_VDD.sym} 400 -570 0 1 {name=x2}
C {OSS_ESD_5V_VSS.sym} 40 -150 0 0 {name=x3}
C {OSS_ESD_5V_DIO.sym} 40 -510 0 0 {name=x4
}
C {OSS_ESD_5V_DIO.sym} 40 -450 0 0 {name=x5}
C {OSS_ESD_5V_DIO.sym} 40 -390 0 0 {name=x6}
C {OSS_ESD_5V_DIO.sym} 40 -330 0 0 {name=x7}
C {OSS_ESD_5V_DIO.sym} 40 -270 0 0 {name=x8}
C {OSS_ESD_5V_DIO.sym} 40 -210 0 0 {name=x9}
C {OSS_ESD_5V_DIO.sym} 400 -510 0 1 {name=x10}
C {OSS_ESD_5V_DIO.sym} 400 -450 0 1 {name=x11}
C {OSS_ESD_5V_DIO.sym} 400 -390 0 1 {name=x12}
C {OSS_ESD_5V_DIO.sym} 400 -330 0 1 {name=x13}
C {OSS_ESD_5V_DIO.sym} 400 -270 0 1 {name=x14}
C {OSS_ESD_5V_DIO.sym} 400 -210 0 1 {name=x15}
C {OSS_ESD_5V_DIO.sym} 400 -150 0 1 {name=x16}
C {devices/iopin.sym} -25 -570 2 0 {name=p3 lab=P1
}
C {devices/iopin.sym} -25 -510 2 0 {name=p4 lab=P2
}
C {devices/iopin.sym} -25 -450 2 0 {name=p5 lab=P3
}
C {devices/iopin.sym} -25 -390 2 0 {name=p6 lab=P4
}
C {devices/iopin.sym} -25 -330 2 0 {name=p7 lab=P5}
C {devices/iopin.sym} -25 -270 2 0 {name=p8 lab=P6
}
C {devices/iopin.sym} -25 -210 2 0 {name=p9 lab=P7
}
C {devices/iopin.sym} -25 -150 2 0 {name=p10 lab=VSS
}
C {devices/iopin.sym} 465 -570 2 1 {name=p1 lab=VDD
}
C {devices/iopin.sym} 465 -510 2 1 {name=p2 lab=P15
}
C {devices/iopin.sym} 465 -450 2 1 {name=p11 lab=P14
}
C {devices/iopin.sym} 465 -390 2 1 {name=p12 lab=P13}
C {devices/iopin.sym} 465 -330 2 1 {name=p13 lab=P12}
C {devices/iopin.sym} 465 -270 2 1 {name=p14 lab=P11}
C {devices/iopin.sym} 465 -210 2 1 {name=p15 lab=P10
}
C {devices/iopin.sym} 465 -150 2 1 {name=p16 lab=P9
}
C {devices/ipin.sym} 140 -590 0 1 {name=p17 lab=HIZ1
}
C {devices/ipin.sym} 140 -550 0 1 {name=p18 lab=OUT1}
C {devices/ipin.sym} 140 -530 0 1 {name=p19 lab=HIZ2}
C {devices/ipin.sym} 140 -490 0 1 {name=p20 lab=OUT2}
C {devices/ipin.sym} 140 -470 0 1 {name=p21 lab=HIZ3
}
C {devices/ipin.sym} 140 -430 0 1 {name=p22 lab=OUT3}
C {devices/ipin.sym} 140 -410 0 1 {name=p23 lab=HIZ4
}
C {devices/ipin.sym} 140 -370 0 1 {name=p24 lab=OUT4}
C {devices/ipin.sym} 140 -350 0 1 {name=p25 lab=HIZ5
}
C {devices/ipin.sym} 140 -310 0 1 {name=p26 lab=OUT5}
C {devices/ipin.sym} 140 -290 0 1 {name=p27 lab=HIZ6
}
C {devices/ipin.sym} 140 -250 0 1 {name=p28 lab=OUT6}
C {devices/ipin.sym} 140 -230 0 1 {name=p29 lab=HIZ7}
C {devices/ipin.sym} 140 -190 0 1 {name=p30 lab=OUT7}
C {devices/ipin.sym} 300 -530 0 0 {name=p31 lab=HIZ15
}
C {devices/ipin.sym} 300 -490 0 0 {name=p32 lab=OUT15}
C {devices/ipin.sym} 300 -470 0 0 {name=p33 lab=HIZ14
}
C {devices/ipin.sym} 300 -430 0 0 {name=p34 lab=OUT14}
C {devices/ipin.sym} 300 -410 0 0 {name=p35 lab=HIZ13
}
C {devices/ipin.sym} 300 -370 0 0 {name=p36 lab=OUT13}
C {devices/ipin.sym} 300 -350 0 0 {name=p37 lab=HIZ12
}
C {devices/ipin.sym} 300 -310 0 0 {name=p38 lab=OUT12}
C {devices/ipin.sym} 300 -290 0 0 {name=p39 lab=HIZ11
}
C {devices/ipin.sym} 300 -250 0 0 {name=p40 lab=OUT11}
C {devices/ipin.sym} 300 -230 0 0 {name=p41 lab=HIZ10
}
C {devices/ipin.sym} 300 -190 0 0 {name=p42 lab=OUT10}
C {devices/ipin.sym} 300 -170 0 0 {name=p43 lab=HIZ9}
C {devices/ipin.sym} 300 -130 0 0 {name=p44 lab=OUT9}
