`timescale 1ns / 1ps

module ks_tl (
    input wire clk,         
    input wire rst,        
    output reg [9:0] lights
);


    localparam S1 = 3'd0, S2 = 3'd1, S3 = 3'd2,
               S4 = 3'd3, S5 = 3'd4, S6 = 3'd5;

   
    localparam sec7 = 700000000, sec5 = 500000000, sec3 = 300000000, sec2 = 200000000;

    reg [2:0] ps;
    reg [31:0] count;

   
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ps <= S1;
            count <= 0;
        end else begin
            case (ps)
                S1: if (count < sec7) count <= count + 1; else begin ps <= S2; count <= 0; end
                S2: if (count < sec2) count <= count + 1; else begin ps <= S3; count <= 0; end
                S3: if (count < sec5) count <= count + 1; else begin ps <= S4; count <= 0; end
                S4: if (count < sec2) count <= count + 1; else begin ps <= S5; count <= 0; end
                S5: if (count < sec3) count <= count + 1; else begin ps <= S6; count <= 0; end
                S6: if (count < sec2) count <= count + 1; else begin ps <= S1; count <= 0; end
                default: begin ps <= S1; count <= 0; end
            endcase
        end
    end

   
    always @(*) begin
        case (ps)
            S1: lights = {3'b001, 3'b001, 3'b100, 1'b1}; // M1 & M2 Green, S & MT Red/Green
            S2: lights = {3'b001, 3'b010, 3'b100, 1'b1}; // M2 Yellow
            S3: lights = {3'b001, 3'b100, 3'b100, 1'b0}; // MT Green
            S4: lights = {3'b010, 3'b100, 3'b100, 1'b0}; // M1 Yellow
            S5: lights = {3'b100, 3'b100, 3'b001, 1'b0}; // S Green
            S6: lights = {3'b100, 3'b100, 3'b010, 1'b0}; // S Yellow
            default: lights = 10'b0;
        endcase
    end

endmodule
