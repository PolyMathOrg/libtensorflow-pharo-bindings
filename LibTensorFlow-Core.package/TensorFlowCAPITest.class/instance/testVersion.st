testing library
testVersion
	| version |
	version := library version.
	self assert: (#('1.6.0') includes: version)