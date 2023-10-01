NETLIST_PROG?=gnetlist
EXPORT_PROG?=gaf
SRCDIR?=
BUILDDIR?=
DESTDIR?=


all			: $(DESTDIR)km312_nt.partslist_by_refdes.txt $(DESTDIR)km312_nt.partslist_by_value.txt $(DESTDIR)km312_nt.net  $(DESTDIR)sch_build_date $(BUILDDIR)convert_test.cir

lists		: $(DESTDIR)km312_nt.partslist_by_refdes.txt $(DESTDIR)km312_nt.partslist_by_value.txt

spice		: $(BUILDDIR)convert_test.cir 

pcb		: $(DESTDIR)km312_nt.net

schemas		: $(DESTDIR)sch_build_date

$(DESTDIR)km312_nt.partslist_by_refdes.txt : $(SRCDIR)pulses_gene_analog.sch $(SRCDIR)pulses_gene_numeric.sch $(SRCDIR)pulses_gene_power.sch $(SRCDIR)km312_analog.sch
	$(NETLIST_PROG) -g partslist1 -o $(DESTDIR)km312_nt.partslist_by_refdes.txt $(SRCDIR)pulses_gene_analog.sch $(SRCDIR)pulses_gene_numeric.sch $(SRCDIR)pulses_gene_power.sch $(SRCDIR)km312_analog.sch

$(DESTDIR)km312_nt.partslist_by_value.txt : $(SRCDIR)pulses_gene_analog.sch $(SRCDIR)pulses_gene_numeric.sch $(SRCDIR)pulses_gene_power.sch $(SRCDIR)km312_analog.sch
	$(NETLIST_PROG) -g partslist3 -o $(DESTDIR)km312_nt.partslist_by_value.txt $(SRCDIR)pulses_gene_analog.sch $(SRCDIR)pulses_gene_numeric.sch $(SRCDIR)pulses_gene_power.sch $(SRCDIR)km312_analog.sch


$(BUILDDIR)AMP_OP.cir	:	$(SRCDIR)AMP_OP.sch
	$(NETLIST_PROG) -g spice-sdb -o $(BUILDDIR)AMP_OP.cir $(SRCDIR)AMP_OP.sch

$(BUILDDIR)AMP_OP_FAST.cir	:	$(SRCDIR)AMP_OP_FAST.sch
	$(NETLIST_PROG) -g spice-sdb -o $(BUILDDIR)AMP_OP_FAST.cir $(SRCDIR)AMP_OP_FAST.sch

$(BUILDDIR)convert_test.cir	:	$(SRCDIR)convert_test.sch $(SRCDIR)transfo.sch $(SRCDIR)km312_analog.sch $(SRCDIR)AMP_OP.cir $(SRCDIR)AMP_OP_FAST.cir
	$(NETLIST_PROG) -g spice-sdb -o $(BUILDDIR)transfo.cir $(SRCDIR)transfo.sch
	$(NETLIST_PROG) -g spice-sdb -o $(BUILDDIR)convert_test.cir $(SRCDIR)convert_test.sch $(SRCDIR)km312_analog.sch

$(DESTDIR)km312_nt.net : $(SRCDIR)pulses_gene_analog.sch $(SRCDIR)pulses_gene_numeric.sch $(SRCDIR)pulses_gene_power.sch $(SRCDIR)km312_analog.sch
	$(NETLIST_PROG) -g PCB -o $(DESTDIR)km312_nt_temp.net $(SRCDIR)pulses_gene_analog.sch $(SRCDIR)pulses_gene_numeric.sch $(SRCDIR)pulses_gene_power.sch $(SRCDIR)km312_analog.sch
	sed -r --file=$(SRCDIR)net_pcb_fix.reg $(DESTDIR)km312_nt_temp.net > $(DESTDIR)km312_nt_temp_2.net
ifeq ($(SRCDIR),)
	./pcb_doublons_fix.sh $(DESTDIR)km312_nt_temp_2.net $(DESTDIR)km312_nt.net
else
	$(SRCDIR)pcb_doublons_fix.sh $(DESTDIR)km312_nt_temp.net $(DESTDIR)km312_nt.net
endif
	rm -f $(DESTDIR)km312_nt_temp_2.net
	rm -f $(DESTDIR)km312_nt_temp.net


$(DESTDIR)sch_build_date	: $(SRCDIR)km312_analog.sch $(SRCDIR)AMP_OP.sch $(SRCDIR)AMP_OP_FAST.sch 
	$(EXPORT_PROG) export -o $(DESTDIR)km312_analog.ps $(SRCDIR)km312_analog.sch
	$(EXPORT_PROG) export -o $(DESTDIR)km312_analog.pdf $(SRCDIR)km312_analog.sch


clean	:
	rm -f $(DESTDIR)km312_nt.partslist_by_refdes.txt $(DESTDIR)km312_nt.partslist_by_value.txt
	rm -f $(BUILDDIR)AMP_OP.cir $(BUILDDIR)AMP_OP_FAST.cir
	rm -f $(DESTDIR)km312_nt.net $(BUILDDIR)convert_test.cir
	rm -f $(DESTDIR)*.ps $(DESTDIR)*.pdf
