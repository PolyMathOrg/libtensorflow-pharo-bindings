converting
asStream
	| answer |
	answer := ReadWriteStream on: (Array new: self size).
	self elementsDo: [ :each | answer nextPut: each ].
	^ answer