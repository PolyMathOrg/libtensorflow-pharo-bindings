testing tensor
testTensorArrayNumbersAt
	| graph inputValues inputs mul numbers output results session |
	graph := self mulGraphTwoInputsInt64.
	
	inputs := Array
		with: ((graph operationNamed: 'in1') input: 0)
		with: ((graph operationNamed: 'in2') input: 0).
	inputValues := Array
		with: (TF_Tensor fromInt64: 6)
		with: (TF_Tensor fromInt64: 11).
	mul := graph operationNamed: 'mul2'.
	output := mul output: 0.
	session := TF_Session on: graph.
	results := session
		runOperations: (Array with: mul)
		inputs: inputs
		values: inputValues
		outputs: (Array with: output).
		
	numbers := results numbersAt: 1.
	self assert: numbers equals: 16r4242424242424242
	