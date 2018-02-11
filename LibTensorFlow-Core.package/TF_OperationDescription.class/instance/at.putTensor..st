attributes
at: attribute putTensor: aTF_Tensor
	| status |
	status := TF_Status create.
	self library
		description: self
		set: attribute asAsciiZ
		toTensor: aTF_Tensor
		status: status.
	status check