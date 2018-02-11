testing graph
testGraphRunInputsOutputs
	| graph output result input |
	graph := TF_Graph create.
	
	output := graph fromBlock: [:a |
		input := a.
		a @* TF_Tensor pi].

	result := graph
		runInputs: {input input: 0}
		values: {7.23 asTensor}
		outputs: {output output}.
	
	self assert: Float pi * 7.23 closeTo: result first asNumbers.