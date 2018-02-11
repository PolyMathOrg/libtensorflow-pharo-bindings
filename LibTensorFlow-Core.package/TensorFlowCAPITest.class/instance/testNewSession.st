testing session
testNewSession
	| graph session |
	graph := TF_Graph create.
	session := TF_Session on: graph.
	session ignoreFinalization.
	self deny: session isNull.
	session delete.
	self assert: session isNull