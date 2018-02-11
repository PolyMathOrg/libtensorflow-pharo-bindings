unary operations
testOperationIdentity
	| graph template const result same |
	graph := TF_Graph create.
	template := TF_Tensor fromFloats: #(
		((1) (2) (3)) 
		((4) (5) (6))
	).
	const := graph const: 'const' value: template.
	same := const identity output: 0.
	
	result := (TF_Session on: graph) runOutput: same.
	
	self assert: template shape equals: result shape.
	self assert: #(1 2 3 4 5 6) equals: result allFloats.