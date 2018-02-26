graphs
addGraphTwoInputsInt64
	| graph in1 in2 |
	graph := TF_Graph create.
	in1 := graph placeholder: 'in1' type: TF_Tensor typeInt64.
	in2 := graph placeholder: 'in2' type: TF_Tensor typeInt64.
	graph
		add: 'add'
		described: [ :description | 
			description addInput: (in1 output: 0).
			description addInput: (in2 output: 0) ].
	^ graph