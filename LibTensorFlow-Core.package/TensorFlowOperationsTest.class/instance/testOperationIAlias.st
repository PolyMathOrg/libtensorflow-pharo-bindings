unary operations
testOperationIAlias
	| graph template const result same1 same2 |
	graph := TF_Graph create.
	template := TF_Tensor fromFloats: #(
		((1) (2) (3)) 
		((4) (5) (6))
	).
	const := graph const: 'const' value: template.
	same1 := const alias: 'another_name'.
	same2 := graph operationNamed: 'another_name'.
	
	result := (TF_Session on: graph) runOutput: (same1 output: 0).
	
	self assert: template shape equals: result shape.
	self assert: #(1 2 3 4 5 6) equals: result allFloats.
	
	result := (TF_Session on: graph) runOutput: (same2 output: 0).
	
	self assert: template shape equals: result shape.
	self assert: #(1 2 3 4 5 6) equals: result allFloats.
	
