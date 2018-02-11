ops binary
sizeOn: dimensionInteger
	^ self shape sliceFrom: {dimensionInteger} asInt32Tensor size: #(1) asInt32Tensor.