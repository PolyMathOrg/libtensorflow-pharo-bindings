other operations
testOperationSliceSimple
	| graph session const result slice |
	graph := TF_Graph create.
	const := graph const: #(1 2 3 4 5 6 7) asInt32Tensor.
	slice := const sliceFrom: #(0) asInt32Tensor size: #(1) asInt32Tensor.

	session := TF_Session on: graph.
	result := session runOutput: slice output.
	
	self assert: #(1) equals: result asNumbers.