module up_counter_2_bit_bl(condition,
                           count,   //Output for the counter
                           clk,     //Clock
                           rst);   //Reset input
       
       output [1:0]  count;
       reg    [1:0]  count;
//       reg           increment = 0;
       
       input  [1:0]  condition;
       input         rst;
       input         clk;

//       always@(posedge condition[0] or posedge condition[1] or posedge clk)
//         if(condition && !count)
//           increment <= 1;
//         else
//           increment <= 0;

       always@(posedge clk, negedge rst)
         if(~rst)                   
           count <= 0;
         else   
           begin
             if(condition)        
               count <= count + 1;
             else
               count <= 0; 
           end 
           
endmodule

