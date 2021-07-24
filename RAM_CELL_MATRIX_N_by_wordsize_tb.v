module RAM_CELL_MATRIX_N_by_wordsize_tb;

       parameter N = 32;
       parameter no_addr_lines = 5;
       parameter wordsize = 16;

       reg  [no_addr_lines-1:0] L_address;
       reg  [no_addr_lines-1:0] R_address;
       reg  [no_addr_lines-1:0] M_address;
       reg                      LW;
       reg                      RW;
       reg                      MW;            
       reg  [wordsize-1:0]      LDBL;
       reg  [wordsize-1:0]      RDBL;
       reg  [wordsize-1:0]      MDBL;
                      
       wire [wordsize-1:0]      LDBL_read;
       wire [wordsize-1:0]      RDBL_read;
       wire [wordsize-1:0]      MDBL_read;
       
       RAM_CELL_MATRIX_N_by_wordsize #(.N(N),                           // N => Number of words
                                       .no_addr_lines(no_addr_lines),   // no_addr_lines => Number of address lines
                                       .wordsize(wordsize))             // wordsize => Number of bits in a word
                                     RCM_test(.L_address(L_address),
                                              .R_address(R_address),
                                              .M_address(M_address),
                                              .Left_Write(LW),
                                              .Right_Write(RW),
                                              .Middle_Write(MW),
                                              .L_Data_Bit_Line(LDBL),
                                              .R_Data_Bit_Line(RDBL),
                                              .M_Data_Bit_Line(MDBL),
                                              .L_Data_Bit_Line_read(LDBL_read),
                                              .R_Data_Bit_Line_read(RDBL_read),
                                              .M_Data_Bit_Line_read(MDBL_read));
                               
       initial
         begin
              // Left, Right and Middle write at the same time at different memory locations
              L_address = 4'b0000; LW = 1; LDBL = 8'b0000_0000;    // Left accesses memory location 0 to write a 0.
              R_address = 4'b0001; RW = 1; RDBL = 8'b0000_1111;    // Right accesses memory location 1 to write a 1.
              M_address = 4'b0010; MW = 1; MDBL = 8'b1111_1111;    // Middle accesses memory location 2 to write a 0.
         end
endmodule