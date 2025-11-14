# Preface: lvs.lylvs

## [lvs.lylvs](../tech/lvs/lvs.lylvs)

It seems **lvs.lylvs** file is cached in the KLayout once it is launched, so it has to be edited in the tools for debugging. So my **lvs.lylvs** only includes **# %include run.lvs** commands, as shown below.

```
# TR-1um LVS v0.001 
# Original version was made by jun1okamura from TokaiRika's document
# LICENSE: Apache License Version 2.0, January 2004,
#          http://www.apache.org/licenses/
# ----- ------ ----- 
# %include run.lvs
#----
```

## [run.lvs](../tech/lvs/run.lvs)

**run.lvs** contain a couple of **# %include** commands, as shown below.

```
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
deep          # Hierarchical extraction
#
report_lvs    # LVS report window
#----
# %include ../drc/00_Layers.drc
# %include ../drc/02_Device.drc
# %include 00_Extract.lvs
# %include 01_Extract.lvs
# %include 02_Extract.lvs
#----
```

First two **%include** lines are shared with DRC runset which are GDSII layers input and device recognition steps.


