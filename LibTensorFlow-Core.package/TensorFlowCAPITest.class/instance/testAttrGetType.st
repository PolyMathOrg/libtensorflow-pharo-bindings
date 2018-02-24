testing operation
testAttrGetType
	| op graph |
	graph := self concatGraphInputList.
	op := graph operationNamed: 'concat'.
	self assert: (op typeAt: 'T') equals: TF_Tensor typeInt64.
	graph delete