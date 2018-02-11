testing tensor
testRunGraphMulTwoInputsConstTensorDeleted
	| graph inputs inputValues mul output session results |
	graph := self mulGraphTwoInputsInt64ConstTensorDeleted.
	inputs := Array with: ((graph operationNamed: 'in1') input: 0) with: ((graph operationNamed: 'in2') input: 0).
	inputValues := Array with: (TF_Tensor fromInt64: 16r23) with: (TF_Tensor fromInt64: 16r24).
	Smalltalk garbageCollect.
	(TF_Tensor fromInt64: 16r1234123412341234) useFinalization.
	Smalltalk garbageCollect.
	mul := graph operationNamed: 'mul2'.
	output := mul output: 0.
	session := TF_Session on: graph.
	results := session
		runOperations: (Array with: mul)
		inputs: inputs
		values: inputValues
		outputs: (Array with: output).
	self deny: results isNull.
	self deny: results first isNull.
	self deny: results first data isNull.
	self assert: (results first data getHandle signedLongLongAt: 1) equals: (16r2121212121212121 * 16r23 * 16r24 bitAnd: 16rFFFFFFFFFFFFFFFF).
	graph delete.
	results first delete