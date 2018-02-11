unary operations
testOperationAsin
	| graph template session const result output intput |
	
	template := #(1.1 0.2 -1.34 0.717273).
	intput := TF_Tensor fromFloats: template sin.
	graph := TF_Graph create.
	
	const := graph const: 'const' value: intput.
	output := const arcSin output: 0.
	
	session := TF_Session on: graph.
	result := session runOutput: output.
	
	self assert: result shape equals: intput shape.
	result allFloats with: template do: [:res :temp |
		self assert: (res closeTo: temp)].
	
	output free.