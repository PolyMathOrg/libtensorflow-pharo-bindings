graphs
mulGraphTwoInputsInt64
	| graph constant const in1 in2 mul1 |
	graph := TF_Graph create.
	constant := TF_Tensor fromInt64: 16r0101010101010101.
	
	in1 := graph placeholder: 'in1' type: constant type.
	in2 := graph placeholder: 'in2' type: constant type.
	const := graph const: 'const' value: constant.
	mul1 := graph mul: 'mul1' described: [:description |
		description addInput: (const output: 0).
		description addInput: (in1 output: 0)].
	graph mul: 'mul2' described: [:description |
		description addInput: (mul1 output: 0).
		description addInput: (in2 output: 0)].
	
	^ graph