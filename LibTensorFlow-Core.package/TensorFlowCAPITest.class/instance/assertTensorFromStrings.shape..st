testing strings
assertTensorFromStrings: strings shape: shape
	| tensor |
	tensor := TF_Tensor fromStrings: strings shape: shape.

	self assert: shape equals: tensor shape.	
	self assert: strings equals: tensor allStrings.

	