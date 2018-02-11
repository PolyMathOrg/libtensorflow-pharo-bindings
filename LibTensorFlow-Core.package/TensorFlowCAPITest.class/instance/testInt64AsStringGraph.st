testing operation
testInt64AsStringGraph
	| result tensor |
	tensor := TF_Tensor fromInt64: 101010101.
	result := self testAsStringGraphRunOn: tensor.
	
	self assert: result allStrings first equals: '101010101'.

	result delete.