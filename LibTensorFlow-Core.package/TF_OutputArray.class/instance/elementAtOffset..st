accessing
elementAtOffset: byteOffset
	^self elementClass fromHandle: (handle + (byteOffset - 1))
	
