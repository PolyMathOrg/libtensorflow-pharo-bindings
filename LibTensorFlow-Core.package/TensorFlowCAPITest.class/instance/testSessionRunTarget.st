testing session
testSessionRunTarget
	| graph operation session |
	self halt.
	graph := self constantFloatGraphFromDef.
	session := TF_Session on: graph.
	operation := graph operationNamed: 'a'.
	session runOperation: operation.
	graph delete