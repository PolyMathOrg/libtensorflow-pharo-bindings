testing tensor
testAsInt64Tensor
	self testAsInt64Tensor: 1 shape: #().
	self testAsInt64Tensor: #(1 2 3 4) shape: #(4).
	self testAsInt64Tensor: #((1 2 3 4) (-314 171 -212 -78)) shape: #(2 4).
