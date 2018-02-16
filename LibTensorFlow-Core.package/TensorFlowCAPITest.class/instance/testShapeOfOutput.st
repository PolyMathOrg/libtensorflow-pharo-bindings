testing operation
testShapeOfOutput
	| graph template const shape |
	graph := TF_Graph create.
	template := TF_Tensor fromFloats: #(#(#(1) #(2) #(3)) #(#(4) #(5) #(6))).
	const := graph const: 'const' value: template.
	shape := graph shapeOf: (const output: 0).
	self assert: template shape equals: shape