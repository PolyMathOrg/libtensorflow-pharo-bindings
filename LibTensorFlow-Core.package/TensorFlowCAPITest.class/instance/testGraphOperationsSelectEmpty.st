testing graph
testGraphOperationsSelectEmpty
	| graph operations |
	graph := self mulGraphTwoInputsInt64.
	
	operations := graph operationsSelect: [:op | false].
	
	self assert: operations size equals: 0.
