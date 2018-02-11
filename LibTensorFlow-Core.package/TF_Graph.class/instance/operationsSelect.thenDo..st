accessing
operationsSelect: conditionBlock thenDo: actionBlock
	| answer |
	answer := OrderedCollection new.
	
	self operationsDo: [:op |
		(conditionBlock value: op)
			ifTrue: [actionBlock value: op]].
	
	^ answer asArray