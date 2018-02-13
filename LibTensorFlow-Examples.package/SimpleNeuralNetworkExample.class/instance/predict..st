service
predict: sample
		| result |
	result := forward runOn: {sample. weights}.
	^ result allFloats 