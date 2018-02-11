testing strings
testStringEncode
	| size string encoded encodedSize |
	" This test assumes the internal representation of a TensorFlow string. May fail if they change it "
	string := 'a ver como queda este string encodeado?'.
	size := library stringEncodedSize: string.
	encoded := ByteArray new: size + 20.
	encodedSize := library stringEncode: string to: encoded.
	self assert: encodedSize equals: size.
	self assert: (encoded byteAt: 1) equals: string size.
	self assert: (encoded structAt: 2 length: string size) asString equals: string