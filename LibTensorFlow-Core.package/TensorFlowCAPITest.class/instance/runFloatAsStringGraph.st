testing operation
runFloatAsStringGraph
	| session graph output result |
	graph := self floatAsStringGraph.
	session := TF_Session on: graph.
	output := graph operationNamed: 'output'.
	result := session runOperation: output output: (output output: 0).
	^ result