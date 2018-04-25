finalize resources
finalizeResourceData: handle

	handle isNull ifTrue: [ ^ self ].
	handle free