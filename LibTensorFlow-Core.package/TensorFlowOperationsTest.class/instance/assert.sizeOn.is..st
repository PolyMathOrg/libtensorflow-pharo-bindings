other operations
assert: integers sizeOn: dimension is: expected
	| graph session const result size |
	graph := TF_Graph create.
	const := graph const: integers asInt32Tensor.
	
	size := const sizeOn: dimension.

	session := TF_Session on: graph.
	result := session runOutput: size output.
	
	self assert: expected equals: result asNumbers.