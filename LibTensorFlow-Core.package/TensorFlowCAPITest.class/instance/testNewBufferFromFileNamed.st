testing buffer
testNewBufferFromFileNamed
	| buffer string data temporaryFile |
	string := ' hola manola'.
	temporaryFile := 'temporaryFile.txt'.
	temporaryFile asFileReference writeStream
		nextPutAll: string;
		close.
	buffer := TF_Buffer fromFileNamed: temporaryFile.
	temporaryFile asFileReference delete.
	self deny: buffer isNull.
	self assert: buffer length equals: string size.
	data := buffer data fromCString first: string size.
	self assert: string equals: data.
	buffer delete.
	self assert: buffer isNull