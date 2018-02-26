testing tensor
testTensorAsStream
	self assertTensor: -13123213 asInt32Tensor streamEquals: #(-13123213).
	self assertTensor: #(123 123 123 123) asInt32Tensor streamEquals: #(123 123 123 123).
	self
		assertTensor: #(#(1 2 3) #(4 5 6) #(7 8 9) #(10 11 12)) asFloatTensor
		streamEquals: #(1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0 11.0 12.0).
	self
		assertTensor: #(#(#(1 100) #(2 100) #(3 100)) #(#(4 100) #(5 100) #(6 100)) #(#(7 100) #(8 100) #(9 100))) asFloatTensor
		streamEquals: #(1.0 100.0 2.0 100.0 3.0 100.0 4.0 100.0 5.0 100.0 6.0 100.0 7.0 100.0 8.0 100.0 9.0 100.0)