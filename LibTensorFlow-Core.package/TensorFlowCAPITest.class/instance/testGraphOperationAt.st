testing graph
testGraphOperationAt
	| graph operation context |
	graph := self mulGraphTwoInputsInt64.
	context := graph newOperationIteratorContext.
	
	operation := graph operationAt: context.
	self assert: operation name equals: 'in1'.
	self assert: operation type equals: 'Placeholder'.

	operation := graph operationAt: context.
	self assert: operation name equals: 'in2'.
	self assert: operation type equals: 'Placeholder'.

	operation := graph operationAt: context.
	self assert: operation name equals: 'const'.
	self assert: operation type equals: 'Const'.

	operation := graph operationAt: context.
	self assert: operation name equals: 'mul1'.
	self assert: operation type equals: 'Mul'.

	operation := graph operationAt: context.
	self assert: operation name equals: 'mul2'.
	self assert: operation type equals: 'Mul'.

	operation := graph operationAt: context.
	self assert: operation isNull.
