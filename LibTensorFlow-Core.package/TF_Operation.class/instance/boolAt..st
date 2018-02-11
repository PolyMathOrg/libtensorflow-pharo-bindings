attributes
boolAt: nameString
	| value status |
	status := TF_Status create.
	value := ByteArray new: 1.
	self library
		operation: self
		attr: nameString asAsciiZ
		getBool: value
		status: status.
	status check.
	^ value booleanAt: 1