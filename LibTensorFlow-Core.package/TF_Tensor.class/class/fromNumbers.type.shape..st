instance creation
fromNumbers: values type: type shape: shape
	| answer size count |
	size := self sizeOf: values.
	count := shape inject: 1 into: [ :a :b | a * b ].
	count = size
		ifFalse: [ self error: 'Inferred size and real size don''t match.' ].
	answer := self type: type shape: shape.
	self array: values type: type into: answer data getHandle.
	^ answer