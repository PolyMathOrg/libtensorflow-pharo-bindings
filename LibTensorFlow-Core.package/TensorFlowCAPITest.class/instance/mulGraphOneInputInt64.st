graphs
mulGraphOneInputInt64
	| graph constant const in |
	graph := TF_Graph create.
	constant := TF_Tensor fromInt64: 16r0606060606060606.
	
	in := graph placeholder: 'in' type: constant type.
	const := graph const: 'const' value: constant.
	graph mul: 'mul' described: [:description |
		description addInput: (in output: 0).
		description addInput: (const output: 0)].
	
	^ graph