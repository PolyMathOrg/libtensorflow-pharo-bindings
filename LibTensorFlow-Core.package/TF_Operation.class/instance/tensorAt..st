attributes
tensorAt: nameString
	| value status |
	status := TF_Status create.
	value := ByteArray new: ExternalAddress wordSize.
	self library operation: self attr: nameString asAsciiZ getTensor: value status: status.
	status check.
	^ TF_Tensor fromHandle: (value pointerAt: 1)
