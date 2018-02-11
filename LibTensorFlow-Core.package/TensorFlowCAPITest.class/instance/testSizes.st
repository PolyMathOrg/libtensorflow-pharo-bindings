testing tensor
testSizes
	self assertSizeOf: -13123213 is: 1.
	self assertSizeOf: #(123 123 123 123) is: 4.
	self assertSizeOf: #(#(1 2 3) #(4 5 6) #(7 8 9) #(10 11 12)) is: 4 * 3.
	self assertSizeOf: #(#(#(1) #(2) #(3)) #(#(4) #(5) #(6)) #(#(7) #(8) #(9))) is: 3 * 3 * 1