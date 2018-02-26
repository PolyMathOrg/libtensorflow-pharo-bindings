testing operation
testAttrGetShape
	| graph op |
	graph := TF_Graph create.
	self halt.
	op := graph placeholder: 'in' type: TF_Tensor typeDouble.
	self assert: (op shapeAt: 'shape') equals: #()