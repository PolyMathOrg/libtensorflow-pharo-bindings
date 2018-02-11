instance creation
fromStrings: aStringArray
	^ self fromStrings: aStringArray shape: (TF_Tensor shapeOf: aStringArray) allButLast.
