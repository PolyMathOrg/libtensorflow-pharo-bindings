testing graph
testGraphOperationsSelect
	| operations |
	operations := self mulGraphTwoInputsInt64 allInputs.
		
	self assert: operations size equals: 2.
	self assert: operations first name equals: 'in1'.
	self assert: operations second name equals: 'in2'.
