module jackpot(
input [3:0] SWITCHES,
output [3:0] LEDS,
input CLOCK,
input [3:0] BUTTONS
);
reg dividedClock;
reg [24:0] clockcount;
initial begin
dividedClock<=0;
clockcount<=25'b0000000;
end
//clock divider
always @(posedge CLOCK) begin
if(clockcount==25'b111111101000010010000000) begin
dividedClock=~dividedClock;
clockcount=25'b0000000;
end
else
clockcount=clockcount+1;
end
reg [3:0] count;
initial begin
count=4'b0001;
end
always@(negedge dividedClock or posedge SWITCHES) begin
if((count==4'b1111)&&(BUTTONS[0]==1'b1)) //reset
count<=4'b0001;
else if(count==4'b1111) //lock in the win
count<=4'b1111;
else if((SWITCHES==count)) //register a win
count<=4'b1111;
else if(count==4'b0001) //shift the LEDs
count<=4'b0010;
else if(count==4'b0010)
count<=4'b0100;
else if(count==4'b0100)
count<=4'b1000;
else if(count==4'b1000)
count<=4'b0001;
end
assign LEDS=count;
endmodule
