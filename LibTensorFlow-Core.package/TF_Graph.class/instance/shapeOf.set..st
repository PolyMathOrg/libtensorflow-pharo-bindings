outputs
shapeOf: aTF_OutputOrInput set: shape
	| status value |
	value := FFIExternalArray externalNewType: 'int64' fromArray: shape.
	status := TF_Status create.
	self library
		graph: self
		setShapeOf: aTF_OutputOrInput
		to: value getHandle
		size: shape size
		status: status.
	status check