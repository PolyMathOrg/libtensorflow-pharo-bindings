accessing
at: imageIndex
	| bytes |
	bytes := self bytesAt: imageIndex.
	^ Form extent: rows @ columns bits: bytes