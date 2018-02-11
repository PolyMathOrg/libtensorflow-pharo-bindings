operations
newOperation: typeString named: aString described: aBlock
	| description answer |
	description := self newOperationDescription: typeString named: aString.
	aBlock value: description.
	answer := description finish.
	answer graph: self.
	^ answer