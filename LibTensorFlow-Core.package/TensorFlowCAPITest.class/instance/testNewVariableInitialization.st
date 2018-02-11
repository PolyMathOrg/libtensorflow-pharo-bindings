testing operation
testNewVariableInitialization
	| graph var assign pi result session |
	graph := TF_Graph create.
	var := graph variable: 'var' type: TF_Tensor typeFloat shape: #().
	pi := graph const: 'pi' value: (TF_Tensor fromFloats: 3.14).
	assign := graph newOperation: 'Assign' named: 'assign' described: [:description |
		description
			addInput: (var output: 0);
			addInput: (pi output: 0)].
	
	session := TF_Session on: graph.
	
	session runOutput: (assign output: 0).
	result := session runOutput: (var output: 0).

	self assert: (result allFloats first closeTo: 3.14)