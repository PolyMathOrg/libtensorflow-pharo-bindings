testing options
testSessionOptionsSetTarget
	| options |
	options := library newSessionOptions.
	self deny: options isNull.
	options target: 'local'.
	options delete.
	self assert: options isNull