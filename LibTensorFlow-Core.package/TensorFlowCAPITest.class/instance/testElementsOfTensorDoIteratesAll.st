testing tensor
testElementsOfTensorDoIteratesAll
	self testElementsOf: -13123213 sum: -13123213.
	self testElementsOf: #(123 123 123 123) sum: 123 * 4.
	self testElementsOf: #(#(1 2 3) #(4 5 6) #(7 8 9) #(10 11 12)) sum: 12 * 13 / 2.
	self testElementsOf: #(#(#(1) #(2) #(3)) #(#(4) #(5) #(6)) #(#(7) #(8) #(9))) sum: 9 * 10 / 2.
	self
		testElementsOf: #(#(#(1 100) #(2 100) #(3 100)) #(#(4 100) #(5 100) #(6 100)) #(#(7 100) #(8 100) #(9 100)))
		sum: 9 * 10 / 2 + (100 * 9)