testing operation
testFloatAsStringGraphRun
	| result str expected |
	
	expected := '0.420000'.
	result := self runFloatAsStringGraph.
	
	self deny: result isNull.
	self deny: result data isNull.
	str := result dataBytes.
	
	self assert: 8+1+ expected size equals: str size.
	self assert: (str unsignedLongLongAt: 1) equals: 0.
	self assert: (str at: 9) equals: expected size.
	self assert: (str copyFrom: 10 to: (9+expected size)) asString equals: expected.
	
	result delete.
