`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/22 22:22:26
// Design Name: 
// Module Name: predict
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module predict;
// Inputs
    reg clk;
    reg resetn;
    reg [4:0] rf_addr;
    reg [31:0] mem_addr;

    // Outputs
    wire [31:0] rf_data;

    wire [31:0] IF_pc;
    wire [31:0] IF_inst;
    wire [31:0] ID_pc;
    wire [31:0] EXE_pc;
    wire [31:0] MEM_pc;
    wire [31:0] WB_pc;
    wire [31:0] cpu_5_valid;
    
    wire [31:0] cpu_5_over;
    wire [31:0] cpu_5_allow_in;

    wire next_fetch;
    
    wire [ 32:0] jbr_bus;

    wire [ 63:0] IF_ID_bus;
    wire [ 63:0] IF_ID_bus_r;

    wire [166:0] ID_EXE_bus_r;

    wire [153:0] EXE_MEM_bus_r;
    
    wire [117:0] MEM_WB_bus_r;
    
    wire [1:0] state;
    wire [31:0] predict;
    wire [31:0] br;

    // Instantiate the Unit Under Test (UUT)
    pipeline_cpu uut (
        .clk(clk), 
        .resetn(resetn), 
        .rf_addr(rf_addr), 
        .rf_data(rf_data), 
        .IF_pc(IF_pc), 
        .IF_inst(IF_inst), 
        .ID_pc(ID_pc), 
        .EXE_pc(EXE_pc), 
        .MEM_pc(MEM_pc), 
        .WB_pc(WB_pc), 
        
        .cpu_5_valid(cpu_5_valid),
        
        .cpu_5_over_(cpu_5_over),
        .cpu_5_allow_in_(cpu_5_allow_in),
        
        .next_fetch_(next_fetch),
        
        .jbr_bus_(jbr_bus),

        .IF_ID_bus_(IF_ID_bus),
        .IF_ID_bus_r_(IF_ID_bus_r),
        .ID_EXE_bus_r_(ID_EXE_bus_r),
        .EXE_MEM_bus_r_(EXE_MEM_bus_r),
        .MEM_WB_bus_r_(MEM_WB_bus_r),
        
        .state(state),
        .predict(predict),
        .br(br)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        resetn = 0;
        rf_addr = 1;
        #100;
      resetn = 1;
    end
   always #5 clk=~clk;
endmodule