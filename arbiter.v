module arbiter#(parameter N = 4,
                          no_addr_lines = 2,
                          wordsize = 2)
               (clk,
                rst,
                L_port_addr,                       // Address left port device wants to access
                R_port_addr,                       // Address right port device wants to access
                M_port_addr,                       // Address middle port device wants to access
        
                L_write_enable,                    // Left side write enable signal
                R_write_enable,                    // Right side write enable signal
                M_write_enable,                    // Middle side write enable signal
       
                L_data,                            // Data to be written by left device
                R_data,                            // Data to be written by right device
                M_data,                            // Data to be written by middle device

                L_data_read,                       // Data read from left data line
                M_data_read,                       // Data read from middle data line
                R_data_read);                      // Data read from right data line
                
                         
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       
       /*Signals to be provided to the RAM cell matrix*/
       reg [no_addr_lines-1:0] L_address;
       reg [no_addr_lines-1:0] R_address;
       reg [no_addr_lines-1:0] M_address;
       reg                     LW;
       reg                     MW;
       reg                     RW;
       reg [wordsize-1:0]      LDBL;
       reg [wordsize-1:0]      RDBL;
       reg [wordsize-1:0]      MDBL;
       
       wire [wordsize-1:0]     LDBL_read;
       wire [wordsize-1:0]     MDBL_read;
       wire [wordsize-1:0]     RDBL_read;
               
////////////////////////////////////////////////////////////////////////////////////////////////////////////////       
       
       /*Signals input and output to this TRIPLE PORT RAM*/
       input  [no_addr_lines-1:0] L_port_addr;
       input  [no_addr_lines-1:0] R_port_addr;
       input  [no_addr_lines-1:0] M_port_addr;
        
       input                    L_write_enable;
       input                    R_write_enable;
       input                    M_write_enable;
       
       input  [wordsize-1:0]      L_data;
       input  [wordsize-1:0]      R_data;
       input  [wordsize-1:0]      M_data;

       output [wordsize-1:0]      L_data_read;
       output [wordsize-1:0]      M_data_read;
       output [wordsize-1:0]      R_data_read;
       
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

       // Register and wires required by the arbiter
       
       reg     [1:0]              condition=0;
       wire    [1:0]              count;
       input                     rst;
       input                     clk;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////       
       
       RAM_CELL_MATRIX_N_by_wordsize #(.N(N),                           // N => Number of words
                                       .no_addr_lines(no_addr_lines),   // no_addr_lines => Number of address lines
                                       .wordsize(wordsize))             // wordsize => Number of bits in a word
                                     RCM_test (.L_address(L_address),
                                       .R_address(R_address),
                                       .M_address(M_address),
                                       .Left_Write(LW),
                                       .Right_Write(RW),
                                       .Middle_Write(MW),
                                       .L_Data_Bit_Line(LDBL),
                                       .R_Data_Bit_Line(RDBL),
                                       .M_Data_Bit_Line(MDBL),
                                       .L_Data_Bit_Line_read(L_data_read),
                                       .R_Data_Bit_Line_read(R_data_read),
                                       .M_Data_Bit_Line_read(M_data_read));
                                       
       up_counter_2_bit_bl counter(.condition(condition),
                                   .count(count),
                                   .clk(clk),
                                   .rst(rst));                                
                                       
       always@(L_write_enable, M_write_enable, R_write_enable,
               count, 
               L_port_addr, M_port_addr, R_port_addr) 
              
             begin
/**************************************************************************************************************************************************************/               
               // If the three ports want to write at the same time at same location different data values 
               // then this if statement makes sure that left writes first, then middle and then right
