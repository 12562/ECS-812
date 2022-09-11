# Triple Port RAM implementation

## Introduction
Triple port RAM was written in verilog and, synthesized and implemented on Xilinx Spartan 3E FPGA kit as part of [ECS-812 Major Project](https://www.jmi.ac.in/upload/menuupload/dece_btech_cbcs.pdf)
at [Jamia Millia Islamia University](https://www.jmi.ac.in/).

## Presentations/Documentation explaining the implementation
[Triple Port RAM Documentation](https://github.com/12562/Triple_port_RAM/blob/main/doc/Triple_Port_RAM.doc)
[Triple Port RAM Presentation](https://github.com/12562/Triple_port_RAM/blob/main/Triple%20port%20RAM.pdf)

## Files Hierarchy
```
   - arbiter_tb.v                           :   Contains testbench for top-level arbitration module.
     - arbiter.v                            :   Contains arbitration logic and instantiation of the RAM cell array of size N by wordsize.
       - RAM_CELL_MATRIX_N_by_wordsize.v    :   RAM cell matrix is an array of the RAM cell.
         - Nto2powerN_decoder.v             :   Decoding logic for memory address selection.
         - RAM_cell.v                       :   A unit memory RAM cell.
       - up_counter_2_bit_bl.v              :   Two bit up-counter to aid with write arbitration.
       
   - RAM_CELL_MATRIX_N_by_wordsize_tb.v     :   Testbench for testing READ and WRITE of memory array.
     - RAM_CELL_MATRIX_N_by_wordsize.v
       - Nto2powerN_decoder.v
       - RAM_cell.v
```

## References

   - [Niar, Smail & Eeckhout, Lieven & De Bosschere, Koen. (2003). Comparing Multiported Cache Schemes.. 3. 1179-1185.](https://github.com/12562/Triple_port_RAM/blob/main/doc/Multi%20port%20RAM/multi_port_cache.pdf)
   - [Multi Port SRAM Overview](https://github.com/12562/Triple_port_RAM/blob/main/doc/Multi%20port%20RAM/idt_first_manyport.ppt)
   - [Dual Port Memory](https://github.com/12562/Triple_port_RAM/blob/main/doc/Multi%20port%20RAM/DUAL-PORT%20MEMORY.pdf)
