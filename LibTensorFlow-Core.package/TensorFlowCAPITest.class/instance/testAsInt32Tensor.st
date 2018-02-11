testing tensor
testAsInt32Tensor
	self testAsInt32Tensor: 1 shape: #().
	self testAsInt32Tensor: #(1 2 3 4) shape: #(4).
	self testAsInt32Tensor: #(#(1 2 3 4) #(-314 171 -212 -78)) shape: #(2 4)