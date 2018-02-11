types
setterBlockFor: type
	TF_Tensor typeInt32 = type
		ifTrue: [ ^ [ :data :offset :value | data signedLongAt: offset put: value ] ].
	TF_Tensor typeInt64 = type
		ifTrue: [ ^ [ :data :offset :value | data signedLongLongAt: offset put: value ] ].
	TF_Tensor typeFloat = type
		ifTrue: [ ^ [ :data :offset :value | data floatAt: offset put: value ] ].
	TF_Tensor typeDouble = type
		ifTrue: [ ^ [ :data :offset :value | data doubleAt: offset put: value ] ].
	TF_Tensor typeBoolean = type
		ifTrue: [ ^ [ :data :offset :value | data booleanAt: offset put: value ] ].
	^ self shouldBeImplemented