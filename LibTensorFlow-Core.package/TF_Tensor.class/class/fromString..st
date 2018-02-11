instance creation
fromString: aString
	| answer bytesize |
	bytesize := TensorFlowCAPI current stringEncodedSize: aString.
	bytesize := bytesize.
	answer := self type: self typeString shape: #() bytesize: bytesize.
	
	TensorFlowCAPI current
		stringEncode: aString
		to: answer data getHandle
		size: bytesize.
	^ answer