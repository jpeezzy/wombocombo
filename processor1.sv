`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2016 08:47:55 PM
// Design Name: 
// Module Name: Processorv1
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2016 08:47:55 PM
// Design Name: 
// Module Name: Processorv1
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


module Processorv1(
    input clkreset,
    input clk
    );
    logic [0:1] Instructiontype;         
    logic [31:0] register[0:63];
    //66469
    logic [5:0] rs;
    logic [5:0] rd;
    logic [3:0] funct;
    logic [5:0] rt;
    logic [8:0] Immid;
    logic [14:0] Immid2;
    logic PC= 0;
    logic temp1 =0;
    logic Address1 =0;
    logic [31:0] ReadData; 
    always @(posedge clk)
    begin
    //PC counting up section
         
        if(clkreset==0)begin
            PC = Address1;
            temp1 = PC;
            PC = temp1+1;
         end
         if(PC==6'b111111)begin
         PC<=0;
         end 
     //instructional Memory
    ReadData[31:0] <= register[Address1][31:0];
    //control unit
    Instructiontype[0] <= ReadData[0];
    rs=ReadData[6:1];
    rd=ReadData[12:7];
    funct=ReadData[16:13];
    if(Instructiontype[0]==0) begin
    rt=ReadData[22:17];
    Immid=ReadData[31:23];
    end
    if (Instructiontype[0]==1)begin
    Immid2=ReadData[31:17];
    end
        
    end

//always_ff @(wa) begin  //  always allows you to use normal c code begin and end are bars to hold the code in. this says if there is a change in wa, start this code ^_^  
  //      if (we1)
    //       register [wa] = wd; // w/o braces, if statements will only read the first line.
      //             //if write enable true assign register to wd
    // register [0] = 0;
      //  end 
      
      
      //   always_ff @(address) begin 
         // if (we)
            //  readdata <= RAM[address];// 
              //<= writedata;
         // else
           //   readdata = RAM[address];
       //   end

endmodule