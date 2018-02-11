graphs
concatGraphInputListWrongType
	| graph in1 in2 concat dimension dimensionValue inputs |
	graph := TF_Graph create.
	dimensionValue := TF_Tensor fromInt32: 0.
	dimension := graph const: 'const' value: dimensionValue.
	
	in1 := graph placeholder: 'in1' type: TF_Tensor typeInt64.
	in2 := graph placeholder: 'in2' type: TF_Tensor typeInt64.
	inputs := Array with: (in1 output: 0) with: (in2 output: 0).
	concat := graph concat: 'concat' described: [:description |
		description addInput: (dimension output: 0).
		description addInputs: inputs.
		description at: 'T' putType: TF_Tensor typeInt32.
	].
	concat.
	^ graph