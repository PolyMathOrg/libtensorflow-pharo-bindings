testing operation
testCreateGraphMulOneInput
	| graph input mul |
	graph := self mulGraphOneInputInt64.
	input := graph operationNamed: 'in'.
	mul := graph operationNamed: 'mul'.
	self assert: input name equals: 'in'.
	self assert: mul name equals: 'mul'