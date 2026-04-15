`define EOF 32'hFFFF_FFFF
`define STDIN 32'h8000_0000

module cat;
	integer c;
	initial begin
		c = $fgetc(`STDIN);
		while (c != `EOF) begin
			$write("%c", c);
			c = $fgetc(`STDIN);
		end
	end
endmodule