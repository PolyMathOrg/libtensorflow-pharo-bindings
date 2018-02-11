testing operation
testAttrGetShape
	| graph op |
	graph := TF_Graph create.
	op := graph placeholder: 'in' type: TF_Tensor typeDouble.
	
	self assert: (op shapeAt: 'shape') equals: #().
