The KM312-NT project implements the audio 3 mode of the ET312 or its clones such as the MK312.

It is a PCB that contains everything (including the power supply). A doughter card is possible, using the pins (+-12 differential lines) and the central screw. Indeed, the transformer are a little high but not the other components.

Three configurations can be wired:
* 2 groups of triphase
* 1 group of triphase and 2 independant channels
* 1 group of quadriphase and one isolated channel

It works with a supply around 10V. That can provided by 6 AA type batteries 1.5V or 8 NiMh AA type 1.5V or a single 9V battery.

It uses an 1591FS box, or another one of the same series. Be careful, the pins for screw mounting are, in general, too short in regard of the surface mount components placed on the copper side. Some extensions have to be designed.


WARNING WARNING WARNING


This is, for now, only a proof of concept.

The VHDL design has to be done first to verify it fits a ICE40_HX4K using the TQFP144 package.
