module fourbitcounter(
input CLOCK,
input [3:0] BUTTONS,
output reg [3:0] LEDS
);
always @ (posedge CLOCK) begin
if(BUTTONS[2])//reset
LEDS=4'b0000;
else if(BUTTONS[0]) //count forward
LEDS=LEDS+1;
else if (BUTTONS[1]) //count backward
LEDS=LEDS-1;
end
endmodule
