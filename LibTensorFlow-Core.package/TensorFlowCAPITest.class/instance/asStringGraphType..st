graphs
asStringGraphType: type
	| graph in |
	graph := TF_Graph create.
	in := graph placeholder: 'in' type: type.
	graph asString: 'out' described: [ :description | description addInput: (in output: 0) ].
	^ graph