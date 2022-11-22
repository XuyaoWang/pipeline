`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:57:16 04/23/2016
// Design Name:   pipeline_cpu
// Module Name:   F:/new_lab/8_pipeline_cpu/tb.v
// Project Name:  pipeline_cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipeline_cpu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

    // Inputs
    reg clk;
    reg resetn;
    reg [4:0] rf_addr;
    reg [31:0] mem_addr;

    // Outputs
    wire [31:0] rf_data;
    wire [31:0] mem_data;
    wire [31:0] IF_pc;
    wire [31:0] IF_inst;
    wire [31:0] ID_pc;
    wire [31:0] EXE_pc;
    wire [31:0] MEM_pc;
    wire [31:0] WB_pc;
    wire [31:0] cpu_5_valid;
    
    wire [31:0] cpu_5_over;
    wire [31:0] cpu_5_allow_in;
    
    wire [31:0] inst;
    wire [31:0] inst_addr;
    wire next_fetch;
    
    wire [31:0] rs_value;
    wire [ 4:0] rs;
    wire [31:0] rt_value;
    wire [ 4:0] rt;
    
    wire [ 31:0] alu_result;
    
    wire [ 32:0] jbr_bus;
    
    wire [ 63:0] IF_ID_bus;   // IF->ID级总线
    wire [ 63:0] IF_ID_bus_r;
    
    wire [166:0] ID_EXE_bus;  // ID->EXE级总线
    wire [166:0] ID_EXE_bus_r;
    
    wire [153:0] EXE_MEM_bus; // EXE->MEM级总线
    wire [153:0] EXE_MEM_bus_r;
    
    wire [117:0] MEM_WB_bus;  // MEM->WB级总线
    wire [117:0] MEM_WB_bus_r;

    
    // Instantiate the Unit Under Test (UUT)
    pipeline_cpu uut (
        .clk(clk), 
        .resetn(resetn), 
        .rf_addr(rf_addr), 
        .mem_addr(mem_addr), 
        .rf_data(rf_data), 
        .mem_data(mem_data), 
        .IF_pc(IF_pc), 
        .IF_inst(IF_inst), 
        .ID_pc(ID_pc), 
        .EXE_pc(EXE_pc), 
        .MEM_pc(MEM_pc), 
        .WB_pc(WB_pc), 
        .cpu_5_valid(cpu_5_valid),
        
        .cpu_5_over_(cpu_5_over),
        .cpu_5_allow_in_(cpu_5_allow_in),
        
        .inst_(inst),
        .inst_addr_(inst_addr),
        .next_fetch_(next_fetch),
        
        .rs_value_(rs_value),
        .rs_(rs),
        .rt_value_(rt_value),
        .rt_(rt),
        
        .alu_result_(alu_result),
        
        .jbr_bus_(jbr_bus),
        
        .IF_ID_bus_(IF_ID_bus),
        .IF_ID_bus_r_(IF_ID_bus_r),
        .ID_EXE_bus_(ID_EXE_bus),
        .ID_EXE_bus_r_(ID_EXE_bus_r),
        .EXE_MEM_bus_(EXE_MEM_bus),
        .EXE_MEM_bus_r_(EXE_MEM_bus_r),
        .MEM_WB_bus_(MEM_WB_bus),
        .MEM_WB_bus_r_(MEM_WB_bus_r)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        resetn = 0;
        rf_addr = 2;
        mem_addr = 4;

        // Wait 100 ns for global reset to finish
        #100;
      resetn = 1;
        // Add stimulus here
    end
   always #5 clk=~clk;
endmodule

