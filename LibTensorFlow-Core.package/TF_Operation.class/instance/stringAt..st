attributes
stringAt: nameString
	| metadata value status |
	metadata := self attrMetadata: nameString.
	status := TF_Status create.
	value := ByteArray new: metadata total_size.
	self library
		operation: self
		attr: nameString asAsciiZ
		getString: value
		size: metadata total_size 
		status: status.
	status check.
	^ value asString
