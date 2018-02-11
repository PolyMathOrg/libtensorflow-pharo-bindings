utils
elementsOf: aMultidimensionalTensor
	| answer |
	answer := (Array new: (self sizeOf: aMultidimensionalTensor)) writeStream.
	self elementsOf: aMultidimensionalTensor do: [ :each | answer nextPut: each ].
	^ answer contents