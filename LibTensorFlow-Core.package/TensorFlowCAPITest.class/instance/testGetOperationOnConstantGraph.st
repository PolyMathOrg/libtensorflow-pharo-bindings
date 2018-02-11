testing operation
testGetOperationOnConstantGraph
	| graph op |
	graph := self constantFloatGraphFromDef.
	self shouldnt: [op := graph operationNamed: 'a'] raise: Error.
	self assert: op name equals: 'a'.
	self assert: op type equals: 'Const'.
	self assert: op InputsCount equals: 0.
	self assert: op outputsCount equals: 1.