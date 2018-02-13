initialization
initializeSession
	session := TF_Session on: graph.
	graph initializeOn: session.