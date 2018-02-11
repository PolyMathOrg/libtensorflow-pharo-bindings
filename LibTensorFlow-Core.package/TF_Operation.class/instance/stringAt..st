attributes
stringAt: nameString
	| metadata value status |
	metadata := self attrMetadata: nameString.
	status := TF_Status create.
	value := ByteArray new: metadata totalSize .
	self library
		operation: self
		attr: nameString asAsciiZ
		getString: value
		size: metadata totalSize 
		status: status.
	status check.
	^ (value upTo: 0) asString
