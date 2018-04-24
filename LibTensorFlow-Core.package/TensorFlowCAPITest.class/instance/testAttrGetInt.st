testing operation
testAttrGetInt
	| op graph |
	graph := self concatGraphInputList.
	op := graph operationNamed: 'concat'.
	self assert: (op intAt: 'N') equals: 2