`timescale 1ns / 1ps
module ks_tb;

  
    reg clk;
    reg rst;

    
    wire [9:0] lights;

    
    ks_tl dut (
        .clk(clk),
        .rst(rst),
        .lights(lights)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
     
        rst = 1;
        #100;         
        rst = 0;

        
        #2000000;

        $finish;
    end


    initial begin
        $monitor("Time = %0dns | M1 = %b | M2 = %b | S = %b | MT = %b",
                 $time,
                 lights[9:7],   // M1
                 lights[6:4],   // M2
                 lights[3:1],   // S
                 lights[0]);    // MT (Green only)
    end

endmodule