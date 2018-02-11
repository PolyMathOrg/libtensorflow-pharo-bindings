testing strings
testStringDecode
	| size string encoded decoded status |
	" This test assumes the internal representation of a TensorFlow string. May fail if they change it "
	string := 'a ver como queda este string encodeado?'.
	status := TF_Status create.
	size := library stringEncodedSize: string.
	encoded := ExternalAddress gcallocate: size + 20.
	encoded byteAt: size + 1 put: $@ asciiValue.
	library
		stringEncode: string
		len: string size
		destination: encoded
		len: size + 20
		status: status.
	status check.
	decoded := library stringDecode: encoded.
	self deny: decoded = (string , '@').
	self assert: decoded equals: string