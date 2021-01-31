module SQRL_top
#(
    freq_bits=27,
    num_LEDs=4,
    num_IOs=12 // first 8 are 3.3V CMOS, last 4 are 2.5V LVDS that may need buffer
)
(
    input wire CLK_P,
    input wire CLK_N,

    output reg LED [0:num_LEDs-1],
    output reg IO [0:num_IOs-1]
);

    wire CLK;

    IBUFDS #(.DQS_BIAS("FALSE")) clk200
    (
        .I(CLK_P),
        .IB(CLK_N),

        .O(CLK)
    );

    reg [freq_bits-1:0] counter;
    
    always_ff @(posedge CLK)
    begin
        counter<=counter+1'b1;
    end
    
    genvar p;
    
    generate
        for(p=0; p<num_IOs; p=p+1)
        begin:pins
            if(p<num_LEDs)
            begin
                always_ff @(posedge CLK)
                begin
                    LED[p]<=counter[freq_bits-(p+1)];
                end
            end
            always_ff @(posedge CLK)
            begin
                IO[p]<=counter[p+3];
            end
        end
    endgenerate
endmodule
