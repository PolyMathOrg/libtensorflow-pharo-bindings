initialize-release
fromBlock: aBlockClosure inputTypes: anArray named: nameString
	| previousContext answer |
	previousContext := context.
	context := context, nameString, '/'.
	answer := self fromBlock: aBlockClosure inputTypes: anArray.
	context := previousContext.
	^ answer