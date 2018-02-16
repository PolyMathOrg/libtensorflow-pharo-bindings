testing library
testGetAllOps
	| ops |
	ops := library getAllOps.
	self assert: (ops data fromCString includesSubstring: 'tensor').
	ops delete