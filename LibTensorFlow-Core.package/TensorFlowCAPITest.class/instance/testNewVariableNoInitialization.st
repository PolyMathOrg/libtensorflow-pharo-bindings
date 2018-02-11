testing operation
testNewVariableNoInitialization
	| graph var expectedError lastError |
	graph := TF_Graph create.
	var := graph variable: 'var' type: TF_Tensor typeFloat shape: #().
	[(TF_Session on: graph)
		runOutput: (var output: 0)] ifError: [:description :receiver | lastError := description].

	expectedError := 'Error: FAILED_PRECONDITION: Attempting to use uninitialized value var'.
	
	self
		assert: expectedError equals: lastError lines first
		