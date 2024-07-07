
module HA(a,b,sum,cout);

    input a,b;
    output sum,cout;

    assign sum = a^b;
    assign cout = a&b;

endmodule


module FA(a,b,cin,sum,cout);

    input a,b,cin;
    output sum,cout;
    wire t1,c1,c2;
    HA h1(a,b,t1,c1);
    HA h2(cin,t1,sum,c2);

    assign cout = c1 | c2;

endmodule

module RCA_4bit(a,b,sum,cout);
    input [3:0] a,b;
    output [3:0] sum;
    output cout;

    wire [2:0] carry_chain;
    
    HA h1 (a[0],b[0],sum[0],carry_chain[0]);

    FA fa1(a[1],b[1],carry_chain[0],sum[1],carry_chain[1]);

    FA fa2(a[2], b[2],carry_chain[1],sum[2],carry_chain[2]);

    FA fa3(a[3], b[3],carry_chain[2],sum[3],cout);
endmodule
module vedic_mul_2bit (a,b,c);

    input [1:0]a,b;
    output [3:0]c;
    wire t1,t2,t3,c1;

    assign t1 = a[1]&b[0];
    assign t2 = a[0]&b[1];
    assign t3 = a[1]&b[1];

    assign c[0] = a[0]&b[0];

    HA h45(t1,t2,c[1],c1);
    HA h44(c1,t3,c[2],c[3]);

endmodule

module vedic_mul_4bit(a, b, c);

    input [3:0] a, b;
    output [7:0] c;
    wire [3:0] s1, s2, s3, s4, s5, s8;
    wire [4:0] s6, s7;
    wire t1;

    vedic_mul_2bit m1(a[1:0], b[1:0],1); 
    vedic_mul_2bit m2(a[3:2], b[1:0], s2);
    vedic_mul_2bit m3(a[1:0], b[3:2], s3);
    vedic_mul_2bit m4(a[3:2], b[3:2], s4);

    assign c[1:0] = s1[1:0];

    assign s5 = {2'b00, s1[3:2]};

    RCA_4bit a1(s2, s3, s6[3:0], s6[4]);
    RCA_4bit a2(s5, s6[3:0], s7[3:0], s7[4]);
    assign c[3:2] = s7[1:0];
    assign s8 = {s6[4], 1'b0, s7[3:2]};
    RCA_4bit a3(s4, s8, c[7:4], t1);

endmodule


