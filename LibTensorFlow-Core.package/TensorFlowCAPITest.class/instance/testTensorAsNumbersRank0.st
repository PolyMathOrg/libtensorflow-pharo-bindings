testing tensor
testTensorAsNumbersRank0
	self assert: 1 equals: 1 asInt32Tensor asNumbers.
	self assert: 1.0 equals: 1.0 asTensor asNumbers.
