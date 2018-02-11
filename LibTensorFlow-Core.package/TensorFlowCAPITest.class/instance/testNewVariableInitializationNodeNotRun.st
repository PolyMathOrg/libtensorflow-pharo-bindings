testing operation
testNewVariableInitializationNodeNotRun
	| graph var pi lastError |
	graph := TF_Graph create.
	var := graph variable: 'var' type: TF_Tensor typeFloat shape: #().
	pi := graph const: 'pi' value: (TF_Tensor fromFloats: 3.14).
	graph newOperation: 'Assign' named: 'assign' described: [:description |
		description
			addInput: (var output: 0);
			addInput: (pi output: 0)].
	
	[(TF_Session on: graph)
		runOutput: (var output: 0)] ifError: [:description :receiver | lastError := description].
	
	self
		assert: 'Error: FAILED_PRECONDITION: Attempting to use uninitialized value var'
		equals: lastError lines first