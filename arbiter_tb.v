module arbiter_tb;
       
       parameter N = 4;
       parameter no_addr_lines = 2;
       parameter wordsize = 2;
       
       reg [no_addr_lines-1:0] L_port_addr;
       reg [no_addr_lines-1:0] R_port_addr;
       reg [no_addr_lines-1:0] M_port_addr;
       
       reg       L_write_enable;
       reg       R_write_enable;
       reg       M_write_enable;
       
       reg [wordsize-1:0] L_data;
       reg [wordsize-1:0] M_data;
       reg [wordsize-1:0] R_data;
       
       reg clk;
       reg rst;
       
       wire [wordsize-1:0] L_data_read;
       wire [wordsize-1:0] M_data_read;
       wire [wordsize-1:0] R_data_read;
       
       arbiter #(.N(N),
                 .no_addr_lines(no_addr_lines),
                 .wordsize(wordsize))
               arb_test(.clk(clk),
                        .rst(rst),
                        .L_port_addr(L_port_addr),                       // Address left port device wants to access
                        .R_port_addr(R_port_addr),                       // Address right port device wants to access
                        .M_port_addr(M_port_addr),                       // Address middle port device wants to access
                                                                              
                        .L_write_enable(L_write_enable),                 // Left side write enable signal
                        .R_write_enable(R_write_enable),                 // Right side write enable signal
                        .M_write_enable(M_write_enable),                 // Middle side write enable signal
                      
                        .L_data(L_data),                                 // Data to be written by left device
                        .R_data(R_data),                                 // Data to be written by right device
                        .M_data(M_data),                                 // Data to be written by middle device
                  
                        .L_data_read(L_data_read),                       // Data read from middle data line
                        .R_data_read(R_data_read),                       // Data read from right data line
                        .M_data_read(M_data_read));
             
       always #20 clk = ~clk;      
                  
       initial
         begin
             //  L_port_addr = 2'b00; R_port_addr = 2'b01;
                rst = 1;clk = 0;
            #20 rst =0;
            #20 rst = 1;
            #20 M_port_addr = 2'b10;
                L_write_enable = 1;  R_write_enable = 1;  M_write_enable = 1;
                L_data = 2'b01;      R_data = 2'b10;      M_data = 2'b11;
                L_port_addr = 2'b10; R_port_addr = 2'b10;
            #200 M_write_enable = 0;
         end
         
       endmodule