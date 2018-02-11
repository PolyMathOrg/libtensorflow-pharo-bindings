unary operations
testOperationRelu
	| graph template session const result output |
	
	template := #(
		(-1.1	1.2)
		(-2.1	2.2)
		(0		-0)) asFloatTensor.
		
	graph := TF_Graph create.
	
	const := graph const: 'const' value: template.
	output := const rectified output: 0.
	
	session := TF_Session on: graph.
	result := session runOutput: output.
	
	self assert: result shape equals: template shape.
	self assert: result allFloats equals: (template allFloats collect: [:each | each max: 0]).
