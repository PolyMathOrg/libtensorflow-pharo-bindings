testing operation
testAttrSetShape: anIntegerArray
	| graph op |
	graph := TF_Graph create.
	op := graph
		newOperation: 'Placeholder'
		named: 'const'
		described: [:description |
			description at: 'shape' putShape: anIntegerArray.
			description at: 'dtype' putType: TF_Tensor typeInt64].
		
	self assert: (op shapeAt: 'shape') equals: anIntegerArray.
