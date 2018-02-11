other operations
assertSlice: integers from: begin size: size is: expected
	| graph session const result slice |
	graph := TF_Graph create.
	const := graph const: integers asInt32Tensor.
	slice := const sliceFrom: begin asInt32Tensor size: size asInt32Tensor.
	session := TF_Session on: graph.
	result := session runOutput: slice output.
	self assert: expected equals: result asNumbers