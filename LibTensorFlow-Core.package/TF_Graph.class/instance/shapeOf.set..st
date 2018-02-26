outputs
shapeOf: aTF_OutputOrInput set: shape
	| status value |
	value := Int64Array externalFromArray: shape.
	status := TF_Status create.
	self library
		graph: self
		setShapeOf: aTF_OutputOrInput
		to: value
		size: shape size
		status: status.
	status check