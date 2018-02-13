initialization
parse: aStream
	super parse: aStream.
	items := aStream upToEnd.
	
	