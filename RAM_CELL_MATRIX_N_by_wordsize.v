module RAM_CELL_MATRIX_N_by_wordsize #(parameter N = 16,              // N => Number of words
                                                 no_addr_lines = 4,   // no_addr_lines => Number of address lines
                                                 wordsize = 8)        // wordsize => Number of bits in a word
       // You cannot write defparam here, it gives an error, write defparam after instantiating                               
                                      (L_address,
                                       R_address,
                                       M_address,
                                       Left_Write,
                                       Right_Write,
                                       Middle_Write,
                                       L_Data_Bit_Line,
                                       R_Data_Bit_Line,
                                       M_Data_Bit_Line,
                                       L_Data_Bit_Line_read,
                                       R_Data_Bit_Line_read,
                                       M_Data_Bit_Line_read);         
       
       // Inputs and outputs for RAM_CELL_MATRIX_N_by_wordsize to the arbiter
       input  [no_addr_lines-1:0] L_address;
       input  [no_addr_lines-1:0] R_address;
       input  [no_addr_lines-1:0] M_address;
       input                      Left_Write;
       input                      Right_Write;
       input                      Middle_Write;
       input  [wordsize-1:0]      L_Data_Bit_Line;
       input  [wordsize-1:0]      M_Data_Bit_Line;
       input  [wordsize-1:0]      R_Data_Bit_Line;
       
       output [wordsize-1:0]      L_Data_Bit_Line_read;
       output [wordsize-1:0]      R_Data_Bit_Line_read;
       output [wordsize-1:0]      M_Data_Bit_Line_read;               
                      
       // Registers and wires required to interface with Nto2powerN_decoder               
       wire   [N-1:0]             select_L;
       wire   [N-1:0]             select_M;
       wire   [N-1:0]             select_R;
       
       // Varibles for generate
       genvar i;
       genvar j;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
       // Left, Right and Left decoders instantiated      
       Nto2powerN_decoder #(.N(N),                                      // Number of words
                            .no_addr_lines(no_addr_lines))                           // Number of address lines
                          L_decoder(.log2N_bit_addr(L_address),                  // log2N bit address
                                     .word_select_lines(select_L));               // Select lines for accessing a word
  
       Nto2powerN_decoder #(.N(N),                                      // Number of words
                            .no_addr_lines(no_addr_lines))                           // Number of address lines
                          R_decoder(.log2N_bit_addr(R_address),                  // log2N bit address
                                    .word_select_lines(select_R));               // Select lines for accessing a word
       
       Nto2powerN_decoder #(.N(N),                                      // Number of words
                            .no_addr_lines(no_addr_lines))                           // Number of address lines
                          M_decoder(.log2N_bit_addr(M_address),                  // log2N bit address
                                    .word_select_lines(select_M));               // Select lines for accessing a word


       defparam L_decoder .N = N;
       defparam M_decoder .N = N;
       defparam R_decoder .N = N;
       
       defparam L_decoder .no_addr_lines = no_addr_lines;
       defparam M_decoder .no_addr_lines = no_addr_lines;
       defparam R_decoder .no_addr_lines = no_addr_lines;
     
       generate 
       for(i=0;i<N;i=i+1)
         begin:word
         
         for(j=0;j<wordsize;j=j+1)
           begin:bit
             RAM_cell insti(.LS(select_L[i]),                         // Left Select
                            .LW(Left_Write),                          // Left Write enable  
                            .LDBL(L_Data_Bit_Line[j]),                // Left Data Bit Line
                            .LDBL_read(L_Data_Bit_Line_read[j]),      // Left Data Bit line for reading
                            .RS(select_R[i]),                         // Right Select
                            .RW(Right_Write),                         // Right Write enable  
                            .RDBL(R_Data_Bit_Line[j]),                // Right Data Bit Line
                            .RDBL_read(R_Data_Bit_Line_read[j]),      // Right Data Bit line for reading
                            .MS(select_M[i]),                         // Middle Select
                            .MW(Middle_Write),                        // Middle Write enable
                            .MDBL(M_Data_Bit_Line[j]),                // Middle Data Bit Line
                            .MDBL_read(M_Data_Bit_Line_read[j]));     // Middle Data Bit line for reading
           end
         
         end
       endgenerate
endmodule                                         