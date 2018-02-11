testing operation
testShapeOfInput
	| graph template const shape same |
	graph := TF_Graph create.
	template := TF_Tensor fromFloats: #(
		((1) (2) (3)) 
		((4) (5) (6))
	).
	const := graph const: 'const' value: template.
	same := const identity.
	shape := graph shapeOf: (same input: 0).
	
	self assert: template shape equals: shape.
