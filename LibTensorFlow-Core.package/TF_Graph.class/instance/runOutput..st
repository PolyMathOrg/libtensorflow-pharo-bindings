running
runOutput: aTF_Output
	| session |
	session := TF_Session on: self.
	self initializeOn: session.
	^ session runOutput: aTF_Output