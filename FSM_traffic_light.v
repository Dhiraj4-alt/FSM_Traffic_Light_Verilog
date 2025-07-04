module trafficlight(
    input clk,
    input reset,
    output reg [2:0]nslight,
    output reg [2:0]ewlight
)

//State Encoding
parameter NSgreen=2'b00;
parameter NSyellow=2'b01;
parameter EWgreen=2'b10;
parameter EWyellow=2'b11;

//registers for state transition
reg [1:0]state;
reg [1:0]nextstate;

//timer
integer timer;

//Light signals
parameter RED=3'b100;
parameter YELLOW=3'b010;
parameter GREEN=3'b001;

always @(posedge clk or posedge reset)
    begin
        if(reset)
        begin
            state <= NSgreen;
            timer <=0;
        end
        else
        begin
            if((state==NSgreen||state==EWgreen)&&timer==5)
            begin
                state <= nextstate;
                timer <=0;
            end
        else
        begin
            if((state==NSyellow||state==EWyellow)&&timer==2)
            begin
                state <= nextstate;
                timer <=0;
            end
        
        else
        begin
            timer<=timer+1;
        end
        end
    end
//Next state logic
always @(*)
begin
    case(state)
    NSgreen:nextstate=NSyellow;
    NSyellow:nextstate=EWgreen;
    EWgreen:nextstate=EWyellow;
    EWyellow:nextstate=NSgreen;

    default:
        nextstate=NSgreen;
end
//Output signal assignment

always @(*)begin
case(state)
    NSgreen:
    begin
        nslight=GREEN;
        ewlight=RED;
    end
    NSyellow:
    begin
        nslight=YELLOW;
        ewlight=RED;
    end
    EWgreen:
    begin
        nslight=RED;
        ewlight=GREEN;
    end
    EWyellow:
    begin
        nslight=RED;
        ewlight=YELLOW;
    end
default:
begin
nslight=RED;
ewlight=RED;
end  
endcase 
end 
endmodule


