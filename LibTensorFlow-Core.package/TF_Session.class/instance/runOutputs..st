running
runOutputs: anArrayOfTF_Outputs
	| outputs |
	outputs := TF_OutputArray fromCollection: anArrayOfTF_Outputs.
	^ self runOutputs: outputs size: anArrayOfTF_Outputs size