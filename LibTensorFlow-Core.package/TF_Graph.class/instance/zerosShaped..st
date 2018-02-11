root operations
zerosShaped: shapeArray
	| shape |
	shape := self const: shapeArray asInt32Tensor.
	^ shape binaryOp: 'Fill' with: 0.0 asTensor