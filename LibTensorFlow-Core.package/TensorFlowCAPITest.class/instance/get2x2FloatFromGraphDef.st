testing tensor
get2x2FloatFromGraphDef
	| graph session const result |
	graph := self constant2x2FloatGraphFromDef.
	
	const := (graph operationNamed: 'a') output: 0.
	session := TF_Session on: graph.
	result := session runOutput: const.
	
	^ result