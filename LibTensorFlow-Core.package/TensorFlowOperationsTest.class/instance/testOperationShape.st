unary operations
testOperationShape
	| graph template session const result shape |
	
	template := TF_Tensor fromFloats: #(((((-1.1 1.2 1)) ((-2.1 -2.2 0))))).
	graph := TF_Graph create.
	
	const := graph const: 'const' value: template.
	shape := const shape output.
	
	session := TF_Session on: graph.
	result := session runOutput: shape.
	
	self assert: {template rank} equals: result shape.
	self assert: #(1 1 2 1 3) equals: result asNumbers
