testing operation
testNewOperationMul
	| graph operation a b |
	graph := TF_Graph create.
	a := graph placeholder: 'a' type: TF_Tensor typeInt64.
	b := graph placeholder: 'b' type: TF_Tensor typeInt64.
	operation := graph
		mul: 'aMultiplication'
		described: [ :description | 
			description addInputFromOutput: 0 of: a.
			description addInputFromOutput: 0 of: b ].
	self assert: operation type equals: 'Mul'.
	self assert: operation name equals: 'aMultiplication'.
	self assert: operation InputsCount equals: 2.
	self assert: operation outputsCount equals: 1.
	operation := graph operationNamed: 'aMultiplication'.
	self assert: operation type equals: 'Mul'.
	self assert: operation name equals: 'aMultiplication'.
	self assert: operation InputsCount equals: 2.
	self assert: operation outputsCount equals: 1