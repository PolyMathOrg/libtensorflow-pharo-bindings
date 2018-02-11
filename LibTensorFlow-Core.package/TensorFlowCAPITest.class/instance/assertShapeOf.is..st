testing tensor
assertShapeOf: aMultidimensionalTensor is: anArray
	| shape |
	shape := TF_Tensor shapeOf: aMultidimensionalTensor.
	self
		assert: shape = anArray
		description:
			'The shape is ' , shape printString , ' and should have been '
				, anArray printString