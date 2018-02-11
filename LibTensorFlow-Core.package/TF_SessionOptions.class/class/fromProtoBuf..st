instance creation
fromProtoBuf: aString
	| answer |
	answer := self create.
	answer config: aString.
	^ answer