testing library
testVersion
	| version |
	version := library version.
	self assert: (#('1.8.0') includes: version)