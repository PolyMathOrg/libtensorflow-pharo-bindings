instance creation
fromInt64: value
	| answer |
	answer := self type: self typeInt64 shape: #().
	answer data getHandle signedLongLongAt: 1 put: value.
	^ answer