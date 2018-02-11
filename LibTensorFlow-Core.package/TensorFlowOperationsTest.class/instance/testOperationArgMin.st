binary operations
testOperationArgMin
	| graph a session const result output0 output1 axis0 axis1 |
	
	a := TF_Tensor fromFloats: #(
		(1.1 1.2)
		(2.1 2.2)
		(3.1 0.2)
	).
	
	graph := TF_Graph create.
	
	const := graph const: 'a' value: a.
	axis0 := graph const: 'axis0' value: (TF_Tensor fromInt32: 0).
	axis1 := graph const: 'axis1' value: (TF_Tensor fromInt32: 1).
	
	output0 := const findMinOn: axis0.
	output1 := const findMinOn: axis1.
	
	session := TF_Session on: graph.
	result := session runOutput: (output0 output: 0).
	
	self assert: result shape equals: #(2).
	result allInt64s with: #(0 2) do: [:r :t |
		self assert: r equals: t].
	
	result := session runOutput: (output1 output: 0).
	
	self assert: result shape equals: #(3).
	result allInt64s with: #(0 0 1) do: [:r :t |
		self assert: r equals: t].