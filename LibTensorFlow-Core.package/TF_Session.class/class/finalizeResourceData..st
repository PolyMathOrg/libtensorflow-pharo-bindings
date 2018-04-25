instance creation
finalizeResourceData: handle
	| status |
	handle isNull
		ifTrue: [ ^ self ].
	status := TF_Status create.
	(TensorFlowCAPI current) closeSession: handle status: status.
	status check.
	status := TF_Status create.
	(TensorFlowCAPI current) deleteSession: handle status: status.
	status check