learning
learn: sample with: expected
		| result |
	result := forward runOn: {sample. weights}.
	weights := backward runOn: {sample. weights. expected. result}.