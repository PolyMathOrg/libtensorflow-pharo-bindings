root operations
const: nameString value: aTF_Tensor
	^ self
		newOperation: 'Const'
		named: nameString
		described: [ :description | 
			description at: 'dtype' putType: aTF_Tensor type.
			description at: 'value' putTensor: aTF_Tensor ]