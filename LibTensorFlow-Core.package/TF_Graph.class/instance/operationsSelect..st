accessing
operationsSelect: oneArgBlock
	| answer |
	answer := OrderedCollection new.
	
	self operationsSelect: oneArgBlock thenDo: [:op | answer add: op].
	
	^ answer asArray