testing tensor
testTensorFromFloats2x2
	| tensor template values |
	template := #(
		(-1.1 -2.1)
		(-1.2 -2.2)).
		
	tensor := TF_Tensor fromFloats: template.
	values := tensor allFloats.
		
	self assert: tensor shape equals: #(2 2).
	self assert: tensor size equals: 4.
	self assert: tensor byteSize equals: (4*4).
		
	#(-1.1 -2.1 -1.2 -2.2) with: values do: [:reference :value |
		self assert: (reference closeTo: value)]
