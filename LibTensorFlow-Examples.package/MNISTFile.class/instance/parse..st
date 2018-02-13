initialization
parse: aStream
	magic := aStream nextUnsignedInt32BigEndian: true.
	count :=  aStream nextUnsignedInt32BigEndian: true.

	