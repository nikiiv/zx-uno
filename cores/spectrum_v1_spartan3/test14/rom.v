`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:12:52 02/09/2014 
// Design Name: 
// Module Name:    rom 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module rom (
    input wire clk,
    input wire [13:0] a,
    input wire we,
    input wire [7:0] din,
    output reg [7:0] dout
    );

   reg [7:0] mem[0:63];
   integer i;
   initial begin  // usa $readmemb/$readmemh dependiendo del formato del fichero que contenga la ROM
      for (i=0;i<64;i=i+1) begin
        mem[i] = 8'h00;
      end
      $readmemh ("bootloader_hex.txt", mem, 0);
      //$readmemb ("rom_48k_bin.txt", mem, 0);
		//$readmemh ("testcontenida_hex.txt", mem, 0);
   end
   
   always @(posedge clk) begin
     if (we)
        mem[a[5:0]] <= din;
     dout <= mem[a[5:0]];
   end
endmodule
