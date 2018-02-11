attributes
at: attribute putStrings: anArrayOfStrings
	| status sizes strings pointers |
	sizes := anArrayOfStrings collect: [:str | str size].
	sizes := Int64Array externalFromArray: sizes.
	sizes useFinalization.
	strings := anArrayOfStrings collect: [:each | (self library externalizeString: each) useFinalization].
	pointers := ByteArray new: Smalltalk wordSize * strings size.
	strings withIndexDo: [:each :index |
		pointers pointerAt: index-1*Smalltalk wordSize+1 put: each].
	 
	status := TF_Status create.
	self library
		description: self
		set: attribute asAsciiZ
		toStrings: pointers
		sizes: sizes
		count: anArrayOfStrings size.
	status check
	