/**************************************************************************************************************************************************************/                  
                   
                   if((L_write_enable && M_write_enable && R_write_enable && 
                         ((L_port_addr == M_port_addr) && (M_port_addr == R_port_addr)) && 
                         ((L_data != M_data) || (M_data != R_data) || (L_data != R_data))) || condition == 1)
                     begin
                       condition <= 1;
                       if(count == 0)                       // Left writes when counter is 1
                         begin
                           LW <= L_write_enable;
                           LDBL <= L_data;
                           L_address <= L_port_addr;
                         end
                       else if(count == 1)                       // Middle writes when counter is 2 
                         begin
                           LW <= 0;
                           MW <= M_write_enable;
                           MDBL <= M_data;
                           M_address <= M_port_addr;
                         end
                       else if(count == 2)                      // Right writes when counter is 
                         begin
                           MW <= 0;
                           RW <= R_write_enable;
                           RDBL <= R_data;
                           R_address <= R_port_addr;
                         end
                       else
                         begin
                           if(count == 3)
                             begin
                               RW <= 0;
                               condition <= 0;
                             end
                           else
                             begin
                               LW <= 0;
                               MW <= 0;
                               RW <= 0;
                             end
                         end
                     end
                     
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                   
                   
/****************************************************************************************************************************************************************/
                   // If the left and right ports want to write at the same time at same location different data values 
                   // then this if statement makes sure that left writes first and then right
/**************************************************************************************************************************************************************/                   
                   else if((L_write_enable && R_write_enable && (L_port_addr == R_port_addr) && (L_data != M_data)) || condition == 2)
                     begin
                       condition <= 2;
                       if(count == 0)
                         begin
                           LW <= L_write_enable;
                           LDBL <= L_data;
                           L_address <= L_port_addr;
                           condition <= 2;
                         end
                       else if(count == 1)
                         begin
                           LW <= 0;
                           RW <= R_write_enable;
                           RDBL <= R_data;
                           R_address <= R_port_addr; 
                         end
                       else
                         begin    
                           if(count == 2)
                             begin
                               RW <= 0;
                               condition <= 0;
                             end
                           else
                             begin
                               LW <= 0;
                               MW <= 0;
                               RW <= 0;
                             end
                         end
                     end  
                 
   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////              
                 
                 else if((M_write_enable && L_write_enable && (L_port_addr == M_port_addr) && (L_data != M_data)) || condition == 3)
                   begin
                     condition <= 3;
                     if(count == 0)
                       begin
                         LW <= L_write_enable;
                         LDBL <= L_data;
                         L_address <= L_port_addr;
                         condition <= 3;
                       end
                     else if(count == 1)
                       begin
                         LW <= 0;
                         MW <= M_write_enable;
                         MDBL <= M_data;
                         M_address <= M_port_addr;
                         condition <= 3;
                       end
                     else      
                       begin
                         if(count == 2)
                           begin
                             MW <= 0;
                             condition <= 0;
                           end
                         else
                           begin
                             LW <= 0;
                             MW <= 0;
                             RW <= 0;
                           end
                       end
                   end
                 
                 else if((R_write_enable && M_write_enable && (R_port_addr == M_port_addr) && (R_data != M_data)) || condition == 4)   
                   begin
                     condition <= 4;
                     if(count == 0)
                       begin
                         MW <= M_write_enable;
                         MDBL <= M_data;
                         M_address <= M_port_addr;
                       end
                     else if(count == 1)
                       begin
                         MW <= 0;
                         RW <= R_write_enable;
                         RDBL <= R_data;
                         R_address <= R_port_addr;
                       end
                     else      
                       begin
                         if(count == 2)
                           begin
                             RW <= 0;
                             condition <= 0;
                           end
                         else
                           begin
                             LW <= 0;
                             MW <= 0;
                             RW <= 0;
                           end
                       end
                   end
                 
                 else     
                   begin
                     LW <= L_write_enable;
                     MW <= M_write_enable;
                     RW <= R_write_enable;
                     
                     LDBL <= L_data;
                     MDBL <= M_data;
                     RDBL <= R_data;
                   
                     L_address <= L_port_addr;
                     M_address <= M_port_addr;
                     R_address <= R_port_addr;
                   end 
             end
endmodule                    
                                                   