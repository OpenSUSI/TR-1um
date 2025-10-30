# TR-1um Directory Structure 
```
TR-1um -- openIP62 -- AnagixLoader
       |           +- IP62
       +- GDSII
       +- schematic
       +- tech
       +- Tools
       +- Document
```
## openIP62 
The directory contains the original PDKs provided by Tokai Rika. It includes two main subdirectories: **AnagixLoader** and **IP62**. Detailed documentation and installation manuals (in Japanese) can be found in: **openIP62/IP62/Technology/doc**

## GDSII
Final GDSII data for 2025/09/24-25 OSS workshop on Kyushu university.

## schematic
Final schematic data for 2025/09/24-25 OSS workshop on Kyushu university.

## tech
Working directry for Open Source Silicon community to exchange new idea and currently **drc** is active for klayout DRC file development. **lvs** is preserved.

## Tools
Preserved.

## Document

Since the original DRC cannot check full-custom layout other than PCEL, new DRC runset development is ongoing under the tech/drc directory. Also, the [Tutorial for DRC](Document/Tutorial_DRC.md) project is as well; welcome to join as always.



