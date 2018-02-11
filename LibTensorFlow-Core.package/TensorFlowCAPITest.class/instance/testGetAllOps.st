testing library
testGetAllOps
	| ops |
	ops := library getAllOps.
	self assert: (ops data fromCString includesSubString: 'tensor').
	ops delete