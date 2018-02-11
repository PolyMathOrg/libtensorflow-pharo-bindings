testing graph
testGraphOperationsCount
	| graph |
	graph := self mulGraphTwoInputsInt64.
	
	self assert: graph operationsCount equals: 5.