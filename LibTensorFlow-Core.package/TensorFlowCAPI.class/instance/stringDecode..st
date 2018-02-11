strings
stringDecode: src
	| destination status answer dstSize |
	destination := ByteArray new: 8.
	dstSize := ByteArray new: 8.
	status := TF_Status create.
	answer := self stringDecode: src len: src size destination: destination len: dstSize status: status.
	status check.
	dstSize := dstSize unsignedLongLongAt: 1.
	destination := destination pointerAt: 1.
	answer := (destination structAt: 1 length: dstSize) asString.
	^ answer