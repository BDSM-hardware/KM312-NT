NETLIST_PROG?=gnetlist
EXPORT_PROG?=gaf
SRCDIR?=
BUILDDIR?=
DESTDIR?=


all			: $(DESTDIR)km312_digital.partslist_by_refdes.txt $(DESTDIR)km312_digital.partslist_by_value.txt $(DESTDIR)km312_digital.net  $(DESTDIR)sch_build_date $(BUILDDIR)convert_test.cir

lists		: $(DESTDIR)km312_digital.partslist_by_refdes.txt $(DESTDIR)km312_digital.partslist_by_value.txt

spice		: $(BUILDDIR)convert_test.cir 

pcb		: $(DESTDIR)km312_digital.net

schemas		: $(DESTDIR)sch_build_date

$(DESTDIR)km312_digital.partslist_by_refdes.txt : $(SRCDIR)km312_D_analogue_1.sch
	$(NETLIST_PROG) -g partslist1 -o $(DESTDIR)km312_digital.partslist_by_refdes.txt $(SRCDIR)km312_D_analogue_1.sch $(SRCDIR)km312_D_input_sound.sch

$(DESTDIR)km312_digital.partslist_by_value.txt : $(SRCDIR)km312_D_analogue_1.sch
	$(NETLIST_PROG) -g partslist3 -o $(DESTDIR)km312_digital.partslist_by_value.txt $(SRCDIR)km312_D_analogue_1.sch $(SRCDIR)km312_D_input_sound.sch


$(BUILDDIR)AMP_OP.cir	:	$(SRCDIR)AMP_OP.sch
	$(NETLIST_PROG) -g spice-sdb -o $(BUILDDIR)AMP_OP.cir $(SRCDIR)AMP_OP.sch
	sed -r -i 's/IOut_/* IOut_/g;s/Isense_/* Isense_/g' $(BUILDDIR)AMP_OP.cir

$(BUILDDIR)AMP_OP_FAST.cir	:	$(SRCDIR)AMP_OP_FAST.sch
	$(NETLIST_PROG) -g spice-sdb -o $(BUILDDIR)AMP_OP_FAST.cir $(SRCDIR)AMP_OP_FAST.sch
	sed -r -i 's/IOut_/* IOut_/g;s/Isense_/* Isense_/g' $(BUILDDIR)AMP_OP_FAST.cir

$(BUILDDIR)convert_test.cir	:	$(SRCDIR)convert_test.sch $(SRCDIR)transfo.sch $(SRCDIR)km312_analog.sch $(SRCDIR)AMP_OP.cir $(SRCDIR)AMP_OP_FAST.cir
	$(NETLIST_PROG) -g spice-sdb -o $(BUILDDIR)transfo.cir $(SRCDIR)transfo.sch
	$(NETLIST_PROG) -g spice-sdb -o $(BUILDDIR)convert_test.cir $(SRCDIR)convert_test.sch $(SRCDIR)km312_analog.sch

$(DESTDIR)km312_digital.net : $(SRCDIR)km312_D_analogue_1.sch $(SRCDIR)km312_D_input_sound.sch
	$(NETLIST_PROG) -g PCB -o $(DESTDIR)km312_digital_temp.net $(SRCDIR)km312_D_analogue_1.sch $(SRCDIR)km312_D_input_sound.sch
	sed -r --file=$(SRCDIR)net_pcb_fix.reg $(DESTDIR)km312_digital_temp.net | sed -r --file=$(SRCDIR)net_pcb_fix_2.reg > $(DESTDIR)km312_digital_temp_2.net
ifeq ($(SRCDIR),)
	./pcb_doublons_fix.sh $(DESTDIR)km312_digital_temp_2.net $(DESTDIR)km312_digital.net
else
	$(SRCDIR)pcb_doublons_fix.sh $(DESTDIR)km312_digital_temp.net $(DESTDIR)km312_digital.net
endif
#	rm -f $(DESTDIR)km312_digital_temp_2.net
#	rm -f $(DESTDIR)km312_digital_temp.net


$(DESTDIR)sch_build_date	: $(SRCDIR)km312_D_analogue_1.sch  
	$(EXPORT_PROG) export -o $(DESTDIR)km312_analog_1.ps $(SRCDIR)km312_D_analogue_1.sch
	$(EXPORT_PROG) export -o $(DESTDIR)km312_analog_1.pdf $(SRCDIR)km312_D_analogue_1.sch
	$(EXPORT_PROG) export -o $(DESTDIR)km312_input_sound.ps $(SRCDIR)km312_D_input_sound.sch
	$(EXPORT_PROG) export -o $(DESTDIR)km312_input_sound.pdf $(SRCDIR)km312_D_input_sound.sch
#	$(EXPORT_PROG) export -o $(DESTDIR)km312_feedback.ps $(SRCDIR)km312_feedback.sch
#	$(EXPORT_PROG) export -o $(DESTDIR)km312_feedback.pdf $(SRCDIR)km312_feedback.sch

clean	:
	rm -f $(DESTDIR)km312_digital.partslist_by_refdes.txt $(DESTDIR)km312_digital.partslist_by_value.txt
	rm -f $(BUILDDIR)AMP_OP.cir $(BUILDDIR)AMP_OP_FAST.cir
	rm -f $(DESTDIR)km312_digital.net $(BUILDDIR)convert_test.cir
	rm -f $(DESTDIR)*.ps $(DESTDIR)*.pdf
