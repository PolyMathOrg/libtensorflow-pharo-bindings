attributes
typeAt: nameString
	| value status |
	status := TF_Status create.
	value := ByteArray new: 8.
	self library operation: self attr: nameString asAsciiZ getType: value status: status.
	status check.
	^ value unsignedLongLongAt: 1
