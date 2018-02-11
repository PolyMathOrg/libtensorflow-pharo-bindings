testing status
testStatusSetGetCode
	| status code |
	status := TF_Status create.
	status code: 1 message: ''.
	code := status code.
	self assert: code equals: 1.
	status code: 2 message: ''.
	code := status code.
	self assert: code equals: 2