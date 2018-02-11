converting
allStrings
	| total answer bytes data |
	total := self size.
	answer := WriteStream on: (Array new: total).
	bytes := self dataBytes.
	data := self data getHandle + (8 * total).
	1 to: total do: [:i |
		| offset str |
		offset := bytes unsignedLongLongAt: i - 1 * 8 + 1.
		str := self library stringDecode: data + offset.
		answer nextPut: str].
	
	^ answer contents