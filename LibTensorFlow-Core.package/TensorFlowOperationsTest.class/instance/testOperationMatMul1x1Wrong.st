binary operations
testOperationMatMul1x1Wrong
	| graph a b session constA constB output |
	
	a := #(1.1) asFloatTensor.
	b := #(2.02) asFloatTensor.
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.

	output := constA * constB.

	session := TF_Session on: graph.
	self
		should: [session runOutput: (output output: 0)]
		raiseError: 'INVALID_ARGUMENT: In[0] is not a matrix
	 [[Node: MatMul_2 = MatMul[T=DT_FLOAT, _class=[], transpose_a=false, transpose_b=false, _device="/job:localhost/replica:0/task:0/cpu:0"](a, b)]]'
