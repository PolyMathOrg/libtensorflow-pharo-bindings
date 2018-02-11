binary operations
testOperationMeanOn
	| graph a session mean0 mean01 mean1 results meanNone |
	
	graph := TF_Graph create.
	a := graph const: #(
		(1.1 1.2)
		(2.1 2.2)
		(3.1 0.2)
	) asFloatTensor.
		
	mean0 := a meanOn: #(0) asInt32Tensor.
	mean1 := a meanOn: #(1) asInt32Tensor.
	mean01 := a meanOn: #(0 1) asInt32Tensor.
	meanNone := a meanOn: #() asInt32Tensor.
		
	session := TF_Session on: graph.
	results := session runOutputs: {mean0 output: 0. mean1 output: 0. mean01 output: 0. meanNone output: 0}." mean01bis output: 0}."
	
	self assert: #(2) equals: results first shape.
	self assert: #(3) equals: results second shape.
	self assert: #() equals: results third shape.
	self assert: #(3 2) equals: results fourth shape.

	self assertAll: #(2.1 1.2) closeTo: results first allFloats.
	self assertAll: #(1.15 2.15 1.65) closeTo: results second allFloats.
	self assertAll: #(1.65) closeTo: results third allFloats.
	self
		assertAll: #(
			1.1 1.2
			2.1 2.2
			3.1 0.2)
		closeTo: results fourth allFloats.
	