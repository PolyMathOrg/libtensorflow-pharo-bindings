testing-Backpropagation
testBackpropagationPlanBackguard
	| plan inputs rawResult result const graph weights first second sigmoid |
	plan := BackpropagationPlan new.
	
	inputs := TF_Tensor fromFloats: {
		{0}.
		{2 ln}
	}.
	
	graph := plan graph.
	const := graph operationNamed: 'weights_initialValue'.
	weights := (const tensorAt: 'value') allFloats.
	
	sigmoid := [:x | (x negated exp + 1) reciprocal].
	first := sigmoid value: 2 ln * weights second.
	second := sigmoid value: 2 ln * weights fourth.

	rawResult := plan runOn: {inputs}.
	result := rawResult allFloats.
	
	
	self
		assert: (result first closeTo: first);
		assert: (result second closeTo: second)