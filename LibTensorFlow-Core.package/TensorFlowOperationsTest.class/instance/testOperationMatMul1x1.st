binary operations
testOperationMatMul1x1
	| graph a b session constA constB output result |
	
	a := #((1.1)) asFloatTensor.
	b := #((3.14)) asFloatTensor.
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.

	output := constA * constB.

	session := TF_Session on: graph.
	result := session runOutput: (output output: 0).

	self assert: (1.1 * 3.14 closeTo: result allFloats first)