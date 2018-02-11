types
getterBlockFor: type
	TF_Tensor typeInt32 = type ifTrue: [^ [:data :offset | data signedLongAt: offset]].
	TF_Tensor typeInt64 = type ifTrue: [^ [:data :offset | data signedLongLongAt: offset]].
	TF_Tensor typeFloat = type ifTrue: [^ [:data :offset | data floatAt: offset]].
	TF_Tensor typeDouble = type ifTrue: [^ [:data :offset | data doubleAt: offset]].
	TF_Tensor typeBoolean = type ifTrue: [^ [:data :offset | data booleanAt: offset]].
	^ self shouldBeImplemented 