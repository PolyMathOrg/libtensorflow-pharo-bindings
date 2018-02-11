testing operation
testShapeOfOutputSet
	| graph var shape output |
	graph := TF_Graph create.
	
	var := graph newOperation: 'Placeholder' named: 'var' described: [:description |
		description
			at: 'dtype' putType: TF_Tensor typeInt64;
			at: 'shape' putShape: #(3 -1 -1)].
	
	output := var output: 0.
	
	shape := graph shapeOf: output.
	self assert: shape equals: #(3 -1 -1).

	graph shapeOf: output set: #(-1 3 -1).

	shape := graph shapeOf: output.
	self assert: shape equals: #(3 3 -1).
