binary operations
testOperationMod
	| graph a b session constA constB result output template |
	
	a := TF_Tensor fromFloats: #((10.0 11.0) (12.0 13.0)).
	b := TF_Tensor fromFloats: #((3.0 2.0) (7.0 5.0)).
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	
	output := constA \\ constB.
	template := a allFloats \\ b allFloats.
	
	session := TF_Session on: graph.
	result := session runOutput: (output output: 0).
	
	self assert: result shape equals: a shape.
	result allFloats with: template do: [:r :t |
		self assert: (r closeTo: t)].