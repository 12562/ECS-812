module RAM_cell(LS,                  // Left Select
                LW,                  // Left Write
                LDBL,                // Left Data Bit Line
                LDBL_read,           // Left Data Bit line for reading
                RS,                  // Right Select
                RW,                  // Right Write
                RDBL,                // Right Data Bit Line
                RDBL_read,           // Right Data Bit line for reading
                MS,                  // Middle Select
                MW,                  // Middle Write
                MDBL,                // Middle Data Bit Line
                MDBL_read);          // Middle Data Bit line for reading
               
               
       /***************************************************************************/        
       // Inputs and outputs for the RAM cell         
       input  LS;
       input  LW;
       input  LDBL;
       output LDBL_read;
       input  RS;
       input  RW;
       input  RDBL;
       output RDBL_read;
       input  MS;
       input  MW;
       input  MDBL;
       output MDBL_read;
       
       // Latch outputs
       wire latch_out;
       wire latch_out_bar;
       
       // Latch inputs
       wire op_L1;
       wire op_L2;
       wire op_R1;
       wire op_R2;
       wire op_M1;
       wire op_M2;
       
       //Reading driver wires
       wire LW_bar;
       wire RW_bar;
       wire MW_bar;
       wire LS_out;
       wire MS_out;
       wire RS_out;
       wire BUFFER_SELECT_L;
       wire BUFFER_SELECT_R;
       wire BUFFER_SELECT_M;
       
       /*******************************************************************************/
       
       // L side write drivers
       nand L1(op_L1, LS, LW, LDBL);
       nand L2(op_L2, LS, LW, op_L1);
       
       // R side write drivers
       nand R1(op_R1, RS, RW, RDBL);
       nand R2(op_R2, RS, RW, op_R1);
       
       // M side write drivers
       nand M1(op_M1, MS, MW, MDBL);
       nand M2(op_M2, MS, MW, op_M1);
       
       //RAM cell latch
       nand lat1(latch_out, op_L1, op_R1, op_M1, latch_out_bar);                    
       nand lat2(latch_out_bar, op_L2, op_R2, op_M2, latch_out);         
            
       //L side read drivers
       not N_L(LW_bar, LW);
       bufif1 prevent_glitch_L(LS_out, LS, 1'b1);
       and A_L(BUFFER_SELECT_L, LW_bar, LS_out);
       bufif1 read_driver_L(LDBL_read, latch_out, BUFFER_SELECT_L);       
           
       //R side read drivers
       not N_R(RW_bar, RW);
       bufif1 prevent_glitch_R(RS_out, RS, 1'b1);
       and A_R(BUFFER_SELECT_R, RW_bar, RS_out);
       bufif1 read_driver_R(RDBL_read, latch_out, BUFFER_SELECT_R); 
       
       //M side read drivers
       not N_M(MW_bar, MW);
       bufif1 prevent_glitch_M(MS_out, MS, 1'b1);
       and A_M(BUFFER_SELECT_M, MW_bar, MS_out);
       bufif1 read_driver_M(MDBL_read, latch_out, BUFFER_SELECT_M); 
              
endmodule