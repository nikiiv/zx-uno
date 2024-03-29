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
    output reg [7:0] dout
    );

   reg [7:0] mem[0:16383];
   initial begin  // usa $readmemb/$readmemh dependiendo del formato del fichero que contenga la ROM
      //$readmemh ("rom_cargando_leches_48k_hex.txt", mem, 0);
      $readmemb ("rom_48k_bin.txt", mem, 0);
   end
   
   always @(posedge clk) begin
     dout <= mem[a];
   end
endmodule
