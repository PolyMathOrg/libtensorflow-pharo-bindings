testing operation
testAttrGetFloat
	| graph in op |
	graph := TF_Graph create.
	in := graph placeholder: 'in' type: TF_Tensor typeFloat.
	op := graph newOperation: 'FakeQuantWithMinMaxArgs' named: 'out' described: [ :description | description addInput: (in output: 0) ].
	self assert: (op floatAt: 'min') equals: -6.0.
	self assert: (op floatAt: 'max') equals: 6.0