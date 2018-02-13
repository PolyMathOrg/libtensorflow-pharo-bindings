instance creation
fromStream: aStream
	| answer |
	answer := self new.
	^ answer parse: aStream