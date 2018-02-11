testing library
testVersion
	| version |
	version := library version.
	self assert: (#('0.11.head' '0.12.0' '0.12.head' '1.0.0-alpha' '1.0.0' '1.5.0') includes: version)