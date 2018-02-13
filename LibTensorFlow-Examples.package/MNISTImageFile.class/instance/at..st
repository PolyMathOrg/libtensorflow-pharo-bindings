accessing
at: imageIndex
	| bytes |
	bytes := self bytesAt: imageIndex.
	^ GrayForm extent: rows @ columns bits: bytes