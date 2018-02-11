root operations
truncatedNormalRandomShaped: shapeArray
	| shape |
	shape := self const: shapeArray asInt32Tensor.
	^ shape unaryOp: 'TruncatedNormal' described: [:description |
		description at: 'dtype' putType: TF_Tensor typeFloat]