instance creation
externalFromArray: anArray
	| answer |
	answer := self externalNew: anArray size.
	anArray withIndexDo: [ :each :index | answer at: index put: each ].
	^ answer