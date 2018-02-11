graphs
floatAsStringGraph
	| graph const |
	graph := self constantFloatGraphFromDef.
	const := graph operationNamed: 'a'.
	graph asString: 'output' described: [ :description | description addInput: (const output: 0) ].
	^ graph