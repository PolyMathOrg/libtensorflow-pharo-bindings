instance creation
externalNew: count
	| address answer |
	address := ExternalAddress gcallocate: self byteSize * count.
	answer := self fromHandle: address.
	^ answer