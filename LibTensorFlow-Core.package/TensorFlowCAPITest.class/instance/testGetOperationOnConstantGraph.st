testing operation
testGetOperationOnConstantGraph
	| graph op |
	graph := self constantFloatGraphFromDef.
	op := graph operationNamed: 'a'.
	self assert: op name equals: 'a'.
	self assert: op type equals: 'Const'.
	self assert: op InputsCount equals: 0.
	self assert: op outputsCount equals: 1