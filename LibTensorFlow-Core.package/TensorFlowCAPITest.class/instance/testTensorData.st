testing tensor
testTensorData
	| tensor |
	tensor := TF_Tensor type: TF_Tensor typeInt64 shape: #(2 3).
	self assert: tensor rank equals: 2.
	self deny: tensor data getHandle asInteger = 0.
	self deny: tensor data getHandle isNil