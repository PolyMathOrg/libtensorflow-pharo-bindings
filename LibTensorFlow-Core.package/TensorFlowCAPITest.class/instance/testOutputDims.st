testing graph
testOutputDims
	| graph operation output |
	graph := self constantInt64GraphFromDef.
	operation := graph operationNamed: 'a'.
	output := operation output: 0.
	self assert: (graph outputDimensionsCount: output) equals: 0.
	output free