strings
stringEncode: src to: dst size: dstSize
	| status answer |
	status := TF_Status create.
	answer := self
		stringEncode: src
		len: src size
		destination: dst
		len: dstSize
		status: status.
	status check.
	^ answer