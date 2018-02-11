testing session
testSessionRunOutputOnGraph: graph
	| operation session output tensor |
	session := TF_Session on: graph.
	operation := graph operationNamed: 'a'.
	output := operation output: 0.
	
	tensor := session runOutput: output.
	
	self deny: tensor isNull.
	self deny: tensor data isNull.
	self assert: (tensor data getHandle signedLongLongAt: 1) equals: 16r4242424242424242.

	output free.
	graph delete.