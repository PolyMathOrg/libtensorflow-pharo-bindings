testing-Backpropagation
testBackpropagationPlanBackguardConverges
	| plan const graph w0 weights inputs target result |
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

	200 timesRepeat: [plan learn: inputs with: target].

	self assert: (plan delta allFloats squared sum closeTo: 0).

	result := (plan runOn: {inputs}) allFloats.
	
	self assert: (result first closeTo: 0.5).
	self assert: (result second closeTo: 0.5).
