running
runOutputs: aTF_OutputArray size: anInteger
	| status outvalues |
	status := TF_Status create.
	outvalues := TF_TensorPtrArray new: anInteger.
	
	self library
		runSession: self options: nil
		inputs: nil values: nil count: 0
		outputs: aTF_OutputArray values: outvalues count: anInteger
		targets: nil count: 0
		metadata: nil status: status.
		
	status check.
	^ outvalues