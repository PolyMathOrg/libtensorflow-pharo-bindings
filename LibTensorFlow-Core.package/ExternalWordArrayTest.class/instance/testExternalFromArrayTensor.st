testing
testExternalFromArrayTensor
	| t1 t2 array |
	t1 := TF_Tensor fromInt64: 16r8070605040302010.
	t2 := TF_Tensor fromInt64: 16rFEDCBA9876543210.
	array := TF_TensorPtrArray
		externalFromArray: (Array with: t1 with: t2).
	self assert: array first getHandle equals: t1 getHandle.
	self assert: (array at: 2) getHandle equals: t2 getHandle