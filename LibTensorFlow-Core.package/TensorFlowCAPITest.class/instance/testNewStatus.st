testing status
testNewStatus
	| status |
	status := TF_Status create.
	self deny: status isNull