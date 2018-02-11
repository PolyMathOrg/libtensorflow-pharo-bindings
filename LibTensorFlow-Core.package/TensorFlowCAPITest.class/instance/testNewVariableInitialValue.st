testing operation
testNewVariableInitialValue
	| graph var assign result session pisTensor |
	graph := TF_Graph create.
	pisTensor := TF_Tensor fromFloats: #(3.14 3.1415 3.141516).
	var := graph variable: 'var' initialValue: pisTensor.
	assign := graph operationNamed: 'var_initializer'.
	
	session := TF_Session on: graph.
	
	session runOutput: (assign output: 0).
	result := session runOutput: (var output: 0).

	self assert: result allFloats equals: pisTensor allFloats