`timescale 1ns / 1ps

module trafficlight_tb;

reg clk;
reg reset;
wire [2:0] nslight;
wire [2:0] ewlight;

// Instantiate the DUT
trafficlight dut (
    .clk(clk),
    .reset(reset),
    .nslight(nslight),
    .ewlight(ewlight)
);

// Clock generation: 10 time units per cycle
initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10 ns clock period
end

// Simulation control
initial begin
    $dumpfile("traffic_light.vcd");
    $dumpvars(0, trafficlight_tb);
    $dumpvars(0, dut);  // Dump DUT internal signals too

    reset = 1;
    #10 reset = 0;

    #300; // Run for 300 time units
    $finish;
end

endmodule
