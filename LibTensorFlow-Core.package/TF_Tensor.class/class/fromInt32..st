instance creation
fromInt32: value
	| answer |
	answer := self type: self typeInt32 shape: #().
	answer data getHandle signedLongAt: 1 put: value.
	^ answer