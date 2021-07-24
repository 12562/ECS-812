module Nto2powerN_decoder#(parameter N = 16,                // Number of words
                                     no_addr_lines = 4)     // Number of address lines
                          (log2N_bit_addr,                  // log2N bit address
                           word_select_lines);              // Select lines for accessing a word 
                               
       input  [no_addr_lines-1:0]  log2N_bit_addr;
       output [N-1:0] word_select_lines;
       reg    [N-1:0] word_select_lines = 0;
            
       always@(log2N_bit_addr)
         begin
           word_select_lines = 1;
           word_select_lines = word_select_lines<<(log2N_bit_addr);  
         end                            
                                 
endmodule