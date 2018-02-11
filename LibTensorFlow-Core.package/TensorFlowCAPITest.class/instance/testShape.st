testing tensor
testShape
	self assertShapeOf: -13123213 is: #().
	self assertShapeOf: #(123 123 123 123) is: #(4).
	self assertShapeOf: #(#(1 2 3) #(4 5 6) #(7 8 9) #(10 11 12)) is: #(4 3).
	self assertShapeOf: #(#(#(1) #(2) #(3)) #(#(4) #(5) #(6)) #(#(7) #(8) #(9))) is: #(3 3 1)