root operations
variable: nameString initialValueFrom: aTF_Operation
	| output var shape |
	output := aTF_Operation output: 0.
	shape := self shapeOf: output.
	var := self variable: nameString type: output type shape: shape..
	var assign: aTF_Operation.
	^ var