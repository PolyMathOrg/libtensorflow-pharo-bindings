printing
printOn: stream
	super printOn: stream.
	self isNull
		ifFalse: [ stream
				space;
				print: self codeText;
				space;
				print: self message ]