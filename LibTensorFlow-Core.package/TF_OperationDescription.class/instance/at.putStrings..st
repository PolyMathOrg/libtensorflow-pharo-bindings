attributes
at: attribute putStrings: anArrayOfStrings
	| status sizes strings pointers |
	sizes := anArrayOfStrings collect: [:str | str size].
	sizes := FFIExternalArray externalNewType: 'int64' fromArray: sizes.
	sizes autoRelease.
	strings := anArrayOfStrings collect: [:each | (self library externalizeString: each) autoRelease].
	pointers := ByteArray new: Smalltalk wordSize * strings size.
	strings withIndexDo: [:each :index |
		pointers pointerAt: index-1*Smalltalk wordSize+1 put: each].
	 
	status := TF_Status create.
	self library
		description: self
		set: attribute asAsciiZ
		toStrings: pointers
		sizes: sizes getHandle
		count: anArrayOfStrings size.
	status check
	