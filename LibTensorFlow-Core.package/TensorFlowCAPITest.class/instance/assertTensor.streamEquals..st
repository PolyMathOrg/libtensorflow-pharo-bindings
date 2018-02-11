testing tensor
assertTensor: aTF_Tensor streamEquals: tensorArray
	| strm |
	strm := aTF_Tensor asStream.
	tensorArray do: [:each |
		self assert: each equals: strm next].
