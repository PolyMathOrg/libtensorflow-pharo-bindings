accessing
operationsCount
	| answer |
	answer := 0.
	self operationsDo: [:each | answer := answer + 1].
	^ answer