testing tensor
testTensorShape: anArray
	| tensor shape size |
	tensor := TF_Tensor
		type: TF_Tensor typeInt64
		shape: anArray.
	self assert: tensor rank equals: anArray size.
	anArray withIndexDo: [:each :index |
		self assert: (tensor sizeOn: index - 1) equals: (anArray at: index)].
	shape := tensor shape.
	size := anArray isEmpty
		ifTrue: [1]
		ifFalse: [anArray product].
	self assert: shape equals: anArray.
	self assert: tensor size equals: size.
