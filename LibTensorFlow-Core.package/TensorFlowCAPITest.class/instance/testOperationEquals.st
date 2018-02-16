testing operation
testOperationEquals
	| graph in1 |
	graph := TF_Graph create.
	in1 := graph placeholder: 'in1' type: TF_Tensor typeFloat.
	self assert: in1 equals: in1.
	self deny: in1 = 'in1'