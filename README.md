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

Since the original DRC cannot check a full-custom layout, such as Standard Cell development, except for PCEL use, new DRC runset development is ongoing under the tech/drc directory. Additionally, the [Tutorial: How to make DRC runset for KLayout](Document/Tutorial_DRC.md) project is also ongoing; feel free to join as always. We welcome your feedback on the DRC result and bug report as well.

## openIP62 
The directory contains the original PDKs provided by **Tokai Rika**. It includes two main subdirectories: **AnagixLoader** and **IP62**. Detailed documentation and installation manuals (in Japanese) can be found in: **openIP62/IP62/Technology/doc**

## GDSII
Final GDSII data for 2025/09/24-25 OSS hands-on seminar on Kyushu university.

## schematic
Final schematic data for 2025/09/24-25 OSS hands-on seminar on Kyushu university.

## tech
Working directry for Open Source Silicon community to exchange new idea and currently **drc** directory is active for KLayout DRC runset development. **lvs** is preserved. We are welcome to contribute **Open PDK** development.

## Tools
Preserved.

## Document

[Tutorial: How to make DRC runset for KLayout](Document/Tutorial_DRC.md)


