testing buffer
testNewBufferFromString
	| buffer string data |
	string := ' hola manola'.
	buffer := TF_Buffer fromString: string.
	self deny: buffer isNull.
	self assert: buffer length equals: string size.
	data := buffer data fromCString first: string size.
	self assert: string equals: data.
	buffer delete.
	self assert: buffer isNull