binary operations
testOperationSumOnOutputs
	| graph a session const results first second output0 output1 axis0 axis1 template sumOn1 sumOn0 |
	
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
	results := session runOutputs: {output0 output: 0. output1 output: 0}.
	first := results at: 1.
	second := results at: 2.
	
	self assert: first shape equals: #(2).
	first allFloats with: sumOn0 do: [:r :t |
		self assert: (r closeTo: t)].
	
	self assert: second shape equals: #(3).
	second allFloats with: sumOn1 do: [:r :t |
		self assert: (r closeTo: t)].