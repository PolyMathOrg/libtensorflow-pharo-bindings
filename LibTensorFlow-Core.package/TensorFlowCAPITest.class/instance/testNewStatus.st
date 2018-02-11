testing status
testNewStatus
	| status |
	status := TF_Status create.
	status ignoreFinalization.
	self deny: status isNull.
	status delete.
	self assert: status isNull