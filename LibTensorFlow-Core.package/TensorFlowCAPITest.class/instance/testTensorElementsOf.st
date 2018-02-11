testing tensor
testTensorElementsOf
	self assertElementsOf: -13123213 are: #(-13123213).
	self assertElementsOf: #(123 123 123 123) are: #(123 123 123 123).
	self assertElementsOf: #(#(1 2 3) #(4 5 6) #(7 8 9) #(10 11 12)) are: (1 to: 12) asArray.
	self
		assertElementsOf: #(#(#(1) #(2) #(3)) #(#(4) #(5) #(6)) #(#(7) #(8) #(9)))
		are: (1 to: 9) asArray.
	self
		assertElementsOf: #(#(#(1 100) #(2 100) #(3 100)) #(#(4 100) #(5 100) #(6 100)) #(#(7 100) #(8 100) #(9 100)))
		are: #(1 100 2 100 3 100 4 100 5 100 6 100 7 100 8 100 9 100)