ops unary
unaryOp: aString named: name described: oneArgBlock
	^ self op: aString withAll: {} named: name described: oneArgBlock