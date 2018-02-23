inputs
addInputFromOutput: indexInteger of: aTF_Operation
	| input |
	input := aTF_Operation input: indexInteger.
	[ self library description: self addInput: input ]
		ensure: [ input free ]