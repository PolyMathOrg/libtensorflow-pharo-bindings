testing operation
testRunGraphAddTwoInputs
	| graph inputs inputValues add output session results |
	graph := self addGraphTwoInputsInt64.
	
	inputs := Array
		with: ((graph operationNamed: 'in1') input: 0)
		with: ((graph operationNamed: 'in2') input: 0).
	inputValues := Array
		with: (TF_Tensor fromInt64: 16r2021222021222021)
		with: (TF_Tensor fromInt64: 16r2221202221202221).
	add := graph operationNamed: 'add'.
	output := add output: 0.
	session := TF_Session on: graph.
	results := session
		runOperations: (Array with: add)
		inputs: inputs
		values: inputValues
		outputs: (Array with: output).
	
	self deny: results isNull.
	self deny: results first isNull.
	self deny: results first data isNull.
	self assert: (results first data getHandle signedLongLongAt: 1) equals: 16r4242424242424242.

	results first delete.
