attributes
stringsAt: nameString
	| status pointers sizes spaceRequired storage metadata valuesCount |
	metadata := self attrMetadata: nameString.
	spaceRequired := metadata totalSize.
	valuesCount := metadata listSize.
	pointers := ByteArray new: Smalltalk wordSize * valuesCount.
	sizes := (FFIExternalArray externalNewType: 'int64' size: valuesCount) autoRelease.
	storage := ExternalAddress gcallocate: spaceRequired.
	status := TF_Status create.
	self library
		operation: self
		attr: nameString asAsciiZ 
		getStrings: pointers
		sizes: sizes getHandle
		maxCount: valuesCount
		storage: storage
		size: spaceRequired
		status: status.
	status check.
	^ (1 to: valuesCount) collect: [:i |
		| one |
		one := pointers pointerAt: i-1*Smalltalk wordSize+1.
		one := one structAt: 1 length: (sizes at: i).
		one asString]