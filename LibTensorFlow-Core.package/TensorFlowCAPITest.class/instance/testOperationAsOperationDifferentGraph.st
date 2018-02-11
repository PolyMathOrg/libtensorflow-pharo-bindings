testing operation
testOperationAsOperationDifferentGraph
	| const graph1 graph2 |
	graph1 := TF_Graph create.
	graph2 := TF_Graph create.
	const := graph1 const: 1.0 asTensor.
	self should: [const asOperationOn: graph2] raiseError: 'Can''t move an operation to another Graph'.
	
