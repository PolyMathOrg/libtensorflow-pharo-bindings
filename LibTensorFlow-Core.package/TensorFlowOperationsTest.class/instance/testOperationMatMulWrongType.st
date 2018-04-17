binary operations
testOperationMatMulWrongType
	| graph a b constA constB |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	b := #((2 4) (8 16)) asInt32Tensor.
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.

	self
		should: [constA * constB]
		raiseError: 'INVALID_ARGUMENT: Inconsistent values for attr ''T'' DT_FLOAT vs. DT_INT32 while building NodeDef ''MatMul_2'' using Op<name=MatMul; signature=a:T, b:T -> product:T; attr=transpose_a:bool,default=false; attr=transpose_b:bool,default=false; attr=T:type,allowed=[DT_HALF, DT_BFLOAT16, DT_FLOAT, DT_DOUBLE, DT_INT32, DT_COMPLEX64, DT_COMPLEX128]>'.