testing
testTensorArrayAtPut
	| sample |
	sample := TF_Tensor fromInt64: 16r12341234.
	self testArrayAtPutFor: TF_TensorPtrArrayOld elementSample: sample