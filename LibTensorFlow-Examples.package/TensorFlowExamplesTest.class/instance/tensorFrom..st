testing-NearesNeighbor
tensorFrom: points
	| rank transposed |
	rank := points first size.
	transposed := OrderedCollection new.
	(1 to: rank) do: [ :i |
		transposed add: OrderedCollection new ].
	points do: [ :point |
		point withIndexDo: [ :value :coordinate |
			(transposed at: coordinate) add: value ]].
	^ TF_Tensor fromFloats: transposed.