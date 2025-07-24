`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////


module VGA(
          input reset , clk,
          input red , blue , green,
          output hsync  ,vsync,
          output reg [2:0] rgb ,
          output reg [9:0] pixel_x ,
          output reg  [9:0] pixel_y ,
          output reg video_on 
    );
    
    
    always @(posedge clk , posedge reset) begin
          if(~reset)
             pixel_x <=0;
          else if (pixel_x < 800) 
             pixel_x <= pixel_x + 1;
          else 
             pixel_x <= 0 ;
    end  
    
    always @(posedge clk , posedge reset ) begin
          if (~reset)
             pixel_y <= 0;
          else if (pixel_x == 799) begin
                    if (pixel_y < 525)
                       pixel_y <= pixel_y + 1;
                     else 
                       pixel_y <= 0 ; 
          end 
    end 
  /*  always @(posedge clk) begin
          if (pixel_x > 143 && pixel_x < 784 && pixel_y > 34 && pixel_y < 515 ) video_on <= 1'b1;
          else video_on <= 1'b0;   
   end */
    always @(posedge clk , posedge reset) begin
          if (~reset)
             begin video_on <= 0 ; rgb <= 0; end
         else if (pixel_x > 143 && pixel_x < 784 && pixel_y > 34 && pixel_y < 515 ) begin
            video_on <= 1;
            rgb <= {red , blue , green}; end
          else 
            video_on <=0;
             rgb <= 0 ; 
    end
    assign hsync = (pixel_x < 96 )? 1'b1 : 1'b0,
           vsync = (pixel_y < 2) ? 1'b1 : 1'b0;
         //  video_on = (pixel_x > 143 && pixel_x < 784 && pixel_y > 34 && pixel_y < 515 ) ? 1'b1 : 1'b0;
    
endmodule
