binary operations
testOperationArgMinTwoOutputs
	| graph a session const results first second output0 output1 axis0 axis1 |
	
	self assert: false.
	a := TF_Tensor fromFloats: #(
		(1.1 1.2)
		(2.1 2.2)
		(3.1 0.2)
	).
	
	graph := TF_Graph create.
	
	const := graph const: 'a' value: a.
	axis0 := graph const: 'axis0' value: (TF_Tensor fromInt32: 0).
	axis1 := graph const: 'axis1' value: (TF_Tensor fromInt32: 1).
	
	output0 := (const findMinOn: axis0) output: 0.
	output1 := (const findMinOn: axis1) output: 0.
	
	session := TF_Session on: graph.
	results := session
		runOutputs: {output0. output1}.
	
	first := results at: 1.
	second := results at: 2.
	
	self assert: first shape equals: #(2).
	first allInt64s with: #(0 2) do: [:r :t |
		self assert: r equals: t].
	
	self assert: second shape equals: #(3).
	second allInt64s with: #(0 0 1) do: [:r :t |
		self assert: r equals: t].