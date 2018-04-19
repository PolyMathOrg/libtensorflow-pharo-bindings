testing
testOutputArrayAtPut
	| array size one other operation |
	size := 4.
	array := TF_OutputArray externalNew: size.
	operation := TF_Operation
		fromHandle: ExternalAddress new + 16rF1F2F3F4.
	one := TF_Output new.
	one index: 16r75F6F7F8.
	one operation: operation.
	other := array first.
	array first: one.
	self deny: one getHandle = other getHandle.
	self assert: one index equals: other index.
	self assert: one operation getHandle equals: other operation getHandle.
	operation := TF_Operation
		fromHandle: ExternalAddress new + 16r12345678.
	one index: 16r75F6F7F8.
	one operation: operation.
	1 to: size do: [ :index | 
		other := array at: index.
		array at: index put: one.
		self deny: one getHandle = other getHandle.
		self assert: one index equals: other index.
		self assert: one operation getHandle equals: other operation getHandle ]