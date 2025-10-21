v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
L 4 -600 20 -600 60 {}
L 4 -600 60 200 60 {}
L 4 200 20 200 60 {}
L 4 240 20 240 60 {}
L 4 240 60 480 60 {}
L 4 480 20 480 60 {}
L 4 -10 200 10 200 {}
L 4 10 200 10 240 {}
L 4 -10 240 10 240 {}
L 4 20 200 20 240 {}
L 4 20 220 20 240 {}
L 4 20 220 30 220 {}
L 4 -10 180 -10 200 {}
L 4 -10 240 -10 260 {}
L 4 150 320 170 320 {}
L 4 170 320 170 360 {}
L 4 150 360 170 360 {}
L 4 180 320 180 360 {}
L 4 180 340 180 360 {}
L 4 180 340 190 340 {}
L 4 150 300 150 320 {}
L 4 150 360 150 380 {}
L 4 150 200 170 200 {}
L 4 170 200 170 240 {}
L 4 150 240 170 240 {}
L 4 180 200 180 240 {}
L 4 180 220 180 240 {}
L 4 180 220 190 220 {}
L 4 150 180 150 200 {}
L 4 150 240 150 260 {}
L 4 150 260 150 300 {}
L 4 150 140 150 160 {}
L 4 150 120 150 160 {}
L 4 130 150 150 160 {}
L 4 150 160 170 150 {}
L 4 -10 120 -10 160 {}
L 4 -30 150 -10 160 {}
L 4 -10 160 10 150 {}
L 4 -30 380 10 380 {}
L 4 -20 400 -10 380 {}
L 4 -40 400 -30 380 {}
L 4 0 400 10 380 {}
L 4 130 380 170 380 {}
L 4 160 400 170 380 {}
L 4 140 400 150 380 {}
L 4 120 400 130 380 {}
L 4 -10 260 -10 380 {}
L 4 -10 190 30 190 {}
L 4 30 220 30 260 {}
L 4 30 260 230 260 {}
L 4 190 220 190 260 {}
L 4 200 190 200 340 {}
L 4 150 190 200 190 {}
L 4 30 190 40 190 {}
L 4 40 190 40 260 {}
L 4 200 340 200 370 {}
L 4 200 370 230 370 {}
L 4 190 340 190 370 {}
L 4 190 370 200 370 {}
L 4 -90 320 -30 260 {}
L 4 -50 260 -30 260 {}
L 4 -50 260 -30 260 {}
L 4 -30 260 -30 280 {}
L 4 780 20 780 60 {}
L 4 780 60 1020 60 {}
L 4 1420 20 1420 60 {}
L 4 1020 60 1420 60 {}
L 4 1640 20 1640 60 {}
L 4 1640 60 1880 60 {}
L 4 1960 20 1960 60 {}
L 4 1880 60 1960 60 {}
L 4 2120 20 2120 60 {}
L 4 2120 60 2360 60 {}
L 4 2600 20 2600 60 {}
L 4 2360 60 2600 60 {}
L 4 2620 20 2620 60 {}
L 4 2740 20 2740 60 {}
L 4 2620 60 2740 60 {}
L 4 2780 20 2780 60 {}
L 4 2840 20 2840 60 {}
L 4 2780 60 2840 60 {}
L 4 -540 -760 -520 -760 {}
L 4 -520 -760 -520 -740 {}
L 4 -560 -720 -520 -760 {}
P 4 1 -740 -1280 {}
T {Cascode Current Mirror (LVCCM)} -600 80 0 0 0.4 0.4 {}
T {Floating Current Mirror} 240 80 0 0 0.4 0.4 {}
T {Typical Cascode Opamp

Process: IP62 (Tokai Rika)
 Author: Mizuki Mori (github: 3zki)} -600 120 0 0 0.4 0.4 {}
