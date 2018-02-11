running
runInputs: inArrayOfTF_Outputs values: inArrayOfTF_Tensor outputs: outArrayOfTF_Outputs
	| session |
	session := TF_Session on: self.
	self initializeOn: session.
	^ session runInputs: inArrayOfTF_Outputs values: inArrayOfTF_Tensor outputs: outArrayOfTF_Outputs