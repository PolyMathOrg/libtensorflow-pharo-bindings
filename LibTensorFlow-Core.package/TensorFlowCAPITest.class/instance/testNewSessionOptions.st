testing options
testNewSessionOptions
	| options |
	options := TF_SessionOptions create.
	self deny: options isNull.
	options delete.
	self assert: options isNull