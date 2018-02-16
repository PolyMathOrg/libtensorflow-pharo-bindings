testing operation
testNewOperationDescription
	| graph description |
	graph := TF_Graph create.
	description := graph newOperationDescription: 'Const' named: 'first_operation'.
	self deny: description isNull.
	self should: [ description finish ] raise: Error description: 'This should have complained of missing attributes'