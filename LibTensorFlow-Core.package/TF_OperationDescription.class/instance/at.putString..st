attributes
at: attribute putString: aString
	| status |
	status := TF_Status create.
	self library
		description: self
		set: attribute asAsciiZ
		toString: aString
		size: aString size.
	status check
	