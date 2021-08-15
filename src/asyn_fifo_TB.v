`timescale 1ns / 1ps


module asyn_fifo_TB;

	// Inputs
	reg rst_n;
	reg clk_write;
	reg clk_read;
	reg write;
	reg read;
	reg [7:0] data_write;
	
	// Outputs
	wire [7:0] data_read;
	wire full;
	wire empty;
	wire[4:0] data_count_w,data_count_r;
	
	// Instantiate the Unit Under Test (UUT)
	asyn_fifo #(.DATA_WIDTH(8),.FIFO_DEPTH_WIDTH(5)) uut ( //32x8 FIFO mem
		.rst_n(rst_n), 
		.clk_write(clk_write), 
		.clk_read(clk_read), 
		.write(write), 
		.read(read), 
		.data_write(data_write), 
		.data_read(data_read), 
		.full(full), 
		.empty(empty),
		.data_count_w(data_count_w),
		.data_count_r(data_count_r)
	);
	always begin //100MHz
		clk_write=1;
		#5;
		clk_write=0;
		#5;
	end
	always begin //13MHz
		clk_read=1;
		#7.69;
		clk_read=0;
		#7.69;
	end
	
	integer i;
	initial begin
		// Initialize Inputs
		rst_n = 1;
		write = 0;
		read = 0;
		data_write = 0;
		#100;
		
		for(i=0;i<=40;i=i+1) begin //write data until full
			@(negedge clk_write);
			data_write=i;
			write=1;
		end
		write=0;
		#100;
		
		for(i=0;i<=40;i=i+1) begin //read data until empty
			@(negedge clk_read);
			read=1;
		end
		read=0;
		#100;
		
		read=1;
		for(i=0;i<=50;i=i+1) begin //read data WHILE writing data
			@(negedge clk_write);
			data_write=i;
			write=1;
		end
		
		#1000 $stop;
		
	end
      
endmodule

