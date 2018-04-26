testing options
testNewSessionOptions
	| options |
	options := TF_SessionOptions create.
	self deny: options isNull