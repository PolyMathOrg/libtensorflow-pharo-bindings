ops binary
\*\ aTF_Operation
	^ self
		binaryOp: 'MatMul'
		with: aTF_Operation
		described: [ :description | 
			description at: 'transpose_a' putBoolean: true.
			description at: 'transpose_b' putBoolean: true ]