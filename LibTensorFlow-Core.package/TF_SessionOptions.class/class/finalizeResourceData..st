instance creation
finalizeResourceData: handle

	handle isNull ifTrue: [ ^ self ].
	(TensorFlowCAPI current) deleteSessionOptions: handle