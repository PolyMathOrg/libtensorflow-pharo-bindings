testing strings
testTensorFromString
	| tensor template |
	template := 'hola manola'.
	tensor := TF_Tensor fromString: template.
	self assert: tensor dataBytes first equals: template size.
	self assert: tensor dataBytes allButFirst asString equals: template