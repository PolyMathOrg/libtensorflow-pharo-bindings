testing options
testNewImportGraphDefOptions
	| options |
	options := TF_ImportGraphDefOptions create.
	self deny: options isNull.
	options delete.
	self assert: options isNull