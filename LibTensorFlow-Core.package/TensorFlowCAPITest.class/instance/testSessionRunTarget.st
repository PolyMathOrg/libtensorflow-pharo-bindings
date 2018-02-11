testing session
testSessionRunTarget
	| graph operation session |
	graph := self constantFloatGraphFromDef.
	session := TF_Session on: graph.
	operation := graph operationNamed: 'a'.
	
	self shouldnt: [session runOperation: operation] raise: Error.

	graph delete.