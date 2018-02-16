testing library
testVersion
	| version |
	version := library version.
	self assert: (#('1.5.0') includes: version)