T {W2} 110 200 0 0 0.4 0.4 {}
T {W2} 110 320 0 0 0.4 0.4 {}
T {W1} -50 200 0 0 0.4 0.4 {}
T {Equivalent ratio
W1:W2
P= 1:6.20
N= 1:5.98} -190 120 0 0 0.4 0.4 {}
T {Series 3} -150 340 0 0 0.4 0.4 {}
T {Differential input stage (rail-to-rail)} 780 80 0 0 0.4 0.4 {}
T {Cascode stage} 1640 80 0 0 0.4 0.4 {}
T {Zero Cancellation} 2120 80 0 0 0.4 0.4 {}
T {Compensation
Capacitors} 2620 80 0 0 0.4 0.4 {}
T {Push-pull Buffer
(Class AB Output)} 2780 80 0 0 0.4 0.4 {}
T {Assuming 3.0V} -660 -720 0 0 0.4 0.4 {}
N 140 -1020 140 -900 {lab=#net1}
N 120 -870 140 -870 {lab=VDD}
N 120 -1050 120 -870 {lab=VDD}
N 120 -1050 140 -1050 {lab=VDD}
N 120 -1050 140 -1050 {lab=VDD}
N 120 -1080 120 -1050 {lab=VDD}
N 0 -1020 0 -900 {lab=#net2}
N -20 -870 0 -870 {lab=VDD}
N -20 -1050 -20 -870 {lab=VDD}
N -20 -1050 0 -1050 {lab=VDD}
N -20 -1050 0 -1050 {lab=VDD}
N -20 -1080 -20 -1050 {lab=VDD}
N 0 -840 0 -720 {lab=#net3}
N -20 -690 0 -690 {lab=VDD}
N -20 -870 -20 -690 {lab=VDD}
N 40 -870 40 -690 {lab=BPI}
N 40 -1050 40 -870 {lab=BPI}
N 80 -1000 80 -620 {lab=BPI}
N 0 -620 80 -620 {lab=BPI}
N 0 -660 0 -620 {lab=BPI}
N 0 -1200 0 -1080 {lab=VDD}
N -20 -1200 -20 -1080 {lab=VDD}
N -20 -1200 0 -1200 {lab=VDD}
N 0 -1200 140 -1200 {lab=VDD}
N 140 -1200 140 -1080 {lab=VDD}
N 120 -1200 120 -1080 {lab=VDD}
N -140 -1200 -140 -720 {lab=VDD}
N -140 -1200 -20 -1200 {lab=VDD}
N -100 -1200 -100 -690 {lab=VDD}
N -160 -690 -140 -690 {lab=VDD}
N -160 -1200 -160 -690 {lab=VDD}
N -160 -1200 -140 -1200 {lab=VDD}
N 180 -1000 300 -1000 {lab=BPI}
N 80 -1000 180 -1000 {lab=BPI}
N 40 -1000 80 -1000 {lab=BPI}
N 180 -1000 180 -870 {lab=BPI}
N 180 -1180 180 -1050 {lab=BPO}
N 180 -1180 300 -1180 {lab=BPO}
N 140 -1200 300 -1200 {lab=VDD}
N 880 -1020 880 -900 {lab=#net4}
N 880 -870 900 -870 {lab=VDD}
N 900 -1050 900 -870 {lab=VDD}
N 880 -1050 900 -1050 {lab=VDD}
N 880 -1050 900 -1050 {lab=VDD}
N 900 -1080 900 -1050 {lab=VDD}
N 880 -840 880 -720 {lab=#net5}
N 880 -690 900 -690 {lab=VDD}
N 900 -870 900 -690 {lab=VDD}
N 880 -1200 880 -1080 {lab=VDD}
N 900 -1200 900 -1080 {lab=VDD}
N 880 -1200 900 -1200 {lab=VDD}
N 800 -1050 840 -1050 {lab=BPO}
N 800 -870 840 -870 {lab=BPI}
N 800 -690 840 -690 {lab=INP}
N 1120 -1020 1120 -900 {lab=#net6}
N 1100 -870 1120 -870 {lab=VDD}
N 1100 -1050 1100 -870 {lab=VDD}
N 1100 -1050 1120 -1050 {lab=VDD}
N 1100 -1050 1120 -1050 {lab=VDD}
N 1100 -1080 1100 -1050 {lab=VDD}
N 1120 -840 1120 -720 {lab=#net5}
N 1100 -690 1120 -690 {lab=VDD}
N 1100 -870 1100 -690 {lab=VDD}
N 1120 -1200 1120 -1080 {lab=VDD}
N 1100 -1200 1100 -1080 {lab=VDD}
N 1100 -1200 1120 -1200 {lab=VDD}
N 1160 -1050 1200 -1050 {lab=BPO}
N 1160 -870 1200 -870 {lab=BPI}
N 920 -1200 1100 -1200 {lab=VDD}
N 220 -1180 220 -620 {lab=BPO}
N 140 -620 220 -620 {lab=BPO}
N 140 -840 140 -620 {lab=BPO}
N 140 -620 140 -540 {lab=BPO}
N -140 -660 0 -660 {lab=BPI}
N 880 -660 880 -540 {lab=#net7}
N 1120 -660 1120 -540 {lab=#net8}
N 140 -480 140 -360 {lab=BPO}
N 140 -540 140 -480 {lab=BPO}
N 0 -620 0 -540 {lab=BPI}
N 0 -480 0 -360 {lab=BPI}
N 0 -540 0 -480 {lab=BPI}
N 120 -330 140 -330 {lab=VSS}
N 140 -300 140 -180 {lab=#net9}
N 0 -300 0 -180 {lab=#net10}
N 140 -120 140 0 {lab=VSS}
N 0 -120 0 0 {lab=VSS}
N 0 0 140 0 {lab=VSS}
N -280 -620 -280 -540 {lab=BNO}
N -280 -480 -280 -360 {lab=BNO}
N -280 -540 -280 -480 {lab=BNO}
N -420 -620 -420 -540 {lab=BNI}
N -420 -480 -420 -360 {lab=#net11}
N -300 -330 -280 -330 {lab=VSS}
N -280 -300 -280 -180 {lab=#net12}
N -420 -300 -420 -180 {lab=#net13}
N -280 -120 -280 0 {lab=VSS}
N -420 -120 -420 0 {lab=VSS}
N -420 0 -280 0 {lab=VSS}
N -140 0 0 0 {lab=VSS}
N -280 0 -140 0 {lab=VSS}
N -300 -150 -280 -150 {lab=VSS}
N -300 -150 -300 -10 {lab=VSS}
N -300 -10 -300 0 {lab=VSS}
N -300 -330 -300 -150 {lab=VSS}
N -240 -20 180 -20 {lab=BNO}
N 180 -150 180 -20 {lab=BNO}
N 40 -150 40 -20 {lab=BNO}
N -240 -150 -240 -20 {lab=BNO}
N 180 -20 300 -20 {lab=BNO}
N -200 -400 -200 -20 {lab=BNO}
N -440 -510 -420 -510 {lab=VSS}
N -440 -510 -440 0 {lab=VSS}
N -440 0 -420 0 {lab=VSS}
N -440 -150 -420 -150 {lab=VSS}
N -440 -330 -420 -330 {lab=VSS}
N -380 -510 -380 -330 {lab=BNI}
N -380 -330 -380 -150 {lab=BNI}
N -380 -200 300 -200 {lab=BNI}
N -240 -330 -240 -200 {lab=BNI}
N -340 -580 -340 -200 {lab=BNI}
N -420 -580 -340 -580 {lab=BNI}
N -280 -580 -200 -580 {lab=BNO}
N -200 -580 -200 -400 {lab=BNO}
N 1000 -620 1000 -540 {lab=#net14}
N 1000 -480 1000 -360 {lab=#net15}
N 1000 -300 1000 -180 {lab=#net16}
N 1000 -120 1000 0 {lab=VSS}
N 860 0 1000 0 {lab=VSS}
N 1000 -510 1020 -510 {lab=VSS}
N 1020 -510 1020 0 {lab=VSS}
N 1000 0 1020 0 {lab=VSS}
N 1000 -150 1020 -150 {lab=VSS}
N 1000 -330 1020 -330 {lab=VSS}
N 900 -1200 920 -1200 {lab=VDD}
N 880 -840 1120 -840 {lab=#net5}
N 800 -510 960 -510 {lab=INP}
N 800 -690 800 -510 {lab=INP}
N 920 -330 960 -330 {lab=BNI}
N 920 -150 960 -150 {lab=BNO}
N 280 -1020 280 -900 {lab=#net17}
N 260 -870 280 -870 {lab=VDD}
N 260 -1050 260 -870 {lab=VDD}
N 260 -1050 280 -1050 {lab=VDD}
N 260 -1050 280 -1050 {lab=VDD}
N 260 -1080 260 -1050 {lab=VDD}
N 280 -1200 280 -1080 {lab=VDD}
N 260 -1200 260 -1080 {lab=VDD}
N 320 -1000 320 -870 {lab=BPI}
N 320 -1180 320 -1050 {lab=BPO}
N 280 -840 280 -620 {lab=BNF}
N 280 -620 280 -540 {lab=BNF}
N 280 -480 280 -360 {lab=#net18}
N 260 -330 280 -330 {lab=VSS}
N 280 -300 280 -180 {lab=#net19}
N 280 -120 280 0 {lab=VSS}
N 320 -150 320 -20 {lab=BNO}
N 140 0 280 0 {lab=VSS}
N 300 -1000 320 -1000 {lab=BPI}
N 300 -1180 320 -1180 {lab=BPO}
N 300 -1200 480 -1200 {lab=VDD}
N 320 -1000 740 -1000 {lab=BPI}
N 320 -1180 740 -1180 {lab=BPO}
N 40 -330 40 -200 {lab=BNI}
N 180 -330 180 -200 {lab=BNI}
N 120 -330 120 -0 {lab=VSS}
N -20 -330 -20 0 {lab=VSS}
N -20 -330 -0 -330 {lab=VSS}
N -20 -150 -0 -150 {lab=VSS}
N 120 -150 140 -150 {lab=VSS}
N 260 -330 260 0 {lab=VSS}
N 260 -150 280 -150 {lab=VSS}
N 300 -20 740 -20 {lab=BNO}
N 300 -200 740 -200 {lab=BNI}
N 320 -330 320 -200 {lab=BNI}
N 320 -560 320 -510 {lab=BNF}
N 320 -580 320 -560 {lab=BNF}
N 280 -580 320 -580 {lab=BNF}
N 260 -510 280 -510 {lab=VSS}
N 260 -510 260 -330 {lab=VSS}
N 320 -380 740 -380 {lab=BNF}
N 320 -510 320 -390 {lab=BNF}
N 320 -390 320 -380 {lab=BNF}
N 420 -1020 420 -900 {lab=#net20}
N 400 -870 420 -870 {lab=VDD}
N 400 -1050 400 -870 {lab=VDD}
N 400 -1050 420 -1050 {lab=VDD}
N 400 -1050 420 -1050 {lab=VDD}
N 400 -1080 400 -1050 {lab=VDD}
N 420 -1200 420 -1080 {lab=VDD}
N 400 -1200 400 -1080 {lab=VDD}
N 460 -1000 460 -870 {lab=BPI}
N 460 -1180 460 -1050 {lab=BPO}
N 420 -620 420 -540 {lab=BPF}
N 420 -480 420 -360 {lab=BPF}
N 400 -330 420 -330 {lab=VSS}
N 420 -300 420 -180 {lab=#net21}
N 420 -120 420 0 {lab=VSS}
N 460 -150 460 -20 {lab=BNO}
N 280 0 420 0 {lab=VSS}
N 440 -1000 460 -1000 {lab=BPI}
N 440 -1180 460 -1180 {lab=BPO}
N 400 -330 400 0 {lab=VSS}
N 400 -150 420 -150 {lab=VSS}
N 460 -330 460 -200 {lab=BNI}
N 420 -540 420 -480 {lab=BPF}
N 420 -840 420 -720 {lab=#net22}
N 400 -690 420 -690 {lab=VDD}
N 400 -870 400 -690 {lab=VDD}
N 460 -690 460 -620 {lab=BPF}
N 420 -620 460 -620 {lab=BPF}
N 420 -660 420 -620 {lab=BPF}
N 460 -820 460 -690 {lab=BPF}
N 460 -820 740 -820 {lab=BPF}
N 420 -0 740 -0 {lab=VSS}
N 480 -1200 740 -1200 {lab=VDD}
N -560 -540 -420 -540 {lab=BNI}
N -520 -510 -520 0 {lab=VSS}
N -520 0 -440 -0 {lab=VSS}
N -580 -510 -560 -510 {lab=VSS}
N -580 -510 -580 -0 {lab=VSS}
N -580 -0 -520 -0 {lab=VSS}
N -560 -480 -560 -0 {lab=VSS}
N 1320 -620 1320 -540 {lab=#net23}
N 1320 -480 1320 -360 {lab=#net15}
N 1320 -300 1320 -180 {lab=#net24}
N 1320 -120 1320 0 {lab=VSS}
N 1300 -510 1320 -510 {lab=VSS}
N 1300 -510 1300 0 {lab=VSS}
N 1300 0 1320 0 {lab=VSS}
N 1300 -150 1320 -150 {lab=VSS}
N 1300 -330 1320 -330 {lab=VSS}
N 1360 -330 1400 -330 {lab=BNI}
N 1360 -150 1400 -150 {lab=BNO}
N 1360 -510 1400 -510 {lab=INM}
N 1400 -690 1400 -510 {lab=INM}
N 1020 0 1300 0 {lab=VSS}
N 800 -1200 880 -1200 {lab=VDD}
N 1120 -1200 1480 -1200 {lab=VDD}
N 1320 0 1520 -0 {lab=VSS}
N 1680 -1020 1680 -900 {lab=#net23}
N 1660 -870 1680 -870 {lab=VDD}
N 1660 -1050 1660 -870 {lab=VDD}
N 1660 -1050 1680 -1050 {lab=VDD}
N 1660 -1050 1680 -1050 {lab=VDD}
N 1660 -1080 1660 -1050 {lab=VDD}
N 1680 -840 1680 -720 {lab=#net25}
N 1660 -690 1680 -690 {lab=VDD}
N 1660 -870 1660 -690 {lab=VDD}
N 1680 -1200 1680 -1080 {lab=VDD}
N 1660 -1200 1660 -1080 {lab=VDD}
N 1660 -1200 1680 -1200 {lab=VDD}
N 1720 -1050 1760 -1050 {lab=#net25}
N 1720 -870 1760 -870 {lab=BPI}
N 1720 -690 1880 -690 {lab=BPF}
N 1820 -1200 2180 -1200 {lab=VDD}
N 1920 -1020 1920 -900 {lab=#net14}
N 1920 -870 1940 -870 {lab=VDD}
N 1940 -1050 1940 -870 {lab=VDD}
N 1920 -1050 1940 -1050 {lab=VDD}
N 1920 -1050 1940 -1050 {lab=VDD}
N 1940 -1080 1940 -1050 {lab=VDD}
N 1920 -840 1920 -720 {lab=#net26}
N 1920 -690 1940 -690 {lab=VDD}
N 1940 -870 1940 -690 {lab=VDD}
N 1920 -1200 1920 -1080 {lab=VDD}
N 1940 -1200 1940 -1080 {lab=VDD}
N 1920 -1200 1940 -1200 {lab=VDD}
N 1840 -1050 1880 -1050 {lab=#net25}
N 1840 -870 1880 -870 {lab=BPI}
N 1720 -690 1880 -690 {lab=BPF}
N 1560 -1200 1920 -1200 {lab=VDD}
N 1760 -1050 1840 -1050 {lab=#net25}
N 1760 -870 1840 -870 {lab=BPI}
N 1680 -300 1680 -180 {lab=#net8}
N 1660 -150 1680 -150 {lab=VSS}
N 1660 -330 1680 -330 {lab=VSS}
N 1680 -120 1680 0 {lab=VSS}
N 1660 -510 1660 0 {lab=VSS}
N 1520 0 1680 -0 {lab=VSS}
N 1720 -510 1740 -510 {lab=VSS}
N 1660 -510 1720 -510 {lab=VSS}
N 1740 -1050 1740 -540 {lab=#net25}
N 1680 -820 1740 -820 {lab=#net25}
N 1680 -460 1740 -460 {lab=#net27}
N 1740 -480 1740 -150 {lab=#net27}
N 1720 -150 1740 -150 {lab=#net27}
N 1920 -300 1920 -180 {lab=#net7}
N 1920 -120 1920 0 {lab=VSS}
N 1940 -510 1940 0 {lab=VSS}
N 1920 -150 1940 -150 {lab=VSS}
N 1920 -330 1940 -330 {lab=VSS}
N 1860 -510 1940 -510 {lab=VSS}
N 1780 -510 1820 -510 {lab=BNF}
N 1860 -460 1920 -460 {lab=#net28}
N 1740 -150 1880 -150 {lab=#net27}
N 1720 -330 1880 -330 {lab=BNI}
N 1120 -280 1680 -280 {lab=#net8}
N 1120 -540 1120 -280 {lab=#net8}
N 880 -540 880 -260 {lab=#net7}
N 880 -260 1920 -260 {lab=#net7}
N 1680 0 1940 0 {lab=VSS}
N 1860 -480 1860 -460 {lab=#net28}
N 1860 -820 1860 -540 {lab=#net26}
N 1860 -820 1910 -820 {lab=#net26}
N 1910 -820 1920 -820 {lab=#net26}
N 1010 -980 1920 -980 {lab=#net14}
N 1320 -960 1680 -960 {lab=#net23}
N 1160 -690 1400 -690 {lab=INM}
N 1320 -960 1320 -620 {lab=#net23}
N 1000 -980 1010 -980 {lab=#net14}
N 1000 -980 1000 -620 {lab=#net14}
N 740 0 860 0 {lab=VSS}
N 740 -1200 800 -1200 {lab=VDD}
N 2320 -300 2320 -180 {lab=#net29}
N 2320 -120 2320 0 {lab=VSS}
N 2080 0 2340 0 {lab=VSS}
N 2320 -330 2340 -330 {lab=VSS}
N 2340 -330 2340 0 {lab=VSS}
N 2320 -150 2340 -150 {lab=VSS}
N 2280 -200 2280 -150 {lab=#net29}
N 2280 -200 2320 -200 {lab=#net29}
N 2280 -380 2280 -330 {lab=#net30}
N 2280 -380 2320 -380 {lab=#net30}
N 2320 -840 2320 -360 {lab=#net30}
N 2320 -870 2340 -870 {lab=VDD}
N 2340 -1200 2340 -870 {lab=VDD}
N 2180 -1200 2340 -1200 {lab=VDD}
N 2320 -1200 2320 -900 {lab=VDD}
N 2280 -870 2280 -780 {lab=#net26}
N 2320 -1200 2680 -1200 {lab=VDD}
N 2560 -1020 2560 -900 {lab=#net31}
N 2560 -870 2580 -870 {lab=VDD}
N 2580 -1050 2580 -870 {lab=VDD}
N 2560 -1050 2580 -1050 {lab=VDD}
N 2560 -1050 2580 -1050 {lab=VDD}
N 2580 -1080 2580 -1050 {lab=VDD}
N 2560 -1200 2560 -1080 {lab=VDD}
N 2580 -1200 2580 -1080 {lab=VDD}
N 2560 -1200 2580 -1200 {lab=VDD}
N 2520 -1050 2520 -1000 {lab=#net31}
N 2520 -1000 2560 -1000 {lab=#net31}
N 2520 -870 2520 -820 {lab=#net32}
N 2520 -820 2560 -820 {lab=#net32}
N 2560 -840 2560 -360 {lab=#net32}
N 2560 -300 2560 0 {lab=VSS}
N 2340 0 2560 0 {lab=VSS}
N 2560 0 2580 0 {lab=VSS}
N 2580 -330 2580 0 {lab=VSS}
N 2560 -330 2580 -330 {lab=VSS}
N 2520 -420 2520 -330 {lab=#net28}
N 2580 0 2800 0 {lab=VSS}
N 2800 -290 2800 0 {lab=VSS}
N 2800 -460 2800 -290 {lab=VSS}
N 2800 -690 2820 -690 {lab=VDD}
N 2820 -1200 2820 -690 {lab=VDD}
N 2680 -1200 2820 -1200 {lab=VDD}
N 2800 -1200 2800 -720 {lab=VDD}
N 2760 -780 2760 -690 {lab=#net26}
N 2520 -780 2760 -780 {lab=#net26}
N 2760 -490 2760 -420 {lab=#net28}
N 2800 -480 2800 -460 {lab=VSS}
N 2760 -510 2760 -490 {lab=#net28}
N 2800 -510 2820 -510 {lab=VSS}
N 2820 -510 2820 0 {lab=VSS}
N 2800 0 2820 0 {lab=VSS}
N 2800 -660 2800 -540 {lab=OUT}
N 2720 -590 2800 -590 {lab=OUT}
N 2650 -590 2720 -590 {lab=OUT}
N 2700 -620 2700 -560 {lab=VSS}
N 2700 -560 2700 0 {lab=VSS}
N 2630 -620 2630 -560 {lab=VSS}
N 2630 -560 2630 0 {lab=VSS}
N 2650 -650 2720 -650 {lab=#net33}
N 2650 -530 2720 -530 {lab=#net34}
N 2480 -650 2650 -650 {lab=#net33}
N 2480 -530 2650 -530 {lab=#net34}
N 2440 -1200 2440 -650 {lab=VDD}
N 2180 -920 2180 -650 {lab=#net14}
N 2440 -530 2440 0 {lab=VSS}
N 2180 -530 2180 -200 {lab=#net7}
N 2180 -530 2410 -530 {lab=#net7}
N 2470 -530 2480 -530 {lab=#net34}
N 2470 -650 2480 -650 {lab=#net33}
N 2180 -650 2410 -650 {lab=#net14}
N 2320 -570 2440 -570 {lab=#net30}
N 2440 -610 2560 -610 {lab=#net32}
N 2180 -200 2180 -180 {lab=#net7}
N 2180 -120 2180 0 {lab=VSS}
N 2140 -150 2140 0 {lab=VSS}
N 2180 -150 2200 -150 {lab=VSS}
N 2200 -150 2200 0 {lab=VSS}
N 2180 -1020 2180 -920 {lab=#net14}
N 2180 -1050 2200 -1050 {lab=VDD}
N 2200 -1200 2200 -1050 {lab=VDD}
N 2180 -1200 2180 -1080 {lab=VDD}
N 2140 -1200 2140 -1050 {lab=VDD}
N -620 -1200 -160 -1200 {lab=VDD}
N -620 -0 -580 -0 {lab=VSS}
N 2800 -590 2860 -590 {lab=OUT}
N -740 -130 -720 -130 {lab=VSS}
N -740 -130 -740 -80 {lab=VSS}
N -740 -80 -680 -80 {lab=VSS}
N -680 -100 -680 -80 {lab=VSS}
N -680 -160 -660 -160 {lab=VSS}
N -660 -160 -660 -130 {lab=VSS}
N -680 -130 -660 -130 {lab=VSS}
N -660 -130 -660 -80 {lab=VSS}
N -680 -80 -660 -80 {lab=VSS}
N -680 -220 -660 -220 {lab=VDD}
N -680 -250 -660 -250 {lab=VDD}
N -740 -250 -720 -250 {lab=VDD}
N -740 -300 -740 -250 {lab=VDD}
N -740 -300 -680 -300 {lab=VDD}
N -680 -300 -680 -280 {lab=VDD}
N -680 -300 -660 -300 {lab=VDD}
N -660 -300 -660 -220 {lab=VDD}
N -420 -860 -420 -620 {lab=BNI}
N -420 -1200 -420 -920 {lab=VDD}
N -280 -1200 -280 -920 {lab=VDD}
N -280 -890 -260 -890 {lab=VDD}
N -260 -1200 -260 -890 {lab=VDD}
N -440 -890 -420 -890 {lab=VDD}
N -440 -1200 -440 -890 {lab=VDD}
N -380 -890 -320 -890 {lab=VB}
N -350 -890 -350 -780 {lab=VB}
N -520 -780 -350 -780 {lab=VB}
N -280 -860 -280 -620 {lab=BNO}
N -600 -890 -580 -890 {lab=VDD}
N -540 -890 -520 -890 {lab=VDD}
N -520 -940 -520 -890 {lab=VDD}
N -580 -940 -520 -940 {lab=VDD}
N -580 -940 -580 -920 {lab=VDD}
N -600 -940 -580 -940 {lab=VDD}
N -600 -1050 -580 -1050 {lab=VDD}
N -540 -1050 -520 -1050 {lab=VDD}
N -520 -1100 -520 -1050 {lab=VDD}
N -580 -1100 -520 -1100 {lab=VDD}
N -580 -1100 -580 -1080 {lab=VDD}
N -600 -1100 -580 -1100 {lab=VDD}
N -580 -1020 -580 -1000 {lab=BNI}
N -600 -1100 -600 -1050 {lab=VDD}
N -600 -940 -600 -890 {lab=VDD}
N -580 -860 -580 -840 {lab=BNO}
N 2520 -420 2760 -420 {lab=#net28}
N 1600 -1200 1600 -690 {lab=VDD}
N 1480 -1200 1560 -1200 {lab=VDD}
N 1540 -690 1560 -690 {lab=VDD}
N 1540 -1200 1540 -690 {lab=VDD}
N 1560 -660 1680 -660 {lab=#net27}
N 1920 -660 2040 -660 {lab=#net28}
N 1920 -780 2520 -780 {lab=#net26}
N 1920 -920 2180 -920 {lab=#net14}
N 2040 -690 2060 -690 {lab=VDD}
N 2060 -1200 2060 -690 {lab=VDD}
N 2000 -1200 2000 -690 {lab=VDD}
N 1560 -540 1740 -540 {lab=#net25}
N 1560 -480 1730 -480 {lab=#net27}
N 1860 -480 2040 -480 {lab=#net28}
N 1920 -660 1920 -360 {lab=#net28}
N 1680 -660 1680 -360 {lab=#net27}
N 1860 -540 2040 -540 {lab=#net26}
N 2000 -510 2000 0 {lab=VSS}
N 1940 0 2000 0 {lab=VSS}
N 1940 0 2080 -0 {lab=VSS}
N 1920 -420 2520 -420 {lab=#net28}
N 1920 -200 2180 -200 {lab=#net7}
N 2040 -510 2060 -510 {lab=VSS}
N 2060 -510 2060 0 {lab=VSS}
N 1540 -510 1560 -510 {lab=VSS}
N 1540 -510 1540 -0 {lab=VSS}
N 1920 -720 2040 -720 {lab=#net26}
N 1560 -720 1680 -720 {lab=#net25}
N 1730 -480 1740 -480 {lab=#net27}
N 1600 -510 1600 -0 {lab=VSS}
N 1000 -360 1320 -360 {lab=#net15}
C {IP62LIB/MP.sym} 2760 -690 0 0 {name=XMDRVP model=PMOS w=12u l=8u m=96 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 2760 -510 0 0 {name=XMDRVN model=NMOS w=12u l=8u m=48 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 180 -1050 0 1 {name=XMB4P1 model=PMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 180 -870 0 1 {name=XMB4P2 model=PMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 40 -1050 0 1 {name=XMB3P1 model=PMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 40 -870 0 1 {name=XMB3P2 model=PMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 40 -690 0 1 {name=XMB3P3 model=PMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/lab_wire.sym} 720 -1180 0 0 {name=p3 sig_type=std_logic lab=BPO}
C {devices/lab_wire.sym} 720 -1000 0 0 {name=p1 sig_type=std_logic lab=BPI}
C {IP62LIB/MP.sym} 840 -1050 0 0 {name=XMINPP1 model=PMOS w=12u l=8u m=8 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 840 -870 0 0 {name=XMINPP2 model=PMOS w=12u l=8u m=8 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 840 -690 0 0 {name=XMINPP3 model=PMOS w=12u l=8u m=8 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/lab_wire.sym} 820 -1050 0 0 {name=p2 sig_type=std_logic lab=BPO}
C {devices/lab_wire.sym} 820 -870 0 0 {name=p4 sig_type=std_logic lab=BPI}
C {IP62LIB/MP.sym} 1160 -1050 0 1 {name=XMINMP1 model=PMOS w=12u l=8u m=8 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 1160 -870 0 1 {name=XMINMP2 model=PMOS w=12u l=8u m=8 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 1160 -690 0 1 {name=XMINMP3 model=PMOS w=12u l=8u m=8 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/lab_wire.sym} 1180 -1050 0 1 {name=p5 sig_type=std_logic lab=BPO}
C {devices/lab_wire.sym} 1180 -870 0 1 {name=p6 sig_type=std_logic lab=BPI}
C {IP62LIB/MN.sym} 180 -330 0 1 {name=XMB4N2 model=NMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 40 -330 0 1 {name=XMB3N2 model=NMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 180 -150 0 1 {name=XMB4N1 model=NMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 40 -150 0 1 {name=XMB3N1 model=NMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} -240 -330 0 1 {name=XMB1N2 model=NMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} -380 -330 0 1 {name=XMB2N2 model=NMOS w=12u l=8u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} -240 -150 0 1 {name=XMB1N1 model=NMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} -380 -150 0 1 {name=XMB2N1 model=NMOS w=12u l=8u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} -380 -510 0 1 {name=XMB2N3 model=NMOS w=12u l=8u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/lab_wire.sym} 720 -200 0 0 {name=p8 sig_type=std_logic lab=BNI}
C {devices/lab_wire.sym} 720 -20 0 0 {name=p9 sig_type=std_logic lab=BNO}
C {IP62LIB/MN.sym} 960 -330 0 0 {name=XMINPN2 model=NMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 960 -150 0 0 {name=XMINPN1 model=NMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 960 -510 0 0 {name=XMINPN3 model=NMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/lab_wire.sym} 940 -330 0 0 {name=p13 sig_type=std_logic lab=BNI}
C {devices/lab_wire.sym} 940 -150 0 0 {name=p14 sig_type=std_logic lab=BNO}
C {IP62LIB/MP.sym} 320 -1050 0 1 {name=XMB5P1 model=PMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 320 -870 0 1 {name=XMB5P2 model=PMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 320 -330 0 1 {name=XMB5N2 model=NMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 320 -150 0 1 {name=XMB5N1 model=NMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 320 -510 0 1 {name=XMB5N3 model=NMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/lab_wire.sym} 720 -380 0 0 {name=p12 sig_type=std_logic lab=BNF}
C {IP62LIB/MP.sym} 460 -1050 0 1 {name=XMB6P1 model=PMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 460 -870 0 1 {name=XMB6P2 model=PMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 460 -330 0 1 {name=XMB6N2 model=NMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 460 -150 0 1 {name=XMB6N1 model=NMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 460 -690 0 1 {name=XMB6P3 model=PMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/lab_wire.sym} 720 -820 0 0 {name=p15 sig_type=std_logic lab=BPF}
C {IP62LIB/MN.sym} -520 -510 0 1 {name=XMB2DMYN model=NMOS w=12u l=8u m=1 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 1360 -330 0 1 {name=XMINMN2 model=NMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 1360 -150 0 1 {name=XMINMN1 model=NMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 1360 -510 0 1 {name=XMINMN3 model=NMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/lab_wire.sym} 1380 -330 0 1 {name=p16 sig_type=std_logic lab=BNI}
C {devices/lab_wire.sym} 1380 -150 0 1 {name=p17 sig_type=std_logic lab=BNO}
C {IP62LIB/MP.sym} 1720 -1050 0 1 {name=XMCSMP1 model=PMOS w=12u l=8u m=16 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 1720 -870 0 1 {name=XMCSMP2 model=PMOS w=12u l=8u m=8 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 1720 -690 0 1 {name=XMCSMP3 model=PMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 1880 -1050 0 0 {name=XMCSPP1 model=PMOS w=12u l=8u m=16 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 1880 -870 0 0 {name=XMCSPP2 model=PMOS w=12u l=8u m=8 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 1880 -690 0 0 {name=XMCSPP3 model=PMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/lab_wire.sym} 1800 -870 0 0 {name=p18 sig_type=std_logic lab=BPI}
C {devices/lab_wire.sym} 1800 -690 0 0 {name=p19 sig_type=std_logic lab=BPF}
C {IP62LIB/MN.sym} 1720 -330 0 1 {name=XMCSMN2 model=NMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 1720 -150 0 1 {name=XMCSMN1 model=NMOS w=12u l=8u m=8 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 1780 -510 0 1 {name=XMCSMN3 model=NMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 1820 -510 0 0 {name=XMCSPN3 model=NMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 1880 -330 0 0 {name=XMCSPN2 model=NMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 1880 -150 0 0 {name=XMCSPN1 model=NMOS w=12u l=8u m=8 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/lab_wire.sym} 1800 -330 0 0 {name=p20 sig_type=std_logic lab=BNI}
C {devices/lab_wire.sym} 1800 -510 0 0 {name=p21 sig_type=std_logic lab=BNF}
C {IP62LIB/MN.sym} 2280 -330 0 0 {name=XMSBPN2 model=NMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 2280 -150 0 0 {name=XMSBPN1 model=NMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 2280 -870 0 0 {name=XMSBPP1 model=PMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 2520 -1050 0 0 {name=XMSBNP1 model=PMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 2520 -870 0 0 {name=XMSBNP2 model=PMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 2520 -330 0 0 {name=XMSBNN1 model=NMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/CSIO.sym} 2720 -650 0 0 {name=XCP1
model=F_CSIO
c=2.9963046p
x=69.8u
y=69.8u
m=1}
C {IP62LIB/CSIO.sym} 2650 -650 0 0 {name=XCP2
model=F_CSIO
c=2.9963046p
x=69.8u
y=69.8u
m=1}
C {IP62LIB/CSIO.sym} 2720 -530 2 1 {name=XCN1
model=F_CSIO
c=2.9963046p
x=69.8u
y=69.8u
m=1}
C {IP62LIB/CSIO.sym} 2650 -530 2 1 {name=XCN2
model=F_CSIO
c=2.9963046p
x=69.8u
y=69.8u
m=1}
C {IP62LIB/MP.sym} 2440 -610 3 0 {name=XMSBNP3 model=PMOS w=12u l=8u m=16 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 2440 -570 1 0 {name=XMSBPN3 model=NMOS w=12u l=8u m=8 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 2140 -150 0 0 {name=XMSBPDMYN model=NMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 2140 -1050 0 0 {name=XMSBNDMYP model=PMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/iopin.sym} -620 -1200 2 0 {name=p22 lab=VDD}
C {devices/iopin.sym} -620 0 2 0 {name=p23 lab=VSS}
C {devices/ipin.sym} 800 -510 0 0 {name=p7 lab=INP}
C {devices/ipin.sym} 1400 -690 0 1 {name=p24 lab=INM}
C {devices/opin.sym} 2860 -590 0 0 {name=p25 lab=OUT}
C {IP62LIB/MN.sym} -720 -130 0 0 {name=XMDMYN1 model=NMOS w=12u l=8u m=22 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/lab_wire.sym} -740 -80 0 0 {name=p26 sig_type=std_logic lab=VSS}
C {IP62LIB/MP.sym} -720 -250 0 0 {name=XMDMYP1 model=PMOS w=12u l=8u m=52 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/lab_wire.sym} -740 -300 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {IP62LIB/MP.sym} -380 -890 0 1 {name=XMPVB1 model=PMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} -320 -890 0 0 {name=XMPVB2 model=PMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/ipin.sym} -520 -780 0 0 {name=p11 lab=VB}
C {IP62LIB/MP.sym} -540 -890 0 1 {name=XMDMYP2 model=PMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/lab_wire.sym} -520 -940 0 1 {name=p27 sig_type=std_logic lab=VDD}
C {IP62LIB/MP.sym} -540 -1050 0 1 {name=XMDMYP3 model=PMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {devices/lab_wire.sym} -520 -1100 0 1 {name=p28 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} -580 -1000 0 0 {name=p29 sig_type=std_logic lab=BNI}
C {devices/lab_wire.sym} -580 -840 0 0 {name=p30 sig_type=std_logic lab=BNO}
C {IP62LIB/MP.sym} -100 -690 0 1 {name=XMDMYP4 model=PMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 1600 -690 0 1 {name=XMCSMDMYP model=PMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MP.sym} 2000 -690 0 0 {name=XMCSPDMYP model=PMOS w=12u l=8u m=4 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 1600 -510 0 1 {name=XMCSMDMYN model=NMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
C {IP62LIB/MN.sym} 2000 -510 0 0 {name=XMCSPN4 model=NMOS w=12u l=8u m=2 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0}
