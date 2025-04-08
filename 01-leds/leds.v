//------------------------------------------------------------------
//-- Hello world example
//-- Turn on all the leds
//-- This example has been tested on the following boards:
//--   * Lattice icestick
//--   * Icezum alhambra (https://github.com/FPGAwars/icezum)
//------------------------------------------------------------------

module leds(output wire LED0,
            output wire LED1,
            output wire LED2,
            output wire LED3,
            input wire BOTON0,
            input wire BOTON1,
            input wire BOTON2,
            input wire BOTON3);

assign LED0 = ~BOTON0;
assign LED1 = ~BOTON1;
assign LED2 = ~BOTON2;
assign LED3 = BOTON3;

endmodule
