testing operation
testPrintOn
	| graph printString |
	graph := self addGraphTwoInputsInt64.

	printString := (graph operationNamed: 'in1') printString substrings.
	self assert: printString second equals: 'TF_Operation'.
	self assert: printString third equals: '@'.
	self assert: (printString fourth beginsWith: '16r').
	self assert: printString fifth equals: '''Placeholder'''.
	self assert: printString last equals: '''in1'''.

	printString := (graph operationNamed: 'add') printString substrings.
	self assert: printString second equals: 'TF_Operation'.
	self assert: printString third equals: '@'.
	self assert: (printString fourth beginsWith: '16r').
	self assert: printString fifth equals: '''Add'''.
	self assert: printString last equals: '''add'''.
