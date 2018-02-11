ops binary
binaryOp: aString with: aTF_Operation named: name described: oneArgBlock
	^ self op: aString withAll: {aTF_Operation} named: name described: oneArgBlock