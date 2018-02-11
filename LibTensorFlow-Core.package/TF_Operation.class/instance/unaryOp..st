ops unary
unaryOp: aString
	| name |
	name := self nameFor: aString.
	^ self unaryOp: aString named: name