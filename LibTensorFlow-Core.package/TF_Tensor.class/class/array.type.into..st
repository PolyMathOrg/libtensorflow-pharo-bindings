utils
array: values type: type into: anExternalAddressOrByteArray
	| size index setter |
	size := self sizeForType: type.
	setter := self setterBlockFor: type.
	index := 0.
	self
		elementsOf: values
		do: [ :value | 
			setter value: anExternalAddressOrByteArray value: index * size + 1 value: value.
			index := index + 1 ]