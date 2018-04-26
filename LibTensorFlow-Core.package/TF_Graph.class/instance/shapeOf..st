outputs
shapeOf: aTF_OutputOrInput
	| status value size answer |
	size := self rankOf: aTF_OutputOrInput.
	value := FFIExternalArray externalNewType: 'int64' size: size.
	"value := Int64Array externalNew: size."
	status := TF_Status create.
	self library
		graph: self
		getShapeOf: aTF_OutputOrInput
		into: value getHandle
		size: size
		status: status.
	status check.
	answer := (1 to: size) collect: [ :i | value at: i ].
	^ answer