testing operation
testDescriptionDevice
	| graph in op expected |
	graph := TF_Graph create.
	in := graph const: 'const' value: (TF_Tensor fromInt64: 12345678).
	op := graph
		newOperation: 'Mul'
		named: 'out'
		described: [ :description | 
			description
				device: 'anInvalidDevice';
				addInput: (in output: 0);
				addInput: (in output: 0) ].
	expected := 'INVALID_ARGUMENT: Malformed device specification ''anInvalidDevice''
	 [[Node: out = Mul[T=DT_INT64, _device="anInvalidDevice"](const, const)]]'.
	self should: [ (TF_Session on: graph) runOutput: (op output: 0) ] raiseError: expected