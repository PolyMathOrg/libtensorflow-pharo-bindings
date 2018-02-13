initialization
parse: aStream
	super parse: aStream.
	rows := aStream nextUnsignedInt32BigEndian: true.
	columns := aStream nextUnsignedInt32BigEndian: true.
	items := aStream upToEnd.