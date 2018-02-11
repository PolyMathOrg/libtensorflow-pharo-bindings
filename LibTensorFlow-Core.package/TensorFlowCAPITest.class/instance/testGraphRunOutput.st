testing graph
testGraphRunOutput
	| graph output result |
	graph := TF_Graph create.
	output := graph const: TF_Tensor pi.
	result := graph runOutput: output output.
	
	self assert: Float pi closeTo: result asNumbers.