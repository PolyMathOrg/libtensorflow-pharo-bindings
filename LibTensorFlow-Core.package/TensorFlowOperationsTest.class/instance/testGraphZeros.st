binary operations
testGraphZeros
	| graph session result zeros values |
	graph := TF_Graph create.
	zeros := graph zerosShaped: #(100 100 10).
	session := TF_Session on: graph.
	result := session runOutput: (zeros output: 0).
	values := result allFloats.
	self assert: #(100 100 10) equals: result shape.
	self assert: 100 * 100 * 10 equals: values size.
	self assert: 0 equals: values min.
	self assert: 0 equals: values max