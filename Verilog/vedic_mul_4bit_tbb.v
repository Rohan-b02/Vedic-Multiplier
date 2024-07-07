
module testbench;

    reg [3:0] a;
    reg [3:0] b;
    wire [7:0] c;

    vedic_mul_4bit dut (a,b,c);

    initial begin
        $dumpfile("vedic_mul_4bit.vcd");
        $dumpvars(0, testbench); 
        
       #10 a = 4'b1011; 
        b = 4'b1110; 
        
        
     #10   a = 4'b1010;
        b = 4'b1100;
        
        
        #10 a = 4'b1101;
        b = 4'b1001;
       
       #10 a = 4'b1101;
        b = 4'b1111;

         #10 a = 4'b1101;
        b = 4'b1111;

         #10 a = 4'b1111;
        b = 4'b1001;

         #10 a = 4'b0101;
        b = 4'b1101;

        #10 a = 4'b1011; 
        b = 4'b1110; 
        
        
     #10   a = 4'b1010;
        b = 4'b1100;
        
        
        #10 a = 4'b1111;
        b = 4'b1101;
       
       #10 a = 4'b1001;
        b = 4'b1011;

         #10 a = 4'b0101;
        b = 4'b0011;

         #10 a = 4'b0111;
        b = 4'b1101;

         #10 a = 4'b1101;
        b = 4'b1101;

        #10 $finish;
    end

endmodule
