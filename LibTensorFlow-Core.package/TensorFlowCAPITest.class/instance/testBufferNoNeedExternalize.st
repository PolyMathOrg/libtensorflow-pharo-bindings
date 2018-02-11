testing buffer
testBufferNoNeedExternalize
	| buffer string data |
	string := ' hola manola'.
	buffer := TF_Buffer fromString: string.
	string := string copy.
	Smalltalk garbageCollect.
	data := buffer dataBytes.
	self assert: string equals: data asString.
	buffer delete