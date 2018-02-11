initialize-release
fromBlock: aBlockClosure inputTypes: anArray
	| inputs index |
	index := 0.
	inputs := (1 to: aBlockClosure argumentCount) collect: [:each |
		index := index + 1.
		self inputType: (anArray at: index)].
	^ aBlockClosure valueWithArguments: inputs.
