testing tensor
testTensorFinalizationReleasesExternalMemory
	" WeakArray restartFinalizationProcess "

	| handles template tries total |
	total := 0.
	tries := 20.
	handles := Set new.
	template := {(String new: 10).
	(String new: 100).
	(String new: 1000)}.
	20
		timesRepeat: [ total := total + tries.
			handles
				addAll:
					((1 to: tries)
						collect: [ :i | 
							Smalltalk garbageCollect.
							(TF_Tensor fromStringArray: template) getHandle ]).
			handles size < total
				ifTrue: [ ^ self ] ].
	self assert: handles size < total