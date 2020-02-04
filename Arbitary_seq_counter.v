// design

module seq(clk,rst,count);
  input clk,rst;
  output reg [3:0]count;
  reg [2:0]state;
  
  always@(posedge clk)
    begin
      
      if(rst)begin
      state<=1;
      count<=4'b0000;
      end
      
      else begin
      case(state)
        1:
        begin
          count<=4'b0010;
          state=2;
        end
        2:
        begin
          count<=4'b1001;
          state=3;
        end
        3:
        begin
          count<=4'b0100;
          state=4;
        end
        4:
        begin
          count<=4'b0001;
          state=5;
        end
        5:
        begin
          count<=4'b0110;
          state=6;
        end
        6:
        begin
          count<=4'b0011;
          state=7;
        end
        7:
        begin
          count<=4'b1000;
          state=1;
        end
       
      endcase
      end
    end
endmodule

//testbench

module tb;
  reg clk,rst;
  wire [3:0]count;
  
  seq ew(clk,rst,count);
  
  initial begin
    clk=0;
    forever #1clk=~clk;
  end
  
  initial begin
    $monitor("Time=%0t  Count=%b",$time,count);
    rst=1;
   #5rst=0;
    #50$finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
endmodule
  
    

  
