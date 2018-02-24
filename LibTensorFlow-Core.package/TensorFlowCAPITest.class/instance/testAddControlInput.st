testing operation
testAddControlInput
	| graph in op result |
	graph := TF_Graph create.
	in := graph const: 'const' value: (TF_Tensor fromInt64: 12345678).
	op := graph
		newOperation: 'Mul'
		named: 'out'
		described: [ :description | 
			description
				addInput: (in output: 0);
				addInput: (in output: 0);
				addControlInput: (in output: 0) ].
	result := (TF_Session on: graph) runOutput: (op output: 0).
	self assert: 12345678 * 12345678 equals: result allInt64s first