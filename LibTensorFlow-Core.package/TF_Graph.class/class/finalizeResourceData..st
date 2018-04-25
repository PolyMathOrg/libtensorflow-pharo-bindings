instance creation
finalizeResourceData: handle
	handle isNull ifTrue: [ ^ self ].
	(TensorFlowCAPI current) deleteGraph: handle
	