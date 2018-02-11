testing tensor
testAsInt32Tensor: tensorArray shape: shapeArray
	| tensor index ints |
	tensor := tensorArray asInt32Tensor.
	
	self assert: tensor shape equals: shapeArray.
	
	index := 1.
	ints := tensor allInt32s.
	TF_Tensor elementsOf: tensorArray do: [:each |
		self assert: (ints at: index) equals: each.
		index := index + 1].

