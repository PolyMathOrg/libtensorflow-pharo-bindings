testing graph
testGraphFromBlockIdentity
	| graph output inputs results |
	graph := TF_Graph fromBlock: [:a | a ].
	
	inputs := graph allInputs collect: [:placeholder | placeholder input: 0].
	output := graph operationNamed: 'output'.
	
	results := (TF_Session on: graph)
		runInputs: inputs
		values: {TF_Tensor fromFloats: 3.1415}
		outputs: {output output: 0}.
		
	self assert: (results first allFloats first closeTo: 3.1415)