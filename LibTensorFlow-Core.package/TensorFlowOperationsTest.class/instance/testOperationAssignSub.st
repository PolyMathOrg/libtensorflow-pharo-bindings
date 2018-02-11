binary operations
testOperationAssignSub
	| graph var output pi result session |
	graph := TF_Graph create.
	var := graph variable: 'var' initialValue: 1.0 asTensor.
	pi := graph const: 'pi' value: TF_Tensor pi.
	output := var -= pi.
	
	session := TF_Session on: graph.
	graph initializeOn: session.
	result := session runOutput: (output output: 0).
	
	self assert: (1-Float pi closeTo: result allFloats first)