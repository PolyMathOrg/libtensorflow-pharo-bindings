accessing
printOn: aStream
	super printOn: aStream.
	aStream
		space;
		print: (self dataTypeAt: self type)