unary operations
testOperationExp
	| graph inputs template session const result output |
	
	template := #(-1.1 1.2).
	
	inputs := TF_Tensor fromFloats: template.
	graph := TF_Graph create.
	
	const := graph const: 'const' value: inputs.
	output := const exp output: 0.
	
	session := TF_Session on: graph.
	result := session runOutput: output.
	
	self assert: result shape equals: inputs shape.
	result allFloats with: template exp do: [:res :temp |
		self assert: (res closeTo: temp)].
	
	output free.