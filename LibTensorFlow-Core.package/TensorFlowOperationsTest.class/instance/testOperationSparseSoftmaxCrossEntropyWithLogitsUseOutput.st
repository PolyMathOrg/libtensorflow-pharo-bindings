binary operations
testOperationSparseSoftmaxCrossEntropyWithLogitsUseOutput
	| graph label prediction results session xentropy gradient lastVector loss|
	
	graph := TF_Graph create.
	prediction := graph const: #(
		(0.1 0.2 0.3 0.9 0.0 0.5 0.4)
		(0.1 0.2 0.1 0.1 0.8 0.1 0.1)
		(0 0 0 0 0 0 1)
	) asFloatTensor.
	label := graph const: #(3 4 6) asInt32Tensor.
	
	xentropy := prediction sparseSoftmaxCrossEntropyWithLogits: label.
	
	session := TF_Session on: graph.
	results := session runOutputs: {xentropy output. (xentropy useOutput: 1) output}.
	
	loss := results first.
	self assert: #(3) equals: loss shape.
	self assert: (loss allFloats first between: 1 and: 1.5).
	self assert: (loss allFloats second between: 1 and: 1.5).
	self assert: (loss allFloats third between: 1 and: 1.2).
	
	gradient := results second.
	self assert: #(3 7) equals: gradient shape.
	lastVector := gradient allFloats last: 7.
	self assert: lastVector last < 0.
	lastVector allButLastDo: [:x | self assert: x > 0] 
