
`timescale 1ns/1ps

module tb_alu();

reg [7:0] A, B;
reg [2:0] Sel;

wire [7:0] Result;
wire CarryOut, Zero;

alu uut (
    .A(A),
    .B(B),
    .Sel(Sel),
    .Result(Result),
    .CarryOut(CarryOut),
    .Zero(Zero)
);

initial begin

    $dumpfile("alu.vcd");
    $dumpvars(0, tb_alu);

    // Test 1: Addition
    A = 8'd15;
    B = 8'd10;
    Sel = 3'b000;
    #10;
    $display("Addition: Result=%d Carry=%b Zero=%b",
             Result, CarryOut, Zero);

    // Test 2: Subtraction
    A = 8'd20;
    B = 8'd5;
    Sel = 3'b001;
    #10;
    $display("Subtraction: Result=%d Carry=%b Zero=%b",
             Result, CarryOut, Zero);

    // Test 3: AND
    A = 8'b11001100;
    B = 8'b10101010;
    Sel = 3'b010;
    #10;
    $display("AND: Result=%b Zero=%b", Result, Zero);

    // Test 4: OR
    A = 8'b11001100;
    B = 8'b10101010;
    Sel = 3'b011;
    #10;
    $display("OR: Result=%b Zero=%b", Result, Zero);

    // Test 5: XOR
    A = 8'b11001100;
    B = 8'b10101010;
    Sel = 3'b100;
    #10;
    $display("XOR: Result=%b Zero=%b", Result, Zero);

    // Test 6: Zero check
    A = 8'd0;
    B = 8'd0;
    Sel = 3'b000;
    #10;
    $display("Zero Check: Result=%d Zero=%b",
             Result, Zero);

    $finish;

end

endmodule
