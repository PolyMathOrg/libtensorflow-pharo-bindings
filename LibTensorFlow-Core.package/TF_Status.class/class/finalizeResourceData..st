finalize resources
finalizeResourceData: handle

	handle isNull ifTrue: [ ^ self ].
	(TensorFlowCAPI current) deleteStatus: handle