testing strings
testStringAsTensor
	| tensor template |
	template := 'hola manola'.
	tensor := template asTensor.
	self assert: tensor dataBytes first equals: template size.
	self assert: tensor dataBytes allButFirst asString equals: template