//-------------------------------------------------------------------
//-- leds_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Juan Gonzalez (Obijuan)
//-- Jesus Arroyo Torrens
//-- GPL license
//-------------------------------------------------------------------
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module leds_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

//-- Leds port
wire l0, l1, l2, l3;
reg BTN0, BTN1, BTN2, BTN3;

//-- Instantiate the unit to test
leds UUT (
           .LED0(l0),
           .LED1(l1),
           .LED2(l2),
           .LED3(l3),
           .BOTON0(BTN0),
           .BOTON1(BTN1),
           .BOTON2(BTN2),
           .BOTON3(BTN3)
         );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, leds_tb);

  // Inicialmente sin presionar botones
    BTN0 = 1; BTN1 = 1; BTN2 = 1; BTN3 = 1;
    #10;

    // Simular pulsaciones de los botones
    BTN0 = 0; #10;
    BTN0 = 1; #10;

    BTN1 = 0; #10;
    BTN1 = 1; #10;

    BTN2 = 0; #10;
    BTN2 = 1; #10;

    BTN3 = 0; #10;
    BTN3 = 1; #10;

    #10;

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
