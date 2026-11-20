module alu(
    input [7:0] A,
    input [7:0] B,
    input [2:0] Sel,
    output reg [7:0] Result,
    output reg CarryOut,
    output Zero
);

reg [8:0] temp;

always @(*) begin
    Result = 0;
    CarryOut = 0;
    temp = 0;

    case (Sel)
        3'b000: begin
            temp = {1'b0,A} + {1'b0,B};
            Result = temp[7:0];
            CarryOut = temp[8];
        end

        3'b001: begin
            Result = A - B;
        end

        3'b010: Result = A & B;
        3'b011: Result = A | B;
        3'b100: Result = A ^ B;

        default: Result = 0;
    endcase
end

assign Zero = (Result == 0);

endmodule
