testing operation
testAttrGetString
	| graph in op |
	graph := TF_Graph create.
	in := graph placeholder: 'in' type: TF_Tensor typeDouble.
	op := graph
		newOperation: 'AsString'
		named: 'out'
		described: [ :description | description addInput: (in output: 0) ].
	self assert: (op stringAt: 'fill') equals: ''