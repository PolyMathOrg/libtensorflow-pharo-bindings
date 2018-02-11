running
runOperations: anArrayOfTF_Operations
	| status operations |
	status := TF_Status create.
	operations := TF_OperationPtrArray externalFromArray: anArrayOfTF_Operations.
	
	self library
		runSession: self options: nil
		inputs: nil values: nil count: 0
		outputs: nil values: nil count: 0
		targets: operations count: anArrayOfTF_Operations size
		metadata: nil status: status.
	status check
	