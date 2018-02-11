testing operation
testShapeOfOutputSetInvalidRank
	| graph template const output |
	graph := TF_Graph create.
	template := TF_Tensor fromFloats: #(
		((1) (2) (3)) 
		((4) (5) (6))
	).
	const := graph const: 'const' value: template.
	output := const output: 0.
	
	self
		should: [graph shapeOf: output set: #(1 2 3 -1)]
		raiseError: 'INVALID_ARGUMENT: Shapes must be equal rank, but are 3 and 4'.