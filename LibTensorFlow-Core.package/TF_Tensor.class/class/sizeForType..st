types
sizeForType: anInteger
	self typeFloat = anInteger ifTrue: [^4].
	self typeInt64 = anInteger ifTrue: [^8].
	self typeInt32 = anInteger ifTrue: [^4].
	self typeDouble = anInteger ifTrue: [^8].
	self typeBoolean = anInteger ifTrue: [^1].

"
8
		UInt8 4
		Int8 6
		QInt8 11
		QUInt8 12

16
		Int16 5
		BFloat16 14
		QInt16 15
		QUInt16 16
		UInt16 17
		Half 19

32
		Float 1
		Int32 3
		QInt32 13

64
		Double 2
		Complex64 8
		Int64 9

128
		Complex128 18

		String 7
		Resource 20).

		Bool 10
"


	^ self shouldBeImplemented.