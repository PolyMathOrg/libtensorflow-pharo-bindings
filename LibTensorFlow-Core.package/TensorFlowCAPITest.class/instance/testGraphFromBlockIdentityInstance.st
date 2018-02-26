testing graph
testGraphFromBlockIdentityInstance
	| graph output inputs results |
	graph := TF_Graph create.
	output := graph fromBlock: [ :a | a alias: 'a_1' ].
	inputs := graph allInputs collect: [ :input | input input: 0 ].
	results := (TF_Session on: graph) runInputs: inputs values: {(TF_Tensor fromFloats: 3.1415)} outputs: {(output output: 0)}.
	self assert: (results first allFloats first closeTo: 3.1415)