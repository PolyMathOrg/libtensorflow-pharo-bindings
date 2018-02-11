testing tensor
testTensorAllStrings
	| result strings expected |
	
	expected := #('0.420000').
	result := self runFloatAsStringGraph.
	strings := result allStrings.
	
	self assert: strings equals: expected.
	
	result delete.
