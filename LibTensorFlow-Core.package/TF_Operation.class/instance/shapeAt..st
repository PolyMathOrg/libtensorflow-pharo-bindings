attributes
shapeAt: nameString
	| value status size answer |
	size := (self attrMetadata: nameString) total_size.
	(size = -1) ifTrue:[^#()].
	status := TF_Status create.
	value := Int64Array externalNew: size.
	
	self library
		operation: self
		attr: nameString asAsciiZ
		getShape: value
		size: size
		status: status.
	status check.

	answer := (1 to: size) collect: [:i | value at: i].
	^ answer