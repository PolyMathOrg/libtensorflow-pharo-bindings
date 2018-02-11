testing tensor
assertElementsOf: tensorArray are: allElementsArray
	self assert: allElementsArray equals: (TF_Tensor elementsOf: tensorArray)