testing graph
testGraphDeletionDoesntBreakOperations
	| graph in1 in2 add |
	self
		assert: false
		description:
			'This test actually fails, and by failing it corrupts external memory and leads to a crash. This means when a TF_Graph is deleted, all the TF_Operations composing it are also deleted, hence pointers held to them (from Smalltalk or otherwise) become invalid'.
	graph := self addGraphTwoInputsInt64.
	graph ignoreFinalization.
	in1 := graph operationNamed: 'in1'.
	in2 := graph operationNamed: 'in2'.
	add := graph operationNamed: 'add'.
	self assert: in1 name equals: 'in1'.
	self assert: in2 name equals: 'in2'.
	self assert: add name equals: 'add'.
	graph delete.
	self assert: in1 name equals: 'in1'.
	self assert: in2 name equals: 'in2'.
	self assert: add name equals: 'add'.
	graph := self mulGraphTwoInputsInt64.
	graph ignoreFinalization.
	graph delete.
	self assert: in1 name equals: 'in1'.
	self assert: in2 name equals: 'in2'.
	self assert: add name equals: 'add'