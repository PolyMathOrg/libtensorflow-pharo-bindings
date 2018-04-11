testing library
testVersion
	| version |
	version := library version.
	self assert: (#('1.7.0') includes: version)