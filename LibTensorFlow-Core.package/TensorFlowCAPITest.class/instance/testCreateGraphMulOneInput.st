testing operation
testCreateGraphMulOneInput
	| graph input mul |
	graph := self mulGraphOneInputInt64.
	
	self shouldnt: [input := graph operationNamed: 'in'] raise: Error.
	self shouldnt: [mul := graph operationNamed: 'mul'] raise: Error.
	
	self assert: input name equals: 'in'.
	self assert: mul name equals: 'mul'.

	graph delete.
