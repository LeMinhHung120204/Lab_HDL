module c1_2(
	 input clk,    
    input enable,  
    input clear,   
    output reg [3:0] Q  
);
	always @(posedge clk or negedge clear) begin
        if (!clear) Q <= 4'b0000;  
        else if (enable) Q <= Q + 1'b1;
    end
endmodule