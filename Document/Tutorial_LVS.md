# Tutorial: How to make LVS runset for KLayout 
by jun1okamura 
---
Regardless of the original PDK package from TOKAI RIKA, I would like to remake the LVS runset for the KLayout step-by-step as a Tutorial and ask the Open-Source Silicon community to provide feedback and/or collaborate to polish it. This is my first deep dive into Klayout DRC/LVS and TR-1um technology, so there may be misunderstandings and non-optimized use of the runset command. Please feel free to let me know and guide me to the proper method or command.

I might be one of the first users and chip designers of EWS-based EDA software in Japan. In 1987, I installed the **SDA Edge** tool on a Sun-3 workstation and learned many of the features for designing Dynamic Memory device. Bundled DRC/LVS feature for physical verification, later called **DIVA** after **SDA** acquired and renamed to **Cadence**, we have to develop the runsets for DRC/LVS by desginers themselves, since there was no EDA team at that moment. So, the following method is based on such personal experiences and might not reflect upfront engineering technology driven by commercial EDA tool vendors. It would be much appreciated if I could have that feedback as well.


**IMHO**, I prefer to keep the LVS runset simple, readable, and consistent with the DRC runset, especially in terms of device recognition. The current approach uses many recognition layers, which can be overly complex and difficult to maintain.
Given that the LVS runset is also applicable to LVL or SVS comparisons, it’s important for all users to understand each step and how it works. A simplified structure would make the runset easier to maintain and more accessible to the broader user base.

**Then, Let's start!**

## [Preface](./LVS00_Prefece.md)

## [Chapter 1](./LVS01_Chapter.md)

## [Chapter 2](./LVS02_Chapter.md)

## [Chapter 3](./LVS03_Chapter.md)

