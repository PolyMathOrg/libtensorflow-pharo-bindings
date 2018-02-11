testing tensor
testTensorFromDoublesOutOfRange
	| tensor template values |
	template := #(1.23456 0.0 -1.234567 1.0e39 1.0e-50 1.0e309 1.0e-324) copy.
	tensor := TF_Tensor fromDoubles: template.
	
	template at: 6 put: Float infinity.
	
	values := tensor allElements.
		
	self assert: tensor shape equals: #(7).
	self assert: tensor size equals: 7.
	self assert: tensor byteSize equals: (7*8).
	template with: values do: [:expected :actual |
		self assert: expected closeTo: actual].
	self assert: 0.0 equals: values last.
