testing
check
	self isOk
		ifFalse: [ Error signal: self codeText , ': ' , self message ]