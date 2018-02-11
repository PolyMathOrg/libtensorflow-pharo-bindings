binary operations
testOperationPlusNegatedNegatedPlus
	| graph a b session constA constB result sum template |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	b := TF_Tensor fromFloats: #((3.14 3.14) (3.14 3.14)).
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	
	sum := (constA + constB negated) negated + constB negated.
	template := (a allFloats + b allFloats negated) negated + b allFloats negated.
	
	session := TF_Session on: graph.
	result := session runOutput: (sum output: 0).
	
	self assert: result shape equals: a shape.
	
	result allFloats with: a allFloats negated do: [:r :t |
		self assert: (r closeTo: t)].
	
	result allFloats with: template do: [:r :t |
		self assert: (r closeTo: t)].