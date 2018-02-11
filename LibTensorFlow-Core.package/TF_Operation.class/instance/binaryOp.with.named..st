ops binary
binaryOp: aString with: aTF_Operation named: name
	^ self binaryOp: aString with: aTF_Operation named: name described: [:nothing]
