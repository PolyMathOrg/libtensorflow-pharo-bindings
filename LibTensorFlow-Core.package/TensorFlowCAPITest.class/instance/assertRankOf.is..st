testing tensor
assertRankOf: aMultidimensionalTensor is: anInteger
	| rank |
	rank := TF_Tensor rankOf: aMultidimensionalTensor.
	self
		assert: rank = anInteger
		description:
			'The rank is ' , rank printString , ' and should have been '
				, anInteger printString