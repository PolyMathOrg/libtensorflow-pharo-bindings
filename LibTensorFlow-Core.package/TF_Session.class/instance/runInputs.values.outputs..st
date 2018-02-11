running
runInputs: inArrayOfTF_Outputs values: inArrayOfTF_Tensor outputs: outArrayOfTF_Outputs
	| inputs invalues outputs outvalues status |
	status := TF_Status create.
	inputs := TF_OutputArray externalFromArray: inArrayOfTF_Outputs.
	invalues := TF_TensorPtrArray externalFromArray: inArrayOfTF_Tensor.
	outputs := TF_OutputArray externalFromArray: outArrayOfTF_Outputs.
	outvalues := TF_TensorPtrArray new: outArrayOfTF_Outputs size.
	
	self library
		runSession: self options: nil
		inputs: inputs values: invalues count: inArrayOfTF_Outputs size
		outputs: outputs values: outvalues count: outArrayOfTF_Outputs size
		targets: nil count: 0
		metadata: nil status: status.
		
	status check.
	^ outvalues
