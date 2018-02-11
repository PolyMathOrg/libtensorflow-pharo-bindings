instance creation
new: count
	^ self fromHandle: (ByteArray new: self byteSize * count)