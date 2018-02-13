testing-Backpropagation
testBackpropagationPlanBackguardChangesWeights
	| plan const graph w0 weights inputs result target |
	plan := BackpropagationPlan new.
	graph := plan graph.
	
	inputs := TF_Tensor fromFloats: {{1}. {2 ln}}.
	target := TF_Tensor fromFloats: #((0.5) (0.5)).
	
	const := graph operationNamed: 'weights_initialValue'.
	w0 := const tensorAt: 'value'.
	weights := plan weights.
	
	self assert: w0 shape equals: #(2 2).
	self assert: weights shape equals: #(2 2).
	self assert: w0 allFloats equals: weights allFloats.

	result := plan learn: inputs with: target.

	self assert: weights allFloats equals: result allFloats.
	self assert: weights shape equals: result shape.
	self deny: weights allFloats = w0 allFloats
