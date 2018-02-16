testing operation
testOperationAsOperationOk
	| const1 const2 graph |
	graph := TF_Graph create.
	const1 := graph const: 1.0 asTensor.
	const2 := const1 asOperationOn: graph.
	self assert: const1 == const2