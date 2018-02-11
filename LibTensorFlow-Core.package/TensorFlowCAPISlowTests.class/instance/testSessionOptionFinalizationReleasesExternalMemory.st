testing options
testSessionOptionFinalizationReleasesExternalMemory
	" WeakArray restartFinalizationProcess "

	| tries total handles |
	total := 0.
	tries := 10.
	handles := Set new.
	20
		timesRepeat: [ total := total + tries.
			handles
				addAll:
					((1 to: tries)
						collect: [ :i | 
							Smalltalk garbageCollect.
							TF_SessionOptions create getHandle ]).
			handles size < total
				ifTrue: [ ^ self ] ].
	self assert: handles size < total