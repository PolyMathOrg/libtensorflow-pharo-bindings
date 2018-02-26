running
run
	| status |
	status := TF_Status create.
	self library
		runSession: self
		options: nil
		inputs: nil
		values: nil
		count: 0
		outputs: nil
		values: nil
		count: 0
		targets: nil
		count: 0
		metadata: nil
		status: status.
	status check