testing strings
testStringEncodeExternal
	| size string encoded encodedSize status |
	" This test assumes the internal representation of a TensorFlow string. May fail if they change it "
	status := TF_Status create.
	string := 'a ver como queda este string encodeado?'.
	size := library stringEncodedSize: string.
	encoded := ExternalAddress gcallocate: size + 20.
	encodedSize := library
		stringEncode: string
		len: string size
		destination: encoded
		len: size + 20
		status: status.
	status check.
	self assert: encodedSize equals: size.
	self assert: (encoded unsignedByteAt: 1) equals: string size.
	self assert: (encoded structAt: 2 length: string size) asString equals: string