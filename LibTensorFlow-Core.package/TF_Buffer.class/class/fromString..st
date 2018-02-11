instance creation
fromString: aString
	^ TensorFlowCAPI current newBufferFromString: aString size: aString size