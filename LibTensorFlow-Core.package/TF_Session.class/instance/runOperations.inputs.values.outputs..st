running
runOperations: anArrayOfTF_Operations inputs: inArrayOfTF_Outputs values: inArrayOfTF_Tensor outputs: outArrayOfTF_Outputs
	| operations inputs invalues outputs outvalues status |
	status := TF_Status create.
	operations := TF_OperationPtrArray fromCollection: anArrayOfTF_Operations.
	inputs := TF_OutputArray fromCollection: inArrayOfTF_Outputs.
	invalues := TF_TensorPtrArray fromCollection: inArrayOfTF_Tensor.
	outputs := TF_OutputArray fromCollection: outArrayOfTF_Outputs.
	outvalues := TF_TensorPtrArray externalNew: outArrayOfTF_Outputs size.
	
	self library
		runSession: self options: nil
		inputs: inputs getHandle values: invalues count: inArrayOfTF_Outputs size
		outputs: outputs getHandle values: outvalues count: outArrayOfTF_Outputs size
		targets: operations getHandle count: anArrayOfTF_Operations size
		metadata: nil status: status.
		
	status check.
	^ outvalues asArray
