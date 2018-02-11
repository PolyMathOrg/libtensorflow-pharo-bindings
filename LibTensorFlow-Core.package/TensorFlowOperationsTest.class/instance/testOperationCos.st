unary operations
testOperationCos
	| graph template session const result output intput |

	template := #(0.1 0.0 -0.94 0.717273).
	intput := TF_Tensor fromFloats: template arcCos.
	graph := TF_Graph create.
	
	const := graph const: 'const' value: intput.
	output := const cos output: 0.
	
	session := TF_Session on: graph.
	result := session runOutput: output.
	
	self assert: result shape equals: intput shape.
	result allFloats with: template do: [:res :temp |
		self assert: (res closeTo: temp)].
	
	output free.