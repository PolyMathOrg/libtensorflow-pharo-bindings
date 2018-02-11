testing tensor
assertSizeOf: aMultidimensionalTensor is: anInteger
	| size |
	size := TF_Tensor sizeOf: aMultidimensionalTensor.
	self
		assert: size = anInteger
		description: 'The size is ', size printString, ' and should have been ', anInteger printString