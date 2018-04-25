testing operation
testGraph: aTF_Graph outputType: anInteger
	| operation output |
	operation := aTF_Graph operationNamed: 'a'.
	output := operation output: 0.
	self assert: output type equals: anInteger