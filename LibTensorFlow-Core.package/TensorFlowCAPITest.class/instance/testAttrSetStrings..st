testing operation
testAttrSetStrings: aAnArrayOfStrings
	| graph template in op |
	graph := TF_Graph create.
	template := #((1 2 3) (4 5 6) (7 8 9)).
	in := graph const: 'in' value: (TF_Tensor fromFloats: template).
	op := graph newOperation: 'DebugIdentity' named: 'out' described: [:description |
		description at: 'debug_urls' putStrings: aAnArrayOfStrings.
		description addInput: (in output: 0)].
	
	(TF_Session on: graph)
		runOutput: (op output: 0).

