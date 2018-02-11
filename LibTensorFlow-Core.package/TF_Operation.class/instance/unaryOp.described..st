ops unary
unaryOp: aString described: oneArgBlock
	| name |
	name := self nameFor: aString.
	^ self unaryOp: aString named: name described: oneArgBlock