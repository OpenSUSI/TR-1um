v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 290 -270 330 -270 {
lab=#net1}
N 290 -270 290 -250 {
lab=#net1}
N 220 -330 330 -330 {
lab=#net2}
N 220 -330 220 -320 {
lab=#net2}
N 140 -350 330 -350 {
lab=#net3}
N 140 -350 140 -330 {
lab=#net3}
N 390 -370 390 -360 {
lab=#net4}
N 80 -370 390 -370 {
lab=#net4}
N 80 -370 80 -330 {
lab=#net4}
N 390 -240 390 -170 {
lab=GND}
N 80 -170 390 -170 {
lab=GND}
N 80 -270 80 -170 {
lab=GND}
N 140 -270 140 -170 {
lab=GND}
N 220 -260 220 -170 {
lab=GND}
N 290 -190 290 -170 {
lab=GND}
N 80 -170 80 -150 {
lab=GND}
N 450 -300 470 -300 {
lab=out}
N 470 -300 500 -300 {
lab=out}
C {devices/code_shown.sym} -460 -600 0 0 {name=control only_toplevel=false value=".option savecurrent
.control
op
show m
save all
ac dec 20 1e3 1e10
plot vdb(out)
print @m.x1.xm2.m1[vgs]
print @m.x1.xm2.m1[vgs] - @m.x1.xm2.m1[vth]
print @m.x1.xm2.m1[vds]
print @m.x1.xm2.m1[id]
print @m.x1.xm2.m1[gm]
print @m.x1.xm2.m1[gds]
print 1/@m.x1.xm2.m1[gds]
print @m.x1.xm4.m1[vgs]
print @m.x1.xm4.m1[vgs] - @m.x1.xm4.m1[vth]
print @m.x1.xm4.m1[vds]
print @m.x1.xm4.m1[id]
print @m.x1.xm4.m1[gm]
print @m.x1.xm4.m1[gds]
print 1/@m.x1.xm4.m1[gds]
print @m.x1.xm5.m1[vgs]
print @m.x1.xm5.m1[vgs] - @m.x1.xm5.m1[vth]
print @m.x1.xm5.m1[vds]
print @m.x1.xm5.m1[id]
print @m.x1.xm5.m1[gm]
print @m.x1.xm5.m1[gds]
print 1/@m.x1.xm5.m1[gds]
.endc"}
C {devices/vsource.sym} 80 -300 0 0 {name=Vdd value=5.0}
C {devices/vsource.sym} 140 -300 0 0 {name=Vb value=3.5}
C {devices/vsource.sym} 290 -220 0 0 {name=Vinn value="DC 2.5"}
C {devices/vsource.sym} 220 -290 0 0 {name=Vinp value="DC 2.5 AC 1"}
C {devices/gnd.sym} 80 -150 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 500 -300 0 1 {name=p1 sig_type=std_logic lab=out}
C {diff.sym} 350 -300 0 0 {name=X1}
C {devices/code_shown.sym} -460 -40 0 0 {name=measure only_toplevel=false value=".measure ac gain find vdb(out) at=1e3"}
C {devices/code.sym} -470 -750 0 0 {name=TR10_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".include $::LIB/../ip62_models"
spice_ignore=false}
