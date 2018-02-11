running
runOutputs: anArrayOfTF_Outputs
	| session |
	session := TF_Session on: self.
	self initializeOn: session.
	^ session runOutputs: anArrayOfTF_Outputs