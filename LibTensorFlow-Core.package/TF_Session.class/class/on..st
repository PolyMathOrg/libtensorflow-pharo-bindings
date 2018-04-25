instance creation
on: aTF_Graph
	| options status answer |
	options := TF_SessionOptions create.
	status := TF_Status create.
	answer := TensorFlowCAPI current newSession: aTF_Graph options: options status: status.
	status check.
	^ answer autoRelease