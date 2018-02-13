initialization
initializeVariables
	| initialWeights |
	Random withDefaultDo: [:random |
		initialWeights := (1 to: 4) collect: [:unused | random next]].
	initialWeights := TF_Tensor fromFloats: initialWeights shape: #(2 2).
	
	weights := graph variable: 'weights' initialValue: initialWeights.