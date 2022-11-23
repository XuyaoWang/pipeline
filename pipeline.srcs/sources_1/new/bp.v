`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/23 09:44:00
// Design Name: 
// Module Name: bp
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


module bp(
    input              clk,      
    input              resetn,    
    input              predict_valid, 
    input              predict_update_state,
    input              br_taken,   
    input       [31:0] inst_addr, 
    output      [1:0]  state0,
    output      [1:0]  state1,
     

    output             predict_taken
    );
    
    wire index = inst_addr[4];
    
    reg predict_over;
    reg [1:0] state[1:0];
    always @(posedge clk)
    begin
       if(!resetn)
       begin
            state[0] <= 2'b10;
            state[1] <= 2'b10;
            predict_over <= 1'b0;
       end 
       else if(!predict_update_state)
       begin
            predict_over <= 1'b0; 
       end
       else if(predict_valid && !predict_over)    
       begin
           case(state[index])
                2'b00 : state[index] <= br_taken?2'b00:2'b01;
                2'b01 : state[index] <= br_taken?2'b00:2'b10;
                2'b10 : state[index] <= br_taken?2'b11:2'b10;
                2'b11 : state[index] <= br_taken?2'b00:2'b10;
           endcase                                                                                                                                                                                                                                                                                                  
           predict_over <= 1'b1; 
       end
    end
    
    assign predict_error = !resetn ? 0 : predict_valid ? br_taken ^ predict_taken : 0;
    assign predict_taken = predict_valid ? 0: state[index]==2'b00||state[index]==2'b01;
    
    assign state0 = state[0];
    assign state1 = state[1];
    
endmodule
