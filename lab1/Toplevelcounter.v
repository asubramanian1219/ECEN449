`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 01/21/2020 11:39:04 AM
// Design Name:
// Module Name: toplevelcounter
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module toplevelcounter(
input CLOCK,
input [3:0] BUTTONS,
output [3:0] LEDS
);
reg dividedClock;
reg [25:0] clockcount;
initial begin
dividedClock<=0;
clockcount<=26'b0;
end
//clock divider
always @(posedge CLOCK) begin
if(clockcount==26'b11101110011010110010100000) begin
dividedClock=~dividedClock;
clockcount=26'b0;
end
else
clockcount=clockcount+1;
end
fourbitcounter count0(.CLOCK(dividedClock), //instantiate counter.
.BUTTONS(BUTTONS),
.LEDS(LEDS));
endmodule
