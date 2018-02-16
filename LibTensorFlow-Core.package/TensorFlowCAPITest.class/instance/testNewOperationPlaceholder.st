testing operation
testNewOperationPlaceholder
	| graph operation |
	graph := TF_Graph create.
	operation := graph
		placeholder: 'aPlaceholder'
		type: TF_Tensor typeInt64.
	self assert: operation type equals: 'Placeholder'.
	self assert: operation name equals: 'aPlaceholder'.
	self assert: operation InputsCount equals: 0.
	self assert: operation outputsCount equals: 1.
	operation := graph operationNamed: 'aPlaceholder'.
	self assert: operation type equals: 'Placeholder'.
	self assert: operation name equals: 'aPlaceholder'.
	self assert: operation InputsCount equals: 0.
	self assert: operation outputsCount equals: 1