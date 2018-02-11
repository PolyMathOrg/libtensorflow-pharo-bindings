testing tensor
testTensorNewScalar
	| tensor |
	tensor := TF_Tensor type: TF_Tensor typeInt64 shape: #().
	tensor ignoreFinalization.
	self deny: tensor isNull.
	tensor delete.
	self assert: tensor isNull