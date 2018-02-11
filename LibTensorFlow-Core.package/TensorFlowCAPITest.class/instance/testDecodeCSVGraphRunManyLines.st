testing operation
testDecodeCSVGraphRunManyLines
	| cols |
	cols := self testDecodeCSVGraphRunCSV:
	'1,2,3,4
	 11,22,33,44
	 111,222,333,444
	 1111,2222,3333,4444' lines.
	
	
	self assert: cols first equals: #(1 11 111 1111).
	self assert: cols second equals: #(2 22 222 2222).
	self assert: cols third equals: #(3 33 333 3333).
	self assert: cols fourth equals: #(4 44 444 4444).
	