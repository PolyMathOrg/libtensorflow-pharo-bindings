testing strings
testStringSize
	self assert: (library primStringEncodedSize: 0) equals: 0 + 1.
	self assert: (library primStringEncodedSize: 127) equals: 127 + 1.
	self assert: (library primStringEncodedSize: 128) equals: 128 + 2.
	self assert: (library primStringEncodedSize: 127 * 127) equals: 127 * 127 + 2.
	self assert: (library primStringEncodedSize: 127 * 127 + 123) equals: 127 * 127 + 123 + 2.
	self assert: (library primStringEncodedSize: 127 * 127 * 127) equals: 127 * 127 * 127 + 3.
	self assert: (library stringEncodedSize: '') equals: 0 + 1.
	self assert: (library stringEncodedSize: (String new: 127)) equals: 127 + 1.
	self assert: (library stringEncodedSize: (String new: 128)) equals: 128 + 2