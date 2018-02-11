accessing
shape
	| answer count |
	count := self rank.
	answer := WriteStream on: (Array new: count).
	1 to: count do: [ :i | answer nextPut: (self sizeOn: i - 1) ].
	^ answer contents