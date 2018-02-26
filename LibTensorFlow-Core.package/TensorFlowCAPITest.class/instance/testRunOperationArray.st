testing operation
testRunOperationArray
	| graph operation session |
	graph := self constantFloatGraphFromDef.
	session := TF_Session on: graph.
	operation := graph operationNamed: 'a'.
	session runOperations: (Array with: operation).
	graph delete