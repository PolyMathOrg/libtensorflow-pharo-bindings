unary operations
testOperationSquared
	| graph template session const result output |
	
	template := TF_Tensor fromFloats: #((-1.1 1.2) (-2.1 -2.2)).
	graph := TF_Graph create.
	
	const := graph const: 'const' value: template.
	output := const squared output: 0.
	
	session := TF_Session on: graph.
	result := session runOutput: output.
	
	self assert: result shape equals: template shape.
	result allFloats with: template allFloats squared do: [:res :temp |
		self assert: (res closeTo: temp)]