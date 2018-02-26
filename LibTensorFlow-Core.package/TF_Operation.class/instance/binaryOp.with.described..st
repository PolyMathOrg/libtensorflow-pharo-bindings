ops binary
binaryOp: aString with: aTF_Operation described: oneArgBlock
	| name |
	name := self nameFor: aString.
	^ self
		binaryOp: aString
		with: aTF_Operation
		named: name
		described: oneArgBlock