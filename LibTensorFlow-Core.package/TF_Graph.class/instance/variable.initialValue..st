root operations
variable: nameString initialValue: aTF_Tensor
	| const var |
	var := self variable: nameString forTensor: aTF_Tensor.
	const := self const: nameString, '_initialValue' value: aTF_Tensor.
	var assign: const.
	^ var