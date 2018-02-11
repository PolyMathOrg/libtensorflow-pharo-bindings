testing operation
testNewVariableInitialValueAutomaticInitialization
	| graph var result session pisTensor |
	graph := TF_Graph create.
	pisTensor := TF_Tensor fromFloats: #(3.14 3.1415 3.141516).
	var := graph variable: 'var' initialValue: pisTensor.
	
	session := TF_Session on: graph.
	
	graph initializeOn: session.
	result := session runOutput: (var output: 0).

	self assert: result allFloats equals: pisTensor allFloats