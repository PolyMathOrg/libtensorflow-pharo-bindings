root operations
const: aTF_Tensor
	| name |
	name := self nameFor: 'constant'.
	^ self const: name value: aTF_Tensor