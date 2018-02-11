testing buffer
testBufferDataBytes
	| buffer string data |
	string := ' hola manola'.
	buffer := TF_Buffer fromString: string.
	data := buffer dataBytes.
	self assert: string equals: data asString.
	buffer delete