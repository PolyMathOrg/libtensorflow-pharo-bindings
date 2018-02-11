testing graph
testInitializeOn
	| graph session |
	graph := TF_Graph create.
	session := TF_Session on: graph.
	graph initializeOn: session