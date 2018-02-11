testing operation
testAttrGetBoolFalse
	| graph in op |
	graph := TF_Graph create.
	in := graph placeholder: 'in' type: TF_Tensor typeDouble.
	op := graph asString: 'out' described: [:description |
		description addInput: (in output: 0)].
	
	self assert: (op boolAt: 'scientific') equals: false.
