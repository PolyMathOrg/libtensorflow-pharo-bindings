testing tensor
testTensorFromInt32
	| tensor template values |
	template := -1123123123.
	tensor := TF_Tensor fromInt32: template.
	values := tensor allInt32s.
	self assert: tensor shape equals: #().
	self assert: tensor size equals: 1.
	self assert: tensor byteSize equals: 4.
	self assert: values equals: {template}