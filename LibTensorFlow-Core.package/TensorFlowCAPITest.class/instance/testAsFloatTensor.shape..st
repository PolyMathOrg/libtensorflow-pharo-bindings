testing tensor
testAsFloatTensor: tensorArray shape: shapeArray
	| tensor index floats |
	tensor := tensorArray asFloatTensor.
	
	index := 1.
	floats := tensor allFloats.
	TF_Tensor elementsOf: tensorArray do: [:each |
		self assert: ((floats at: index) closeTo: each).
		index := index + 1].

	self assert: tensor shape equals: shapeArray