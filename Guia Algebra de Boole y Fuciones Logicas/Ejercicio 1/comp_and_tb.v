`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module comp_and_tb();

parameter DURATION = 10;

reg clk = 0;
always #0.5 clk = ~clk;

reg test_a, test_b;
wire test_x;

comp_and UUT (
    .a(test_a),
    .b(test_b),
    .x(test_x)
);

integer i;
reg [1:0] i_b;

initial begin

    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, comp_and_tb);

    for (i=0; i<4; i=i+1)
    begin
        $display ("Current loop # %0d", i);
        $display ("Current loop # %0b", i);
        
        #1
        i_b = i;
        test_a = i_b[1];
        test_b = i_b[0];
    end

    #(DURATION) $display("End of simulation");
    $finish;
end

endmodule