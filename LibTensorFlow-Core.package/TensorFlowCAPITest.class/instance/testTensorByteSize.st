testing tensor
testTensorByteSize
	| tensor |
	tensor := TF_Tensor type: TF_Tensor typeInt64 shape: #(2 3).
	self assert: tensor byteSize equals: 8 * 2 * 3