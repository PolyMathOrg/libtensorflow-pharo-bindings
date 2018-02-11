ops other
op: aString withAll: aTF_OperationArray named: name described: oneArgBlock
	^ graph newOperation: aString named: name described: [:description |
		description addInput: self output.
		aTF_OperationArray do: [:each |
			| input |
			input := (each asOperationOn: graph) output.
			description addInput: input].
		oneArgBlock value: description].
	