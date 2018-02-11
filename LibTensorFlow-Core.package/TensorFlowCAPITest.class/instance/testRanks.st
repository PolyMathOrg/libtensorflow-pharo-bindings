testing tensor
testRanks
	self assertRankOf: -13123213 is: 0.
	self assertRankOf: #(123 123 123 123) is: 1.
	self assertRankOf: #(#(1 2 3) #(4 5 6) #(7 8 9)) is: 2.
	self assertRankOf: #(#(#(1) #(2) #(3)) #(#(4) #(5) #(6)) #(#(7) #(8) #(9))) is: 3