binary operations
testOperationDiv
	| graph a b session constA constB result output template |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	b := TF_Tensor fromFloats: #((2.0 4.0) (8.0 16.0)).
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	
	output := constA @/ constB.
	template := a allFloats / b allFloats.
	
	session := TF_Session on: graph.
	result := session runOutput: (output output: 0).
	
	self assert: result shape equals: a shape.
	result allFloats with: template do: [:r :t |
		self assert: (r closeTo: t)].