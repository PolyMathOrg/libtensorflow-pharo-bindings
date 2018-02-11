private
elementAtOffset: byteOffset
	^ self elementClass fromHandle: (handle longPointerAt: byteOffset)