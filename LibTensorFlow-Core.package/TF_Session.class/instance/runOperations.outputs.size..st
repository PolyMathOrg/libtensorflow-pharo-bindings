running
runOperations: aTF_OperationArray outputs: aTF_OutputArray size: anInteger
	| status outvalues |
	status := TF_Status create.
	outvalues := TF_TensorPtrArray externalNew: anInteger.
	self library
		runSession: self
		options: nil
		inputs: nil
		values: nil
		count: 0
		outputs: aTF_OutputArray getHandle
		values: outvalues getHandle
		count: anInteger
		targets: aTF_OperationArray getHandle
		count: 1
		metadata: nil
		status: status.
	status check.
	^ outvalues asArray