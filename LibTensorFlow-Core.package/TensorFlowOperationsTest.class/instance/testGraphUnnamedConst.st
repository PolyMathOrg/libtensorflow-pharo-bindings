binary operations
testGraphUnnamedConst
	| graph session result const |	
	graph := TF_Graph create.
	
	const := graph const: #(1 2 3 4) asFloatTensor.

	session := TF_Session on: graph.
	result := session runOutput: (const output: 0).
	
	self assert: result shape equals: #(4).
	self assert: result allFloats equals: #(1 2 3 4).