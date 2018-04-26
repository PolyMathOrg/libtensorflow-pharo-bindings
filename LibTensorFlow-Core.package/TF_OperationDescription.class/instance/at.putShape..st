attributes
at: attribute putShape: anIntegerArray
	| status value |
	value := FFIExternalArray externalNewType: 'int64' fromArray: anIntegerArray.
	status := TF_Status create.
	self library
		description: self
		set: attribute asAsciiZ
		toShape: value getHandle
		size: anIntegerArray size.
	status check