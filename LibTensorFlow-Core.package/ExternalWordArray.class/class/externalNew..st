instance creation
externalNew: count
	| address answer |
	self halt.
	address := ExternalAddress gcallocate: self byteSize * count.
	answer := self fromHandle: address.
	^ answer