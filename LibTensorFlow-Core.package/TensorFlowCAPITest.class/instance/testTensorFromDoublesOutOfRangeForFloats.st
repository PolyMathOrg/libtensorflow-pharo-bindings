testing tensor
testTensorFromDoublesOutOfRangeForFloats
	| tensor template values |
	template := #(1.23456 0.0 -1.234567 3.402824e38 1.175494351e-46 1.0e39 1.0e-50) copy.
	tensor := TF_Tensor fromDoubles: template.
	
	values := tensor allElements.
		
	self assert: tensor shape equals: #(7).
	self assert: tensor size equals: 7.
	self assert: tensor byteSize equals: (7*8).
	template with: values do: [:expected :actual |
		self assert: expected closeTo: actual].
	self assert: 0.0 ~= values last.
	self assert: 0.0 ~= (values at: 5).