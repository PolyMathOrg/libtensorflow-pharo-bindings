testing operation
testGraphCreationConst
	| graph operation |
	graph := self constantInt64Graph.
	
	operation := graph operationNamed: 'a'.
	self assert: operation type equals: 'Const'.
	self assert: operation name equals: 'a'.
	self assert: operation InputsCount equals: 0.
	self assert: operation outputsCount equals: 1.
