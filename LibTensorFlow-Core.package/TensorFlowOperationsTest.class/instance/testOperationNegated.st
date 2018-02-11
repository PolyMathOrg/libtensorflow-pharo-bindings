unary operations
testOperationNegated
	| graph template session const result negated |
	
	template := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	graph := TF_Graph create.
	
	const := graph const: 'const' value: template.
	negated := const negated output: 0.
	
	session := TF_Session on: graph.
	result := session runOutput: negated.
	
	self assert: result shape equals: template shape.
	self assert: result allFloats equals: template allFloats negated.
	
	negated free.