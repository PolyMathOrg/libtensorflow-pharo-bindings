testing operation
testNewVariableForTensor
	| graph var assign result session pisTensor pis |
	graph := TF_Graph create.
	pisTensor := TF_Tensor fromFloats: #(3.14 3.1415 3.141516).
	var := graph variable: 'var' forTensor: pisTensor.
	pis := graph const: 'pis' value: pisTensor.
	assign := graph newOperation: 'Assign' named: 'assign' described: [:description |
		description
			addInput: (var output: 0);
			addInput: (pis output: 0)].
	
	session := TF_Session on: graph.
	
	session runOutput: (assign output: 0).
	result := session runOutput: (var output: 0).

	self assert: result allFloats equals: pisTensor allFloats