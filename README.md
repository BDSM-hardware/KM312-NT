The KM312-NT project implements the audio 3 mode of the ET312 or its clones such as the MK312.

It is a PCB of about 8x8cm that contains everything (including the power supply). One have to build as many as needed boards according to the desired number of groups of 4 channels.

Two configurations can be wired:
* 2 groups of triphase
* 1 group of quadriphase and one isolated channel

It works with a supply around 10V. That can provided by 6 AA type batteries 1.5V or 8 NiMh AA type 1.5V or a single 9V battery.

It uses an 1591ES box, or another one of the same series. Be careful, the pins for screw mounting are, in general, too short in regard of the surface mount components placed on the copper side. 


WARNING WARNING WARNING


This is, for now, only a proof of concept, to see if it fits the box.

The VHDL design has to be done first to verify it fits a TQFP100 or a TQFP144 package.
