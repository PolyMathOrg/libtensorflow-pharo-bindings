testing status
testStatusGetMessage
	| status message |
	status := TF_Status create.
	status code: 1 message: 'All is one'.
	message := status message.
	self assert: message equals: 'All is one'.
	status code: 7 message: 'Something is very seven'.
	message := status message.
	self assert: message equals: 'Something is very seven'