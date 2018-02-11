binary operations
testOperationGreater
	| graph a b session constA constB result  template comparisons |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (3.14 2.2)).
	b := TF_Tensor fromFloats: #((3.14 3.14) (2.1 3.14)).
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	
	comparisons := constA > constB.
	template := a allFloats with: b allFloats collect:[:x :y| x > y].
	
	session := TF_Session on: graph.
	result := session runOutput: (comparisons output: 0).
	
	self assert: result shape equals: a shape.
	result allElements with: template do: [:r :t |
		self assert: r equals: t].