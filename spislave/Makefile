DEVICE = 1k
PACKAGE = vq100

#VERILOGS = top.v spi.v pll.v 
VERILOGS = top.v spi.v 
PCF = top.pcf

QUIET = -q


all: top.bin

%.blif: $(VERILOGS)
	yosys $(QUIET) -p 'synth_ice40 -top main -blif $@' $(VERILOGS)

%.txt: %.blif
	arachne-pnr $(QUIET) -d $(DEVICE) -P $(PACKAGE) -o $@ -p $(PCF) $< 

%.bin: %.txt
	icepack $< $@


upload: top.bin
	iceprog $<

explain: top.txt
	icebox_explain $<

clean:
	rm -f *.bin *.txt *.blif 


.PRECIOUS: %.bin %.txt %.blif 

.PHONY: all explain install clean
