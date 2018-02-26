testing graph
testGraphRunOutputs
	| graph output1 output2 results |
	graph := TF_Graph create.
	output1 := graph const: TF_Tensor pi.
	output2 := output1 @/ 2.0 asTensor.
	results := graph
		runOutputs:
			{output1 output.
			output2 output}.
	self assert: Float pi closeTo: results first asNumbers.
	self assert: Float pi / 2 closeTo: results second asNumbers