attributes
at: attribute putShape: anIntegerArray
	| status value |
	value := Int64Array externalFromArray: anIntegerArray.
	status := TF_Status create.
	self library
		description: self
		set: attribute asAsciiZ
		toShape: value
		size: anIntegerArray size.
	status check