//-------------------------------------------------------------------------------------------------
//
//-------------------------------------------------------------------------------------------------

module clock
(
	input  wire clock50, // 50.000 MHz
	output wire clock70  //  7,095 MHz (deber�a ser 7.0938 MHz)
);

PLL_BASE #
(
	.BANDWIDTH          ("OPTIMIZED"),
	.CLK_FEEDBACK       ("CLKFBOUT" ),
	.COMPENSATION       ("SYSTEM_SYNCHRONOUS"),
	.DIVCLK_DIVIDE      ( 2    ),
	.CLKFBOUT_MULT      (21    ),
	.CLKFBOUT_PHASE     ( 0.000),
	.CLKOUT0_DIVIDE     (74    ),
	.CLKOUT0_PHASE      ( 0.000),
	.CLKOUT0_DUTY_CYCLE ( 0.500),
	.CLKIN_PERIOD       (20.000),
	.REF_JITTER         ( 0.010)
)
Uclock
(
	.RST                (1'b0),
	.CLKFBIN            (cfb),
	.CLKFBOUT           (cfb),
	.CLKIN              (c50),
	.CLKOUT0            (c70),
	.CLKOUT1            (),
	.CLKOUT2            (),
	.CLKOUT3            (),
	.CLKOUT4            (),
	.CLKOUT5            (),
	.LOCKED             ()
);
IBUFG Uibufg
(
	.I(clock50),
	.O(c50)
);
BUFG Ubufg70
(
	.I(c70),
	.O(clock70)
);

endmodule
