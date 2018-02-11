testing
testUInt64ArrayAtPut
	self testArrayAtPutFor: Int64Array elementSample: 12345.
	self testArrayAtPutFor: Int64Array elementSample: 16rFE00FE00.
	self testArrayAtPutFor: Int64Array elementSample: 16r7E00FE00FE00FE00.
	self testArrayAtPutFor: Int64Array elementSample: 16r-7E00FE00FE00FE00