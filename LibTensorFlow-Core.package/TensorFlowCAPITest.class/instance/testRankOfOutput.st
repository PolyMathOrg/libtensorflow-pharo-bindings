testing operation
testRankOfOutput
	| graph template const rank |
	graph := TF_Graph create.
	template := TF_Tensor fromFloats: #(
		((1) (2) (3)) 
		((4) (5) (6))
	).
	const := graph const: 'const' value: template.
	rank := graph rankOf: (const output: 0).
	
	self assert: template shape size equals: rank.
