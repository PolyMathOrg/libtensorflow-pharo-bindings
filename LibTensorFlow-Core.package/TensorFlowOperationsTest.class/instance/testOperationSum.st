binary operations
testOperationSum
	| graph a session const result output0 output1 axis0 axis1 template sumOn1 sumOn0 |
	
	template := #(
		(1.1 1.2)
		(2.1 2.2)
		(3.1 0.2)
	).
	
	sumOn0 := template sum.
	sumOn1 := template collect: [:line | line sum].
	
	a := TF_Tensor fromFloats: template.
	
	graph := TF_Graph create.
	
	const := graph const: 'a' value: a.
	axis0 := graph const: 'axis0' value: (TF_Tensor fromInt32: 0).
	axis1 := graph const: 'axis1' value: (TF_Tensor fromInt32: 1).
	
	output0 := const sumOn: axis0.
	output1 := const sumOn: axis1.
	
	session := TF_Session on: graph.
	result := session
		runOperation: output0
		output: (output0 output: 0).
	
	self assert: result shape equals: #(2).
	result allFloats with: sumOn0 do: [:r :t |
		self assert: (r closeTo: t)].
	
	result := session
		runOperation: output1
		output: (output1 output: 0).
	
	self assert: result shape equals: #(3).
	result allFloats with: sumOn1 do: [:r :t |
		self assert: (r closeTo: t)].