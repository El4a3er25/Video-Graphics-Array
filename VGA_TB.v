`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////


module VGA_TB();
         reg reset , clk ;
         reg red , blue , green;
         wire hsync  ,vsync;
         wire [2:0] rgb;
         wire [9:0] pixel_x ;
         wire [9:0] pixel_y ;
         wire video_on;
         integer i;
         
    VGA uut (reset , clk , red , blue , green , hsync , vsync , rgb , pixel_x , pixel_y ,video_on);
    
    always #5 clk =~clk;     
    
    initial begin
          clk = 0;
          red =0 ; blue =0 ; green =0 ;
          reset = 0 ;
          #10;
          reset = 1;
          for (i=0 ; i< 250 ; i=i+1) begin
              red = $random;
              blue = $random;
              green = $random;
              # 10 ;
          end
    end
endmodule
