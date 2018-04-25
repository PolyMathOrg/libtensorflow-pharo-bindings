instance creation
finalizeResourceData: handle

	handle isNull ifTrue: [ ^ self ].
	handle free