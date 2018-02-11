ops other
op: aString withAll: aTF_OperationArray described: oneArgBlock
	| name |
	name := self nameFor: aString.
	^ self op: aString withAll: aTF_OperationArray named: name described: oneArgBlock