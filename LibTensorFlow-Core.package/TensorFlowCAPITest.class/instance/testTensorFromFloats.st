testing tensor
testTensorFromFloats
	| tensor template values |
	template := #(1.23456 0.0 -1.234567 3.402823466e38 1.175494351e-38).
	tensor := TF_Tensor fromFloats: template.
	values := tensor allFloats.
		
	self assert: tensor shape equals: #(5).
	self assert: tensor size equals: 5.
	self assert: tensor byteSize equals: (5*4).
	template @ values do: [:point |
		self assert: (point x closeTo: point y)]
