unary operations
testOperationSigmoid
	| graph inputs template session const result output transformed |
	
	template := #(-1.1 1.2 0 4).
	
	inputs := TF_Tensor fromFloats: template.
	graph := TF_Graph create.
	
	const := graph const: 'const' value: inputs.
	output := const sigmoid output: 0.
	
	session := TF_Session on: graph.
	result := session runOutput: output.
	
	transformed := template collect:[:x| (x negated exp + 1) reciprocal].
	self assert: result shape equals: inputs shape.
	result allFloats with: transformed do: [:res :temp |
		self assert: (res closeTo: temp)].
	
	output free.