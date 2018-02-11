testing session
testRunGraphMulOneInput
	| graph input inputValue result mul output session |
	graph := self mulGraphOneInputInt64.
	
	input := (graph operationNamed: 'in') input: 0.
	inputValue := TF_Tensor fromInt64: 11.
	mul := graph operationNamed: 'mul'.
	output := mul output: 0.
	session := TF_Session on: graph.
	result := session runOperation: mul input: input value: inputValue output: output.
	
	self deny: result isNull.
	self deny: result data isNull.
	self assert: (result data getHandle signedLongLongAt: 1) equals: 16r4242424242424242.

	result delete.
	input free.
	output free.
	graph delete.