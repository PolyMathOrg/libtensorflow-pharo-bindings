testing operation
testRunOperationArray
	| graph operation session |
	graph := self constantFloatGraphFromDef.
	session := TF_Session on: graph.
	operation := graph operationNamed: 'a'.
	
	self shouldnt: [session runOperations: (Array with: operation)] raise: Error.

	graph delete.