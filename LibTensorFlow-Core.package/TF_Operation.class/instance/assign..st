ops binary
assign: aTF_Operation
	^ self
		binaryOp: 'Assign'
		with: aTF_Operation
		named: self name, '_initializer'