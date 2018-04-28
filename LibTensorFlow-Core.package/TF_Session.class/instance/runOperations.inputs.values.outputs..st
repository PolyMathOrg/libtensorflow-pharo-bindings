running
runOperations: anArrayOfTF_Operations inputs: inArrayOfTF_Outputs values: inArrayOfTF_Tensor outputs: outArrayOfTF_Outputs
	| operations inputs invalues outputs outvalues status |
	status := TF_Status create.
	operations := TF_OperationPtrArrayOld externalFromArray: anArrayOfTF_Operations.
	inputs := TF_OutputArrayOld externalFromArray: inArrayOfTF_Outputs.
	invalues := TF_TensorPtrArrayOld externalFromArray: inArrayOfTF_Tensor.
	outputs := TF_OutputArrayOld externalFromArray: outArrayOfTF_Outputs.
	outvalues := TF_TensorPtrArrayOld new: outArrayOfTF_Outputs size.
	
	self library
		runSession: self options: nil
		inputs: inputs values: invalues count: inArrayOfTF_Outputs size
		outputs: outputs values: outvalues count: outArrayOfTF_Outputs size
		targets: operations count: anArrayOfTF_Operations size
		metadata: nil status: status.
		
	status check.
	^ outvalues
