testing tensor
testTensorAsOperation
	| graph a b result |
	graph := TF_Graph create.
	a := graph const: 3.14 asTensor.
	b := a + 1.234 asTensor.
	result := (TF_Session on: graph) runOutput: b output.
	self assert: 3.14 + 1.234 closeTo: result asNumbers