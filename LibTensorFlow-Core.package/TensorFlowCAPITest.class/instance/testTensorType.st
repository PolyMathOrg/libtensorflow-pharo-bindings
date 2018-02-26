testing tensor
testTensorType
	| tensor |
	tensor := TF_Tensor type: TF_Tensor typeInt64 shape: #().
	self assert: tensor type equals: tensor class typeInt64.
	tensor := TF_Tensor type: TF_Tensor typeFloat shape: #().
	self assert: tensor type equals: tensor class typeFloat