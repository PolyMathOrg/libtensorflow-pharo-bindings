testing tensor
testAsBooleanTensor: anArray shape: shapeArray
	| tensor index bools |
	tensor := anArray asBooleanTensor.
	self assert: tensor shape equals: shapeArray.
	index := 1.
	bools := tensor allElements.
	TF_Tensor
		elementsOf: anArray
		do: [ :each | 
			self assert: (bools at: index) equals: each.
			index := index + 1 ]