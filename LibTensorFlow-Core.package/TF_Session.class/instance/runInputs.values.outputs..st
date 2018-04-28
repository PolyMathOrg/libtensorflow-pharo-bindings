running
runInputs: inArrayOfTF_Outputs values: inArrayOfTF_Tensor outputs: outArrayOfTF_Outputs
	| inputs invalues outputs outvalues status |
	status := TF_Status create.
	inputs := TF_OutputArray fromCollection: inArrayOfTF_Outputs.
	invalues := TF_TensorPtrArray fromCollection: inArrayOfTF_Tensor.
	outputs := TF_OutputArray fromCollection: outArrayOfTF_Outputs.
	outvalues := TF_TensorPtrArray externalNew: outArrayOfTF_Outputs size.
	
	self library
		runSession: self options: nil
		inputs: inputs getHandle values: invalues getHandle count: inArrayOfTF_Outputs size
		outputs: outputs getHandle values: outvalues getHandle count: outArrayOfTF_Outputs size
		targets: nil count: 0
		metadata: nil status: status.
		
	status check.
	^ outvalues asArray
