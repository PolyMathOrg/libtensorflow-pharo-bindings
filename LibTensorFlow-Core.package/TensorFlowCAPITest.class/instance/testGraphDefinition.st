testing graph
testGraphDefinition
	| definition operations |
	definition := self mulGraphTwoInputsInt64 definition.
	operations := (TF_Graph fromString: definition) allInputs.
	self assert: operations size equals: 2.
	self assert: operations first name equals: 'in2'.
	self assert: operations second name equals: 'in1'