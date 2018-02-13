testing-Backpropagation
testForward
	| inputs plan rawResult result weights |
	plan := BackpropagationForwardPlan new.
	inputs := TF_Tensor fromFloats: {
		{0}.
		{2 ln}
	}.
	weights := TF_Tensor fromFloats: #(
		(1 1)
		(1 0)
	).
	rawResult := plan runOn: {inputs. weights}.
	result := rawResult allFloats.
	
	self assert: (result first closeTo: (1 + 0.5) reciprocal);
		 assert: (result second closeTo: 0.5)