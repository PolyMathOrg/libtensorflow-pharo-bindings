testing tensor
testArrayFromStream
	| t template array |
	t := 1.0 asTensor.
	template := #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17) readStream.
	
	array := t arrayFromStream: template reset shape: #(10).
	self assert: #(1 2 3 4 5 6 7 8 9 10) equals: array.
	
	array := t arrayFromStream: template reset shape: #(2 8).
	self assert: #((1 2 3 4 5 6 7 8) (9 10 11 12 13 14 15 16)) equals: array.
	
	array := t arrayFromStream: template reset shape: #(2 4 2).
	self assert: #(((1 2) (3 4) (5 6) (7 8)) ((9 10) (11 12) (13 14) (15 16))) equals: array.
	