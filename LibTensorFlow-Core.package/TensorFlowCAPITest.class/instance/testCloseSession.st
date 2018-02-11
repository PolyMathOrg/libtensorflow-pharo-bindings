testing session
testCloseSession
	| graph session |
	graph := TF_Graph create.
	session := TF_Session on: graph.
	self deny: session isNull.
	session ignoreFinalization.
	session close.
	session delete.
	self assert: session isNull