testing operation
testAsStringGraphRunOn: tensor
	| graph session in out result |
	graph := self asStringGraphType: tensor type.
	session := TF_Session on: graph.
	in := graph operationNamed: 'in'.
	out := graph operationNamed: 'out'.
	result := session
		runOperation: out
		input: (in input: 0)
		value: tensor
		output: (out output: 0).
	graph delete.
	^ result