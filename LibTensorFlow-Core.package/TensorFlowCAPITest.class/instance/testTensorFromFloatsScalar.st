testing tensor
testTensorFromFloatsScalar
	| tensor template values |
	template := 3.141516.
	tensor := TF_Tensor fromFloats: template.
	values := tensor allFloats.
		
	self assert: tensor shape equals: #().
	self assert: tensor size equals: 1.
	self assert: tensor byteSize equals: (1*4).
	
	self assert: (template closeTo: values first).