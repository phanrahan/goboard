`define N 16

module main (
    input clk,
    input PMOD0,
    input PMOD1,
    output PMOD2,
    input PMOD3,
    output [6:0] digit1,
    output [6:0] digit2,
);

wire ucSEL_;
wire ucSCLK;
wire ucMOSI;
wire ucMISO;

assign ucSEL_ = PMOD0;
assign ucMOSI = PMOD1;
assign PMOD2 = ucMISO;
assign ucSCLK = PMOD3;

wire [`N-1:0] spiin;
wire [`N-1:0] spiout;

assign spiin = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

SPISlave #(.WIDTH(`N)) spi (
    .clk(clk),
    .ucSCLK(ucSCLK),
    .ucMOSI(ucMOSI),
    .ucMISO(ucMISO),
    .ucSEL_(ucSEL_),
    .data_in(spiin),
    .data_out(spiout)
);

assign digit1 = spiout[6:0];
assign digit2 = spiout[14:8];

endmodule
