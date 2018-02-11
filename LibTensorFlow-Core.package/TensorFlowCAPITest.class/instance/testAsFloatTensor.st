testing tensor
testAsFloatTensor
	self testAsFloatTensor: 1 shape: #().
	self testAsFloatTensor: #(1 2 3 4) shape: #(4).
	self testAsFloatTensor: #((1 2 3 4) (3.14 1.71 2.12 -7.8)) shape: #(2 4).
