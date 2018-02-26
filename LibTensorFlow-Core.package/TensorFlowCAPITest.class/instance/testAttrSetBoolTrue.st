testing operation
testAttrSetBoolTrue
	| graph in op |
	graph := TF_Graph create.
	in := graph placeholder: 'in' type: TF_Tensor typeDouble.
	op := graph
		asString: 'out'
		described: [ :description | 
			description at: 'scientific' putBoolean: true.
			description addInput: (in output: 0) ].
	self assert: (op boolAt: 'scientific') equals: true