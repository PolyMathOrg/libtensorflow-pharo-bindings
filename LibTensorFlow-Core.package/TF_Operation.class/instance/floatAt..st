attributes
floatAt: nameString
	| value status |
	status := TF_Status create.
	value := ByteArray new: 8.
	self library
		operation: self
		attr: nameString asAsciiZ
		getFloat: value
		status: status.
	status check.
	^ value floatAt: 1