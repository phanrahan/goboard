module pll(input clkin, output clkout);

SB_PLL40_CORE #(.FEEDBACK_PATH("SIMPLE"),
.DIVF(7'b0111111),
.FILTER_RANGE(3'b001),
.DIVQ(3'b011),
.DIVR(4'b0000)) inst0 (.REFERENCECLK(clkin), .RESETB(1'b1), .BYPASS(1'b0), .PLLOUTCORE(clkout));
endmodule
