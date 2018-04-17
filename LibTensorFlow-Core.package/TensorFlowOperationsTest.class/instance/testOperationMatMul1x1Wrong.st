binary operations
testOperationMatMul1x1Wrong
	| graph a b session constA constB output |
	
	a := #(1.1) asFloatTensor.
	b := #(2.02) asFloatTensor.
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.

	self should: [output := constA * constB]
	raiseError:'INVALID_ARGUMENT: Shape must be rank 2 but is rank 1 for ''MatMul_2'' (op: ''MatMul'') with input shapes: [1], [1].'