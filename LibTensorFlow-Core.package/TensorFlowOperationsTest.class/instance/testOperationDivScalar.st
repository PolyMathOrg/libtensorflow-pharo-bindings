binary operations
testOperationDivScalar
	| graph a b session constA constB result div template |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	b := TF_Tensor fromFloats: 2.0.
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	
	div := constA @/ constB.
	template := a allFloats / 2.0.
	
	session := TF_Session on: graph.
	result := session runOutput: (div output: 0).
	
	self assert: result shape equals: a shape.
	result allFloats with: template do: [:r :t |
		self assert: (r closeTo: t)].