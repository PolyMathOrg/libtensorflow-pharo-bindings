testing operation
testGraph: aTF_Graph outputType: anInteger
	| operation output |
	self halt.
	operation := aTF_Graph operationNamed: 'a'.
	output := operation output: 0.
	self assert: output type equals: anInteger.
	output free.