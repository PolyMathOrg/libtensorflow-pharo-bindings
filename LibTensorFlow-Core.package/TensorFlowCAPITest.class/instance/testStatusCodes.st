testing status
testStatusCodes
	| status msg |
	status := TF_Status create.
	self assert: status isOk.
	self assert: status codeText equals: 'OK'.
	status check.
	msg := 'You cancelled it!'.
	status code: 1 message: msg.
	self assert: status codeText equals: 'CANCELLED'.
	self should: [ status check ] raiseError: 'CANCELLED: ' , msg